import 'package:http/http.dart' as http;

import '../auth/token_store.dart';
import '../errors.dart';
import '../models/models.dart';
import 'authentication_service.dart';
import 'http_service.dart';

/// Service for handling plant-related operations.
///
/// Handles:
/// - Retrieving paginated plant lists
/// - Streaming all plants across multiple pages
/// - Fetching individual plants by ID
/// - Automatic token refresh on 401 responses
class PlantService {
  PlantService({
    required this.baseUrl,
    required this.tokenStore,
    required this.httpService,
    required this.authService,
  });

  final String baseUrl;
  final TokenStore tokenStore;
  final HttpService httpService;
  final AuthenticationService authService;

  /// Retrieve a single page (up to 50) of added plants.
  ///
  /// Use [cursor] for subsequent pages.
  /// If the returned [AddedPlantsPage] has [AddedPlantsPage.hasNext] true,
  /// call again with `page.pagination?.nextPage`.
  ///
  /// Throws:
  /// - [PlantaAuthException] if unauthenticated
  /// - [PlantaApiException] (or subclass)
  Future<AddedPlantsPage> getAddedPlants({String? cursor}) async {
    final uri = Uri.parse('$baseUrl/v1/addedPlants')
        .replace(queryParameters: cursor != null ? {'cursor': cursor} : null);
    
    final json = await _authedJsonGet(uri);
    final dataList = (json['data'] as List)
        .map((e) => AddedPlant.fromJson((e as Map).cast<String, dynamic>()))
        .toList();
    final pagination = json['pagination'] == null
        ? null
        : Pagination.fromJson(
            (json['pagination'] as Map).cast<String, dynamic>(),
          );
    return AddedPlantsPage(dataList, pagination);
  }

  /// Stream all added plants transparently over pagination.
  ///
  /// Continues until no `nextPage` is present or empty.
  /// Throws the same errors as [getAddedPlants] if any page fails.
  Stream<AddedPlant> streamAllAddedPlants() async* {
    String? cursor;
    do {
      final page = await getAddedPlants(cursor: cursor);
      for (final p in page.plants) {
        yield p;
      }
      cursor = page.pagination?.nextPage;
    } while (cursor != null && cursor.isNotEmpty);
  }

  /// Retrieve a single plant by its ID.
  ///
  /// Throws:
  /// - [PlantaNotFoundException] if plant does not exist
  /// - [PlantaAuthException] if unauthenticated
  /// - [PlantaApiException] or subclass for other errors
  Future<AddedPlant> getAddedPlant(String id) async {
    final uri = Uri.parse('$baseUrl/v1/addedPlants/$id');
    final json = await _authedJsonGet(uri);
    final data = (json['data'] as Map).cast<String, dynamic>();
    return AddedPlant.fromJson(data);
  }

  /// Convenience wrapper for authorized GET returning decoded JSON object.
  Future<Map<String, dynamic>> _authedJsonGet(Uri uri) async {
    return _authedRequest(() => http.Request('GET', uri));
  }

  /// Internal handler for authorized requests including:
  /// - attaching Authorization header
  /// - one-time automatic refresh on 401
  /// - JSON decoding
  Future<Map<String, dynamic>> _authedRequest(
    http.Request Function() requestBuilder,
  ) async {
    Future<Map<String, dynamic>> sendWithToken(Tokens tokens) async {
      final req = requestBuilder();
      req.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
      return httpService.sendRequest(() => req);
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