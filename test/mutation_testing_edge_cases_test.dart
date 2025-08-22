import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:planta_client/planta_client.dart';
import 'package:planta_client/src/services/http_service.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

/// Edge case tests designed specifically for mutation testing resilience.
/// These tests verify critical logic that mutation testing would attempt to break.
void main() {
  group('Mutation Testing Edge Cases', () {
    late InMemoryTokenStore store;

    setUp(() {
      store = InMemoryTokenStore();
    });

    group('Authentication Logic Mutations', () {
      test('refresh token null check is essential', () async {
        // Store tokens with explicitly null refresh token
        await store.save(const Tokens(
          accessToken: 'access',
          refreshToken: null, // Mutation: remove null check
          tokenType: 'Bearer',
        ));

        final client = _clientWithRoutes({}, store: store);

        // Must throw PlantaAuthException when refresh token is null
        expect(
          () => client.refresh(),
          throwsA(isA<PlantaAuthException>()
            .having((e) => e.message, 'message', contains('No refresh token'))),
        );
        client.close();
      });

      test('authorization header format is critical', () async {
        await store.save(const Tokens(
          accessToken: 'test_token',
          refreshToken: 'refresh',
          tokenType: 'Bearer',
        ));

        var capturedHeader = '';
        final client = _clientWithRoutes({
          '/v1/addedPlants': (r) {
            capturedHeader = r.headers['Authorization'] ?? '';
            return jsonResponse({'status': 200, 'data': []}, 200);
          },
        }, store: store);

        await client.getAddedPlants();

        // Mutation: change "Bearer " to something else would break auth
        expect(capturedHeader, 'Bearer test_token');
        client.close();
      });

      test('token store operations must be atomic', () async {
        var saveCallCount = 0;
        final mockStore = _MockTokenStore(() => saveCallCount++);

        final client = _clientWithRoutes({
          '/v1/auth/authorize': (r) => jsonResponse({
            'status': 200,
            'data': {
              'accessToken': 'new_access',
              'refreshToken': 'new_refresh',
              'tokenType': 'Bearer',
            },
          }, 200),
        }, store: mockStore);

        await client.authorize('123456');

        // Mutation: removing save() call would break token persistence
        expect(saveCallCount, 1);
        client.close();
      });
    });

    group('HTTP Status Code Logic Mutations', () {
      test('401 retry logic must be exactly once', () async {
        await store.save(const Tokens(
          accessToken: 'old_token',
          refreshToken: 'refresh_token',
          tokenType: 'Bearer',
        ));

        var requestCount = 0;
        var refreshCount = 0;

        final client = _clientWithRoutes({
          '/v1/addedPlants': (r) {
            requestCount++;
            if (requestCount <= 2) {
              // Always return 401 to test retry limit
              return jsonResponse({'status': 401, 'message': 'Unauthorized'}, 401);
            }
            return jsonResponse({'status': 200, 'data': []}, 200);
          },
          '/v1/auth/refreshToken': (r) {
            refreshCount++;
            return jsonResponse({
              'status': 200,
              'data': {
                'accessToken': 'refreshed_token',
                'refreshToken': 'new_refresh',
                'tokenType': 'Bearer',
              },
            }, 200);
          },
        }, store: store);

        // Should throw after one retry attempt
        expect(
          () => client.getAddedPlants(),
          throwsA(isA<PlantaAuthException>()),
        );

        // Mutation: changing retry limit would either cause infinite loops or no retries
        expect(requestCount, 2); // Initial + 1 retry
        expect(refreshCount, 1); // Exactly one refresh attempt
        client.close();
      });

      test('status code boundaries are critical', () async {
        await store.save(const Tokens(
          accessToken: 'access',
          refreshToken: 'refresh',
          tokenType: 'Bearer',
        ));

        final statusTests = [
          (199, PlantaApiException), // Just below 200
          (200, null), // Success
          (299, null), // Success
          (300, PlantaApiException), // Just above 299
          (399, PlantaApiException), // Just below 400
          (400, PlantaBadRequestException), // Bad request
          (401, PlantaAuthException), // Auth error
          (404, PlantaNotFoundException), // Not found
          (500, PlantaServerException), // Server error
          (599, PlantaServerException), // Still server error
          (600, PlantaApiException), // Generic error
        ];

        for (final (statusCode, expectedType) in statusTests) {
          final mockClient = MockClient((request) async {
            return jsonResponse({
              'status': statusCode,
              'message': 'Test error',
            }, statusCode);
          });

          final httpService = HttpService(httpClient: mockClient);

          if (expectedType == null) {
            // Should not throw for 2xx
            expect(statusCode >= 200 && statusCode < 300, isTrue);
            await httpService.sendRequest(
              () => http.Request('GET', Uri.parse('https://test.api/test')),
            );
          } else {
            expect(
              () => httpService.sendRequest(
                () => http.Request('GET', Uri.parse('https://test.api/test')),
              ),
              throwsA(isA<PlantaApiException>().having(
                (e) => e.runtimeType,
                'exception type',
                expectedType,
              )),
            );
          }
          httpService.close();
        }
      });
    });

    group('Pagination Logic Mutations', () {
      test('cursor handling logic is essential', () async {
        await store.save(const Tokens(
          accessToken: 'access',
          refreshToken: 'refresh',
          tokenType: 'Bearer',
        ));

        var pageCount = 0;
        final client = _clientWithRoutes({
          '/v1/addedPlants': (r) {
            pageCount++;
            final cursor = r.url.queryParameters['cursor'];

            if (pageCount == 1) {
              expect(cursor, isNull); // First request has no cursor
              return jsonResponse({
                'status': 200,
                'data': [{'id': 'plant1'}],
                'pagination': {'nextPage': 'page2', 'hasNext': true},
              }, 200);
            } else if (pageCount == 2) {
              expect(cursor, 'page2'); // Second request has cursor
              return jsonResponse({
                'status': 200,
                'data': [{'id': 'plant2'}],
                'pagination': {'nextPage': '', 'hasNext': false}, // Empty nextPage
              }, 200);
            }

            throw Exception('Too many pages requested');
          },
        }, store: store);

        final plants = <AddedPlant>[];
        await for (final plant in client.streamAllAddedPlants()) {
          plants.add(plant);
        }

        // Mutation: removing cursor logic would cause infinite loops or missed pages
        expect(plants.map((p) => p.id), ['plant1', 'plant2']);
        expect(pageCount, 2);
        client.close();
      });

      test('hasNext logic must check both conditions', () async {
        await store.save(const Tokens(
          accessToken: 'access',
          refreshToken: 'refresh',
          tokenType: 'Bearer',
        ));

        final testCases = [
          (null, false), // No pagination
          ({'nextPage': null, 'hasNext': true}, false), // Null nextPage
          ({'nextPage': '', 'hasNext': true}, false), // Empty nextPage
          ({'nextPage': 'page2', 'hasNext': false}, false), // hasNext false
          ({'nextPage': 'page2', 'hasNext': true}, true), // Both conditions met
        ];

        for (final (pagination, expectedHasNext) in testCases) {
          final client = _clientWithRoutes({
            '/v1/addedPlants': (r) => jsonResponse({
              'status': 200,
              'data': [{'id': 'test'}],
              'pagination': pagination,
            }, 200),
          }, store: store);

          final page = await client.getAddedPlants();
          expect(page.hasNext, expectedHasNext);
          client.close();
        }
      });
    });

    group('JSON Parsing Edge Cases', () {
      test('data type assumptions must be validated', () async {
        await store.save(const Tokens(
          accessToken: 'access',
          refreshToken: 'refresh',
          tokenType: 'Bearer',
        ));

        // Test that data is expected to be a List
        final client = _clientWithRoutes({
          '/v1/addedPlants': (r) => jsonResponse({
            'status': 200,
            'data': 'not a list', // Mutation: wrong data type
          }, 200),
        }, store: store);

        expect(
          () => client.getAddedPlants(),
          throwsA(isA<TypeError>()),
        );
        client.close();
      });

      test('enum mapping must handle unknown values', () async {
        // Test ActionType.fromApiValue with unknown value
        expect(ActionType.fromApiValue('unknown_action'), isNull);
        expect(ActionType.fromApiValue(''), isNull);

        // Test that known values work
        expect(ActionType.fromApiValue('watering'), ActionType.watering);
        expect(ActionType.fromApiValue('fertilizing'), ActionType.fertilizing);
      });

      test('message field extraction handles all cases', () async {
        final testCases = [
          ({'message': 'explicit message'}, 'explicit message'),
          ({'msg': 'wrong field'}, 'Unknown error'), // No message field
          ({}, 'Unknown error'), // Empty object
          ({'message': null}, 'Unknown error'), // Null message
          ({'message': 123}, '123'), // Non-string message
        ];

        for (final (json, expectedMessage) in testCases) {
          final mockClient = MockClient((request) async {
            return jsonResponse({...json, 'status': 400}, 400);
          });

          final httpService = HttpService(httpClient: mockClient);

          try {
            await httpService.sendRequest(
              () => http.Request('GET', Uri.parse('https://test.api/test')),
            );
            fail('Expected exception');
          } on PlantaBadRequestException catch (e) {
            expect(e.message, expectedMessage);
          }
          httpService.close();
        }
      });
    });

    group('DateTime Converter Edge Cases', () {
      test('defensive datetime parsing handles all inputs', () async {
        // Test cases for the custom DateTime converter
        final testCases = [
          ('2023-01-01T00:00:00Z', isNotNull), // Valid ISO string
          ('invalid-date', isNull), // Invalid format
          ('', isNull), // Empty string
          (null, isNull), // Null input
        ];

        for (final (input, matcher) in testCases) {
          // Test through token parsing which uses the DateTime converter
          final client = _clientWithRoutes({
            '/v1/auth/authorize': (r) => jsonResponse({
              'status': 200,
              'data': {
                'accessToken': 'test',
                'refreshToken': 'test',
                'tokenType': 'Bearer',
                'expiresAt': input, // Test different datetime values
              },
            }, 200),
          }, store: store);

          final tokens = await client.authorize('123456');
          expect(tokens.expiresAt, matcher);
          client.close();
        }
      });
    });
  });
}

/// Mock token store for testing save operations
class _MockTokenStore implements TokenStore {
  final void Function() onSave;
  Tokens? _tokens;

  _MockTokenStore(this.onSave);

  @override
  Future<void> save(Tokens tokens) async {
    onSave();
    _tokens = tokens;
  }

  @override
  Future<Tokens?> read() async => _tokens;

  @override
  Future<void> clear() async => _tokens = null;
}

/// Build a [PlantaApiClient] with a path -> response mapping.
PlantaApiClient _clientWithRoutes(
  Map<String, http.Response Function(http.Request)> routes, {
  required TokenStore store,
}) {
  final client = MockClient((request) async {
    final path = request.url.path;
    if (routes.containsKey(path)) {
      return routes[path]!(request);
    }
    return jsonResponse({'status': 404, 'message': 'No route'}, 404);
  });
  
  return PlantaApiClient(
    baseUrl: 'https://test.api',
    httpClient: client,
    tokenStore: store,
  );
}