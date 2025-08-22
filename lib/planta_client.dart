/// Unofficial high-level entrypoint export library for the Planta API client.
///
/// This library consolidates key exports so consumers only need:
/// ```dart
/// import 'package:planta_client/planta_client.dart';
/// ```
///
/// Exposed:
/// - [PlantaApiClient] (main HTTP client)
/// - Token storage abstractions
/// - Data models (Freezed-based)
/// - Error classes
library;

import 'package:planta_client/planta_client.dart' show PlantaApiClient;
import 'package:planta_client/src/planta_api_client.dart' show PlantaApiClient;

export 'src/auth/token_store.dart';
export 'src/errors.dart';
export 'src/models/models.dart';
export 'src/planta_api_client.dart';
