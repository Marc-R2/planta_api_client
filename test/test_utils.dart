import 'dart:convert';
import 'package:http/http.dart' as http;

/// Helper: produce a JSON response with status & optional headers.
http.Response jsonResponse(
  Object data,
  int status, {
  Map<String, String>? headers,
}) {
  return http.Response(
    jsonEncode(data),
    status,
    headers: {
      'content-type': 'application/json',
      ...?headers,
    },
  );
}

/// Helper: plain text response (used to trigger format decode errors).
http.Response textResponse(
  String body,
  int status, {
  Map<String, String>? headers,
}) {
  return http.Response(
    body,
    status,
    headers: {
      'content-type': 'text/plain',
      ...?headers,
    },
  );
}
