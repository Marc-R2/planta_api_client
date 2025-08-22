import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:planta_client/planta_client.dart';
import 'package:planta_client/src/services/http_service.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  group('HttpService', () {
    test('sendRequest with valid JSON response', () async {
      final mockClient = MockClient((request) async {
        return jsonResponse({'status': 200, 'data': 'success'}, 200);
      });

      final service = HttpService(httpClient: mockClient);
      final result = await service.sendRequest(
        () => http.Request('GET', Uri.parse('https://example.com/test')),
      );

      expect(result['status'], 200);
      expect(result['data'], 'success');
      service.close();
    });

    test('sendRequest with expectNoContent=true returns empty map on 204', () async {
      final mockClient = MockClient((request) async {
        return http.Response('', 204);
      });

      final service = HttpService(httpClient: mockClient);
      final result = await service.sendRequest(
        () => http.Request('POST', Uri.parse('https://example.com/test')),
        expectNoContent: true,
      );

      expect(result, isEmpty);
      service.close();
    });

    test('sendRequest handles empty response body', () async {
      final mockClient = MockClient((request) async {
        return http.Response('', 200);
      });

      final service = HttpService(httpClient: mockClient);
      final result = await service.sendRequest(
        () => http.Request('GET', Uri.parse('https://example.com/test')),
      );

      expect(result, isEmpty);
      service.close();
    });

    test('sendRequest throws PlantaFormatException on invalid JSON', () async {
      final mockClient = MockClient((request) async {
        return textResponse('invalid json {', 200);
      });

      final service = HttpService(httpClient: mockClient);
      
      expect(
        () => service.sendRequest(
          () => http.Request('GET', Uri.parse('https://example.com/test')),
        ),
        throwsA(isA<PlantaFormatException>()),
      );
      service.close();
    });

    group('HTTP status code mapping', () {
      final testCases = [
        (400, PlantaBadRequestException, 'Bad Request'),
        (401, PlantaAuthException, 'Unauthorized'),
        (404, PlantaNotFoundException, 'Not Found'),
        (500, PlantaServerException, 'Internal Server Error'),
        (418, PlantaApiException, 'I\'m a teapot'), // Other status
      ];

      for (final (statusCode, exceptionType, message) in testCases) {
        test('maps $statusCode to $exceptionType', () async {
          final mockClient = MockClient((request) async {
            return jsonResponse({
              'status': statusCode,
              'message': message,
              'errorType': 'test_error',
            }, statusCode);
          });

          final service = HttpService(httpClient: mockClient);
          
          expect(
            () => service.sendRequest(
              () => http.Request('GET', Uri.parse('https://example.com/test')),
            ),
            throwsA(isA<PlantaApiException>().having(
              (e) => e.runtimeType,
              'exception type',
              exceptionType,
            )),
          );
          service.close();
        });
      }
    });

    test('configureRequest hook is called', () async {
      var hookCalled = false;
      String? capturedHeader;

      final mockClient = MockClient((request) async {
        capturedHeader = request.headers['X-Custom-Header'];
        return jsonResponse({'success': true}, 200);
      });

      final service = HttpService(
        httpClient: mockClient,
        configureRequest: (request) {
          hookCalled = true;
          request.headers['X-Custom-Header'] = 'test-value';
        },
      );

      await service.sendRequest(
        () => http.Request('GET', Uri.parse('https://example.com/test')),
      );

      expect(hookCalled, isTrue);
      expect(capturedHeader, 'test-value');
      service.close();
    });

    test('exception includes errorType when provided', () async {
      final mockClient = MockClient((request) async {
        return jsonResponse({
          'status': 400,
          'message': 'Validation failed',
          'errorType': 'validation_error',
        }, 400);
      });

      final service = HttpService(httpClient: mockClient);
      
      try {
        await service.sendRequest(
          () => http.Request('GET', Uri.parse('https://example.com/test')),
        );
        fail('Expected exception to be thrown');
      } on PlantaBadRequestException catch (e) {
        expect(e.message, 'Validation failed');
        expect(e.errorType, 'validation_error');
        expect(e.statusCode, 400);
      }
      service.close();
    });

    test('exception uses default message when none provided', () async {
      final mockClient = MockClient((request) async {
        return jsonResponse({'status': 500}, 500);
      });

      final service = HttpService(httpClient: mockClient);
      
      try {
        await service.sendRequest(
          () => http.Request('GET', Uri.parse('https://example.com/test')),
        );
        fail('Expected exception to be thrown');
      } on PlantaServerException catch (e) {
        expect(e.message, 'Unknown error');
        expect(e.statusCode, 500);
      }
      service.close();
    });

    test('2xx status codes do not throw exceptions', () async {
      for (final statusCode in [200, 201, 202, 204, 299]) {
        final mockClient = MockClient((request) async {
          return jsonResponse({'status': statusCode}, statusCode);
        });

        final service = HttpService(httpClient: mockClient);
        
        // Should not throw
        await service.sendRequest(
          () => http.Request('GET', Uri.parse('https://example.com/test')),
          expectNoContent: statusCode == 204,
        );
        service.close();
      }
    });
  });
}