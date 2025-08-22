/// Base exception for all Planta API-related failures.
///
/// Subclasses represent specific error categories (auth, not found, etc.)
class PlantaApiException implements Exception {
  PlantaApiException(this.message, {this.statusCode, this.errorType});

  /// Human-readable message.
  final String message;

  /// HTTP status code where applicable.
  final int? statusCode;

  /// API-provided error type string (if present).
  final String? errorType;

  @override
  String toString() =>
      'PlantaApiException(status=$statusCode, type=$errorType, message=$message)';
}

/// Authentication / authorization failure (401).
class PlantaAuthException extends PlantaApiException {
  PlantaAuthException(super.message, {super.errorType})
      : super(statusCode: 401);
}

/// Resource not found (404).
class PlantaNotFoundException extends PlantaApiException {
  PlantaNotFoundException(super.message, {super.errorType})
      : super(statusCode: 404);
}

/// Bad request / validation error (400).
class PlantaBadRequestException extends PlantaApiException {
  PlantaBadRequestException(super.message, {super.errorType})
      : super(statusCode: 400);
}

/// Server-side error (500).
class PlantaServerException extends PlantaApiException {
  PlantaServerException(super.message, {super.errorType})
      : super(statusCode: 500);
}

/// Non-HTTP parse/format issue (e.g., invalid JSON).
class PlantaFormatException extends PlantaApiException {
  PlantaFormatException(super.message)
      : super(statusCode: null, errorType: 'format_error');
}
