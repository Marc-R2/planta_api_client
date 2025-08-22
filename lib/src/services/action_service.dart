import 'dart:convert';
import 'package:http/http.dart' as http;

import '../auth/token_store.dart';
import '../errors.dart';
import '../models/models.dart';
import 'authentication_service.dart';
import 'http_service.dart';

/// Service for handling plant action operations.
///
/// Handles:
/// - Completing care actions (watering, fertilizing, etc.)
/// - Automatic token refresh on 401 responses
class ActionService {
  ActionService({
    required this.baseUrl,
    required this.tokenStore,
    required this.httpService,
    required this.authService,
  });

  final String baseUrl;
  final TokenStore tokenStore;
  final HttpService httpService;
  final AuthenticationService authService;

  /// Complete a plant care action (e.g., watering, fertilizing, etc.).
  ///
  /// On success, API responds with 204 (No Content).
  ///
  /// Throws:
  /// - [PlantaBadRequestException] for invalid action type
  /// - [PlantaAuthException] if unauthenticated or token invalid
  /// - [PlantaApiException] or subclass for other errors
  Future<void> completeAction({
    required String plantId,
    required ActionType actionType,
  }) async {
    final uri = Uri.parse('$baseUrl/v1/addedPlants/$plantId/actions/complete');
    final body = jsonEncode({'actionType': actionType.apiValue});
    
    await _authedRequest(
      () => http.Request('POST', uri)
        ..headers['Content-Type'] = 'application/json'
        ..body = body,
      expectNoContent: true,
    );
  }

  /// Internal handler for authorized requests including:
  /// - attaching Authorization header
  /// - one-time automatic refresh on 401
  /// - JSON decoding (unless 204 + [expectNoContent])
  Future<Map<String, dynamic>> _authedRequest(
    http.Request Function() requestBuilder, {
    bool expectNoContent = false,
  }) async {
    Future<Map<String, dynamic>> sendWithToken(Tokens tokens) async {
      final req = requestBuilder();
      req.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
      return httpService.sendRequest(() => req, expectNoContent: expectNoContent);
    }

    var tokens = await tokenStore.read();
    if (tokens == null) {
      throw PlantaAuthException('Not authenticated. Call authorize() first.');
    }

    try {
      return await sendWithToken(tokens);
    } on PlantaAuthException {
      // Attempt refresh once on 401
      tokens = await authService.refresh();
      return sendWithToken(tokens);
    }
  }
}