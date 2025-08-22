import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../errors.dart';

/// Optional request configuration hook signature.
/// Allows injecting custom headers, logging, tracing, etc.
typedef RequestConfigurator = FutureOr<void> Function(http.BaseRequest);

/// Low-level HTTP service for handling requests, responses, and error mapping.
///
/// Handles:
/// - JSON encoding/decoding with error handling
/// - HTTP status code to exception mapping
/// - Request configuration hooks
/// - Response validation
class HttpService {
  HttpService({
    required this.httpClient,
    this.configureRequest,
  });

  final http.Client httpClient;
  final RequestConfigurator? configureRequest;

  /// Send an HTTP request and return decoded JSON.
  ///
  /// Throws [PlantaFormatException] for invalid JSON.
  /// Throws appropriate [PlantaApiException] subclasses for error status codes.
  Future<Map<String, dynamic>> sendRequest(
    http.Request Function() requestBuilder, {
    bool expectNoContent = false,
  }) async {
    final request = requestBuilder();
    if (configureRequest != null) {
      await configureRequest!(request);
    }

    final streamedResponse = await httpClient.send(request);
    final response = await http.Response.fromStream(streamedResponse);

    if (expectNoContent && response.statusCode == 204) {
      return <String, dynamic>{};
    }

    final json = response.body.isNotEmpty ? _decode(response) : <String, dynamic>{};
    _throwOnStatus(response, json);
    return json;
  }

  /// Robust JSON decoder that throws [PlantaFormatException] on invalid JSON.
  Map<String, dynamic> _decode(http.Response response) {
    try {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (_) {
      throw PlantaFormatException(
        'Response is not valid JSON (status ${response.statusCode}).',
      );
    }
  }

  /// Maps non-2xx statuses to strongly typed exceptions.
  void _throwOnStatus(http.Response response, Map<String, dynamic> json) {
    if (response.statusCode >= 200 && response.statusCode < 300) return;
    
    final status = response.statusCode;
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
  void close() => httpClient.close();
}