import 'dart:convert';
import 'package:http/http.dart' as http;

import '../auth/token_store.dart';
import '../errors.dart';
import '../models/models.dart';
import 'http_service.dart';

/// Service for handling authentication operations.
///
/// Handles:
/// - OTP authorization to obtain access & refresh tokens
/// - Token refresh using stored refresh tokens
/// - Token storage management
class AuthenticationService {
  AuthenticationService({
    required this.baseUrl,
    required this.tokenStore,
    required this.httpService,
  });

  final String baseUrl;
  final TokenStore tokenStore;
  final HttpService httpService;

  /// Authorize using an OTP code and persist resulting tokens.
  ///
  /// Throws:
  /// - [PlantaFormatException] if response body is not valid JSON
  /// - [PlantaApiException] (or subclass) on error HTTP statuses
  Future<Tokens> authorize(String otpCode) async {
    final json = await httpService.sendRequest(
      () => http.Request('POST', Uri.parse('$baseUrl/v1/auth/authorize'))
        ..headers['Content-Type'] = 'application/json'
        ..body = jsonEncode({'code': otpCode}),
    );

    final tokens = Tokens.fromJson((json['data'] as Map).cast<String, dynamic>());
    await tokenStore.save(tokens);
    return tokens;
  }

  /// Refresh existing tokens using stored refresh token.
  ///
  /// Throws:
  /// - [PlantaAuthException] if no refresh token exists
  /// - [PlantaFormatException] if response body is not valid JSON
  /// - [PlantaApiException] (or subclass) on error HTTP statuses
  Future<Tokens> refresh() async {
    final current = await tokenStore.read();
    if (current == null || current.refreshToken == null) {
      throw PlantaAuthException('No refresh token available.');
    }

    final json = await httpService.sendRequest(
      () => http.Request('POST', Uri.parse('$baseUrl/v1/auth/refreshToken'))
        ..headers['Content-Type'] = 'application/json'
        ..body = jsonEncode({'refreshToken': current.refreshToken}),
    );

    final tokens = Tokens.fromJson((json['data'] as Map).cast<String, dynamic>());
    await tokenStore.save(tokens);
    return tokens;
  }

  /// Get current tokens from storage.
  Future<Tokens?> getCurrentTokens() => tokenStore.read();

  /// Clear stored tokens.
  Future<void> clearTokens() => tokenStore.clear();
}