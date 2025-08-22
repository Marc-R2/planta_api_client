import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:planta_client/src/auth/token_store.dart';
import 'package:planta_client/src/models/models.dart';
import 'package:planta_client/src/services/services.dart';

/// Default base URL for the public Planta API.
/// Can be overridden (e.g., tests, staging).
const String defaultBaseUrl = 'https://public.planta-api.com';

/// Optional request configuration hook signature.
/// Allows injecting custom headers, logging, tracing, etc.
typedef RequestConfigurator = FutureOr<void> Function(http.BaseRequest);

/// High-level Planta API client facade.
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
  }) : _http = httpClient ?? http.Client() {
    _httpService = HttpService(
      httpClient: _http,
      configureRequest: configureRequest,
    );
    _authService = AuthenticationService(
      baseUrl: baseUrl,
      tokenStore: tokenStore,
      httpService: _httpService,
    );
    _plantService = PlantService(
      baseUrl: baseUrl,
      tokenStore: tokenStore,
      httpService: _httpService,
      authService: _authService,
    );
    _actionService = ActionService(
      baseUrl: baseUrl,
      tokenStore: tokenStore,
      httpService: _httpService,
      authService: _authService,
    );
  }

  /// Base URL used for all API endpoints.
  final String baseUrl;

  final http.Client _http;

  /// Token storage (in-memory or persistent implementation).
  final TokenStore tokenStore;

  /// Optional hook executed before each outgoing authed request.
  final RequestConfigurator? configureRequest;

  // Services
  late final HttpService _httpService;
  late final AuthenticationService _authService;
  late final PlantService _plantService;
  late final ActionService _actionService;

  /// Authorize using an OTP code and persist resulting tokens.
  ///
  /// Throws:
  /// - [PlantaFormatException] if response body is not valid JSON
  /// - [PlantaApiException] (or subclass) on error HTTP statuses
  Future<Tokens> authorize(String otpCode) => _authService.authorize(otpCode);

  /// Refresh existing tokens using stored refresh token.
  ///
  /// Throws:
  /// - [PlantaAuthException] if no refresh token exists
  /// - [PlantaFormatException] if response body is not valid JSON
  /// - [PlantaApiException] (or subclass) on error HTTP statuses
  Future<Tokens> refresh() => _authService.refresh();

  /// Retrieve a single page (up to 50) of added plants.
  ///
  /// Use [cursor] for subsequent pages.
  /// If the returned [AddedPlantsPage] has [AddedPlantsPage.hasNext] true,
  /// call again with `page.pagination?.nextPage`.
  ///
  /// Throws:
  /// - [PlantaAuthException] if unauthenticated
  /// - [PlantaApiException] (or subclass)
  Future<AddedPlantsPage> getAddedPlants({String? cursor}) =>
      _plantService.getAddedPlants(cursor: cursor);

  /// Stream all added plants transparently over pagination.
  ///
  /// Continues until no `nextPage` is present or empty.
  /// Throws the same errors as [getAddedPlants] if any page fails.
  Stream<AddedPlant> streamAllAddedPlants() => _plantService.streamAllAddedPlants();

  /// Retrieve a single plant by its ID.
  ///
  /// Throws:
  /// - [PlantaNotFoundException] if plant does not exist
  /// - [PlantaAuthException] if unauthenticated
  /// - [PlantaApiException] or subclass for other errors
  Future<AddedPlant> getAddedPlant(String id) => _plantService.getAddedPlant(id);

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
  }) => _actionService.completeAction(plantId: plantId, actionType: actionType);

  /// Release underlying HTTP resources.
  void close() => _httpService.close();
}
