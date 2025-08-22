import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:planta_client/src/auth/token_store.dart';
import 'package:planta_client/src/errors.dart';
import 'package:planta_client/src/models/models.dart';

/// Default base URL for the public Planta API.
/// Can be overridden (e.g., tests, staging).
const String defaultBaseUrl = 'https://public.planta-api.com';

/// Optional request configuration hook signature.
/// Allows injecting custom headers, logging, tracing, etc.
typedef RequestConfigurator = FutureOr<void> Function(http.BaseRequest);

/// High-level Planta API client.
///
/// Features:
/// - OTP authorization to obtain access & refresh tokens
/// - Token refresh
/// - List paginated added plants
/// - Retrieve single plant
/// - Complete an action (watering, fertilizing, etc.)
/// - Automatic one-time refresh on 401 responses
///
/// Error Handling:
/// - Maps common HTTP statuses to custom exceptions
/// - Uses defensive JSON parsing with custom DateTime converter
///
/// Pagination:
/// - Use [getAddedPlants] for single pages
/// - Use [streamAllAddedPlants] to iterate through all pages seamlessly
///
/// Thread Safety:
/// - Not inherently thread-safe; single-instance usage per isolate recommended
///
/// Lifecycle:
/// - Call [close] when finished to release the underlying HTTP client
class PlantaApiClient {
  /// Create a [PlantaApiClient].
  ///
  /// [tokenStore] is required. Provide an optional [httpClient] for dependency
  /// injection (tests) or custom behavior. Provide [configureRequest] to
  /// attach custom headers, correlation IDs, etc.
  PlantaApiClient({
    required this.tokenStore,
    this.baseUrl = defaultBaseUrl,
    http.Client? httpClient,
    this.configureRequest,
  }) : _http = httpClient ?? http.Client();

  /// Base URL used for all API endpoints.
  final String baseUrl;

  final http.Client _http;

  /// Token storage (in-memory or persistent implementation).
  final TokenStore tokenStore;

  /// Optional hook executed before each outgoing authed request.
  final RequestConfigurator? configureRequest;

  /// Authorize using an OTP code and persist resulting tokens.
  ///
  /// Throws:
  /// - [PlantaFormatException] if response body is not valid JSON
  /// - [PlantaApiException] (or subclass) on error HTTP statuses
  Future<Tokens> authorize(String otpCode) async {
    final res = await _http.post(
      Uri.parse('$baseUrl/v1/auth/authorize'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'code': otpCode}),
    );
    final json = _decode(res);
    _throwOnStatus(res, json);
    final tokens =
        Tokens.fromJson((json['data'] as Map).cast<String, dynamic>());
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
    final res = await _http.post(
      Uri.parse('$baseUrl/v1/auth/refreshToken'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refreshToken': current.refreshToken}),
    );
    final json = _decode(res);
    _throwOnStatus(res, json);
    final tokens =
        Tokens.fromJson((json['data'] as Map).cast<String, dynamic>());
    await tokenStore.save(tokens);
    return tokens;
  }

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

  /// Convenience wrapper for authorized GET returning decoded JSON object.
  Future<Map<String, dynamic>> _authedJsonGet(Uri uri) async {
    final resJson = await _authedRequest(() => http.Request('GET', uri));
    return resJson;
  }

  /// Internal handler for authorized requests (GET/POST) including:
  /// - attaching Authorization header
  /// - one-time automatic refresh on 401
  /// - JSON decoding (unless 204 + [expectNoContent])
  Future<Map<String, dynamic>> _authedRequest(
    http.Request Function() requestBuilder, {
    bool expectNoContent = false,
  }) async {
    Future<http.StreamedResponse> sendWithToken(Tokens tokens) async {
      final req = requestBuilder();
      req.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
      if (configureRequest != null) {
        await configureRequest!(req);
      }
      return _http.send(req);
    }

    var tokens = await tokenStore.read();
    if (tokens == null) {
      throw PlantaAuthException('Not authenticated. Call authorize() first.');
    }

    var streamed = await sendWithToken(tokens);
    if (streamed.statusCode == 401) {
      // Attempt refresh once
      tokens = await refresh();
      streamed = await sendWithToken(tokens);
    }

    final res = await http.Response.fromStream(streamed);
    if (expectNoContent && res.statusCode == 204) {
      return <String, dynamic>{};
    }
    final json = res.body.isNotEmpty ? _decode(res) : <String, dynamic>{};
    _throwOnStatus(res, json);
    return json;
  }

  /// Robust JSON decoder that throws [PlantaFormatException] on invalid JSON.
  Map<String, dynamic> _decode(http.Response res) {
    try {
      return jsonDecode(res.body) as Map<String, dynamic>;
    } catch (_) {
      throw PlantaFormatException(
        'Response is not valid JSON (status ${res.statusCode}).',
      );
    }
  }

  /// Maps non-2xx statuses to strongly typed exceptions.
  void _throwOnStatus(http.Response res, Map<String, dynamic> json) {
    if (res.statusCode >= 200 && res.statusCode < 300) return;
    final status = res.statusCode;
    final message = json['message']?.toString() ?? 'Unknown error';
    final errorType = json['errorType']?.toString();

    switch (status) {
      case 400:
        throw PlantaBadRequestException(message, errorType: errorType);
      case 401:
        throw PlantaAuthException(message, errorType: errorType);
      case 404:
        throw PlantaNotFoundException(message, errorType: errorType);
      case 500:
        throw PlantaServerException(message, errorType: errorType);
      default:
        throw PlantaApiException(
          message,
          statusCode: status,
          errorType: errorType,
        );
    }
  }

  /// Release underlying HTTP resources.
  void close() => _http.close();
}
