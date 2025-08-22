import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:planta_client/planta_client.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group('PlantaApiClient Integration Tests', () {
    late InMemoryTokenStore store;

    setUp(() {
      store = InMemoryTokenStore();
    });

    test('full authentication and plant retrieval flow', () async {
      var requestCount = 0;
      final client = _clientWithHandler(
        (request) {
          requestCount++;
          
          if (request.url.path == '/v1/auth/authorize') {
            expect(request.method, 'POST');
            final body = jsonDecode(request.body);
            expect(body['code'], '123456');
            
            return jsonResponse({
              'status': 200,
              'data': {
                'accessToken': 'integration_access',
                'refreshToken': 'integration_refresh',
                'tokenType': 'Bearer',
                'expiresAt': '2030-01-01T00:00:00Z',
              },
            }, 200);
          } else if (request.url.path == '/v1/addedPlants') {
            expect(request.headers['Authorization'], 'Bearer integration_access');
            return jsonResponse({
              'status': 200,
              'data': [
                {'id': 'plant1', 'name': 'Integration Plant', 'health': 'good'},
              ],
              'pagination': null,
            }, 200);
          }
          
          throw Exception('Unexpected request: ${request.url}');
        },
        store: store,
      );

      // Full flow: authorize then get plants
      final tokens = await client.authorize('123456');
      expect(tokens.accessToken, 'integration_access');
      
      final page = await client.getAddedPlants();
      expect(page.plants, hasLength(1));
      expect(page.plants[0].id, 'plant1');
      
      expect(requestCount, 2);
      client.close();
    });

    test('end-to-end plant action completion with refresh flow', () async {
      await _seedAuth(store);
      var refreshCalled = false;
      var actionCompleted = false;

      final client = _clientWithHandler(
        (request) {
          if (request.url.path.contains('/actions/complete')) {
            if (!refreshCalled) {
              // First attempt fails
              return jsonResponse({
                'status': 401,
                'message': 'Token expired',
              }, 401);
            } else {
              // Second attempt succeeds
              actionCompleted = true;
              return http.Response('', 204);
            }
          } else if (request.url.path == '/v1/auth/refreshToken') {
            refreshCalled = true;
            return jsonResponse({
              'status': 200,
              'data': {
                'accessToken': 'refreshed_token',
                'refreshToken': 'new_refresh',
                'tokenType': 'Bearer',
              },
            }, 200);
          }
          
          throw Exception('Unexpected request: ${request.url}');
        },
        store: store,
      );

      await client.completeAction(
        plantId: 'test_plant',
        actionType: ActionType.watering,
      );

      expect(refreshCalled, isTrue);
      expect(actionCompleted, isTrue);
      client.close();
    });

    test('streaming all plants across multiple pages', () async {
      await _seedAuth(store);
      var pageRequests = 0;

      final client = _clientWithHandler(
        (request) {
          pageRequests++;
          expect(request.url.path, '/v1/addedPlants');
          
          if (pageRequests == 1) {
            expect(request.url.queryParameters, isEmpty);
            return jsonResponse({
              'status': 200,
              'data': [
                {'id': 'stream_plant1', 'name': 'Plant 1'},
                {'id': 'stream_plant2', 'name': 'Plant 2'},
              ],
              'pagination': {'nextPage': 'page2', 'hasNext': true},
            }, 200);
          } else if (pageRequests == 2) {
            expect(request.url.queryParameters['cursor'], 'page2');
            return jsonResponse({
              'status': 200,
              'data': [
                {'id': 'stream_plant3', 'name': 'Plant 3'},
              ],
              'pagination': {'nextPage': '', 'hasNext': false},
            }, 200);
          }
          
          throw Exception('Too many page requests');
        },
        store: store,
      );

      final collectedPlants = <AddedPlant>[];
      await for (final plant in client.streamAllAddedPlants()) {
        collectedPlants.add(plant);
      }

      expect(collectedPlants, hasLength(3));
      expect(collectedPlants.map((p) => p.id), [
        'stream_plant1',
        'stream_plant2',
        'stream_plant3',
      ]);
      expect(pageRequests, 2);
      client.close();
    });

    test('facade delegates correctly to all services', () async {
      await _seedAuth(store);
      var authCalled = false;
      var refreshCalled = false;
      var plantsCalled = false;
      var singlePlantCalled = false;
      var actionCalled = false;

      final client = _clientWithHandler(
        (request) {
          if (request.url.path == '/v1/auth/authorize') {
            authCalled = true;
            return jsonResponse({
              'status': 200,
              'data': {
                'accessToken': 'test_access',
                'refreshToken': 'test_refresh',
                'tokenType': 'Bearer',
              },
            }, 200);
          } else if (request.url.path == '/v1/auth/refreshToken') {
            refreshCalled = true;
            return jsonResponse({
              'status': 200,
              'data': {
                'accessToken': 'new_access',
                'refreshToken': 'new_refresh',
                'tokenType': 'Bearer',
              },
            }, 200);
          } else if (request.url.path == '/v1/addedPlants' && request.method == 'GET') {
            plantsCalled = true;
            return jsonResponse({
              'status': 200,
              'data': [{'id': 'test_plant', 'name': 'Test'}],
              'pagination': null,
            }, 200);
          } else if (request.url.path == '/v1/addedPlants/specific_plant') {
            singlePlantCalled = true;
            return jsonResponse({
              'status': 200,
              'data': {'id': 'specific_plant', 'name': 'Specific'},
            }, 200);
          } else if (request.url.path.contains('/actions/complete')) {
            actionCalled = true;
            return http.Response('', 204);
          }
          
          throw Exception('Unexpected request: ${request.url}');
        },
        store: store,
      );

      // Test all facade methods
      await client.authorize('test_code');
      await client.refresh();
      await client.getAddedPlants();
      await client.getAddedPlant('specific_plant');
      await client.completeAction(plantId: 'test', actionType: ActionType.watering);

      expect(authCalled, isTrue);
      expect(refreshCalled, isTrue);
      expect(plantsCalled, isTrue);
      expect(singlePlantCalled, isTrue);
      expect(actionCalled, isTrue);
      client.close();
    });

    test('configureRequest hook is applied across all services', () async {
      await _seedAuth(store);
      var hookCallCount = 0;
      final capturedHeaders = <String, String>{};

      final client = PlantaApiClient(
        baseUrl: 'https://test.api',
        tokenStore: store,
        httpClient: MockClient((request) async {
          capturedHeaders.addAll(request.headers);
          
          if (request.url.path == '/v1/addedPlants') {
            return jsonResponse({
              'status': 200,
              'data': [],
              'pagination': null,
            }, 200);
          }
          
          return http.Response('', 204);
        }),
        configureRequest: (request) {
          hookCallCount++;
          request.headers['X-Custom-Header'] = 'integration-test';
          request.headers['X-Request-ID'] = 'req-$hookCallCount';
        },
      );

      await client.getAddedPlants();

      expect(hookCallCount, 1);
      expect(capturedHeaders['X-Custom-Header'], 'integration-test');
      expect(capturedHeaders['X-Request-ID'], 'req-1');
      client.close();
    });

    test('complex error scenario with multiple retries', () async {
      await _seedAuth(store);
      var attemptCount = 0;

      final client = _clientWithHandler(
        (request) {
          attemptCount++;
          
          if (request.url.path == '/v1/addedPlants') {
            if (attemptCount == 1) {
              return jsonResponse({'status': 401, 'message': 'Expired'}, 401);
            } else {
              return jsonResponse({
                'status': 200,
                'data': [],
                'pagination': null,
              }, 200);
            }
          } else if (request.url.path == '/v1/auth/refreshToken') {
            return jsonResponse({
              'status': 200,
              'data': {
                'accessToken': 'retry_access',
                'refreshToken': 'retry_refresh',
                'tokenType': 'Bearer',
              },
            }, 200);
          }
          
          throw Exception('Unexpected request: ${request.url}');
        },
        store: store,
      );

      final page = await client.getAddedPlants();
      expect(page.plants, isEmpty);
      expect(attemptCount, 3); // 1 failed + 1 refresh + 1 retry
      client.close();
    });
  });
}

/// Seed valid auth tokens into the [InMemoryTokenStore].
Future<void> _seedAuth(InMemoryTokenStore store) async {
  await store.save(
    const Tokens(
      accessToken: 'SEED_ACCESS',
      refreshToken: 'SEED_REFRESH',
      tokenType: 'Bearer',
    ),
  );
}

/// Build a [PlantaApiClient] with a custom handler function for advanced flows.
PlantaApiClient _clientWithHandler(
  http.Response Function(http.Request) handler, {
  required InMemoryTokenStore store,
}) {
  final mock = MockClient((request) async => handler(request));
  return PlantaApiClient(
    baseUrl: 'https://test.api',
    httpClient: mock,
    tokenStore: store,
  );
}