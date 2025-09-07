import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:planta_client/planta_client.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group('PlantaApiClient', () {
    late InMemoryTokenStore store;

    setUp(() {
      store = InMemoryTokenStore();
    });

    test('authorize success', () async {
      final client = _clientWithRoutes(
        {
          '/v1/auth/authorize': (r) => jsonResponse(
                {
                  'status': 200,
                  'data': {
                    'accessToken': 'A1',
                    'refreshToken': 'R1',
                    'tokenType': 'Bearer',
                    'expiresAt': '2030-01-01T00:00:00Z',
                  },
                },
                200,
              ),
        },
        store: store,
      );

      final tokens = await client.authorize('123456');
      expect(tokens.accessToken, 'A1');
      expect(tokens.refreshToken, 'R1');
      expect(await store.read(), equals(tokens));
      client.close();
    });

    test('authorize format error (invalid JSON)', () async {
      final client = _clientWithRoutes(
        {
          '/v1/auth/authorize': (r) => textResponse('NOT_JSON', 200),
        },
        store: store,
      );

      expect(
        () => client.authorize('123'),
        throwsA(isA<PlantaFormatException>()),
      );
      client.close();
    });

    test('refresh success', () async {
      await store.save(
        const Tokens(
          accessToken: 'old',
          refreshToken: 'REF',
          tokenType: 'Bearer',
        ),
      );
      final client = _clientWithRoutes(
        {
          '/v1/auth/refreshToken': (r) => jsonResponse(
                {
                  'status': 200,
                  'data': {
                    'accessToken': 'NEW',
                    'refreshToken': 'NEWREF',
                    'tokenType': 'Bearer',
                    'expiresAt': null,
                  },
                },
                200,
              ),
        },
        store: store,
      );

      final tokens = await client.refresh();
      expect(tokens.accessToken, 'NEW');
      expect((await store.read())!.refreshToken, 'NEWREF');
      client.close();
    });

    test('refresh fails when no refresh token', () async {
      await store.save(
        const Tokens(
          accessToken: 'only',
          tokenType: 'Bearer',
        ),
      );
      final client = _clientWithRoutes({}, store: store);
      expect(client.refresh, throwsA(isA<PlantaAuthException>()));
      client.close();
    });

    test('getAddedPlants single page (no pagination)', () async {
      await _seedAuth(store);
      final client = _clientWithRoutes(
        {
          '/v1/addedPlants': (r) => jsonResponse(
                {
                  'status': 200,
                  'data': [
                    {'id': 'p1'},
                    {'id': 'p2'},
                  ],
                },
                200,
              ),
        },
        store: store,
      );

      final page = await client.getAddedPlants();
      expect(page.plants.map((p) => p.id), ['p1', 'p2']);
      expect(page.hasNext, isFalse);
      client.close();
    });

    test('getAddedPlants pagination + streamAllAddedPlants', () async {
      await _seedAuth(store);
      var pageCount = 0;
      final client = _clientWithHandler(
        (request) {
          if (request.url.path == '/v1/addedPlants') {
            final cursor = request.url.queryParameters['cursor'];
            if (cursor == null) {
              pageCount++;
              return jsonResponse(
                {
                  'status': 200,
                  'data': [
                    {'id': 'p1'},
                  ],
                  'pagination': {'nextPage': 'CUR2'},
                },
                200,
              );
            } else if (cursor == 'CUR2') {
              pageCount++;
              return jsonResponse(
                {
                  'status': 200,
                  'data': [
                    {'id': 'p2'},
                  ],
                },
                200,
              );
            }
          }
          return jsonResponse({'status': 404, 'message': 'not found'}, 404);
        },
        store: store,
      );

      final collected = <String>[];
      await for (final p in client.streamAllAddedPlants()) {
        collected.add(p.id);
      }
      expect(collected, ['p1', 'p2']);
      expect(pageCount, 2);
      client.close();
    });

    test('getAddedPlant success', () async {
      await _seedAuth(store);
      final client = _clientWithRoutes(
        {
          '/v1/addedPlants/XYZ': (r) => jsonResponse(
                {
                  'status': 200,
                  'data': {'id': 'XYZ', 'health': 'good'},
                },
                200,
              ),
        },
        store: store,
      );

      final plant = await client.getAddedPlant('XYZ');
      expect(plant.id, 'XYZ');
      expect(plant.health, 'good');
      client.close();
    });

    test('completeAction success 204', () async {
      await _seedAuth(store);
      var hit = false;
      final client = _clientWithRoutes(
        {
          '/v1/addedPlants/ABC/actions/complete': (r) {
            hit = true;
            expect(jsonDecode(r.body)['actionType'], 'watering');
            return http.Response('', 204);
          },
        },
        store: store,
      );

      await client.completeAction(
        plantId: 'ABC',
        actionType: ActionType.watering,
      );
      expect(hit, isTrue);
      client.close();
    });

    test('completeAction error (400) while expectNoContent branch active',
        () async {
      await _seedAuth(store);
      final client = _clientWithRoutes(
        {
          '/v1/addedPlants/ABC/actions/complete': (r) => jsonResponse(
                {
                  'status': 400,
                  'errorType': 'validation_error',
                  'message': 'Invalid body',
                },
                400,
              ),
        },
        store: store,
      );

      expect(
        () => client.completeAction(
          plantId: 'ABC',
          actionType: ActionType.watering,
        ),
        throwsA(isA<PlantaBadRequestException>()),
      );
      client.close();
    });

    test('unauthenticated call throws PlantaAuthException', () async {
      final client =
          _clientWithRoutes({}, store: store); // store empty => no token
      expect(
        client.getAddedPlants,
        throwsA(isA<PlantaAuthException>()),
      );
      client.close();
    });

    test('401 triggers refresh then success', () async {
      await store.save(
        const Tokens(
          accessToken: 'OLD',
          refreshToken: 'REFRESH',
          tokenType: 'Bearer',
        ),
      );

      var addedPlantsHits = 0;
      var refreshHit = false;

      final client = _clientWithHandler(
        (request) {
          if (request.url.path == '/v1/addedPlants') {
            addedPlantsHits++;
            if (addedPlantsHits == 1) {
              return jsonResponse(
                {'status': 401, 'errorType': 'unauthorized', 'message': 'No'},
                401,
              );
            } else {
              return jsonResponse(
                {
                  'status': 200,
                  'data': [
                    {'id': 'p1'},
                  ],
                },
                200,
              );
            }
          } else if (request.url.path == '/v1/auth/refreshToken') {
            refreshHit = true;
            final body = jsonDecode(request.body);
            expect(body['refreshToken'], 'REFRESH');
            return jsonResponse(
              {
                'status': 200,
                'data': {
                  'accessToken': 'NEW',
                  'refreshToken': 'REFRESH2',
                  'tokenType': 'Bearer',
                  'expiresAt': null,
                },
              },
              200,
            );
          }
          return jsonResponse({'status': 404, 'message': 'Not found'}, 404);
        },
        store: store,
      );

      final page = await client.getAddedPlants();
      expect(page.plants.single.id, 'p1');
      expect(refreshHit, isTrue);
      expect(addedPlantsHits, 2);
      final updatedTokens = await store.read();
      expect(updatedTokens?.accessToken, 'NEW');
      client.close();
    });

    test('401 triggers refresh but second attempt still 401 throws', () async {
      await store.save(
        const Tokens(
          accessToken: 'OLD',
          refreshToken: 'REF',
          tokenType: 'Bearer',
        ),
      );

      var addedHits = 0;
      var refreshHit = false;

      final client = _clientWithHandler(
        (request) {
          if (request.url.path == '/v1/addedPlants') {
            addedHits++;
            return jsonResponse(
              {
                'status': 401,
                'errorType': 'unauthorized',
                'message': 'Still unauthorized',
              },
              401,
            );
          } else if (request.url.path == '/v1/auth/refreshToken') {
            refreshHit = true;
            return jsonResponse(
              {
                'status': 200,
                'data': {
                  'accessToken': 'NEW',
                  'refreshToken': 'REF2',
                  'tokenType': 'Bearer',
                  'expiresAt': null,
                },
              },
              200,
            );
          }
          return jsonResponse({'status': 404, 'message': 'NF'}, 404);
        },
        store: store,
      );

      late Future<AddedPlantsPage> future;

      expect(
        () => future = client.getAddedPlants(),
        throwsA(isA<PlantaAuthException>()),
      );
      await future.catchError((_) => const AddedPlantsPage([], null));
      expect(refreshHit, isTrue);
      expect(addedHits, 2); // initial + after refresh
      client.close();
    });

    test('error mapping 400/404/500/default', () async {
      await _seedAuth(store);
      final statuses = <int>[400, 404, 500, 418];
      final exceptions = <Type>[
        PlantaBadRequestException,
        PlantaNotFoundException,
        PlantaServerException,
        PlantaApiException,
      ];
      for (var i = 0; i < statuses.length; i++) {
        final code = statuses[i];
        final expectedType = exceptions[i];
        final client = _clientWithRoutes(
          {
            '/v1/addedPlants': (r) => jsonResponse(
                  {'status': code, 'message': 'X', 'errorType': 'E'},
                  code,
                ),
          },
          store: store,
        );

        expect(
          client.getAddedPlants,
          throwsA(
            isA<PlantaApiException>().having(
              (e) => e.runtimeType,
              'runtimeType',
              expectedType,
            ),
          ),
        );
        client.close();
      }
    });

    test('configureRequest callback invoked', () async {
      await _seedAuth(store);
      var configureCount = 0;
      final client = PlantaApiClient(
        baseUrl: 'https://example.test',
        tokenStore: store,
        httpClient: _routerClient({
          '/v1/addedPlants': (r) {
            expect(r.headers.containsKey('Authorization'), isTrue);
            expect(r.headers['X-Custom'], '1');
            return jsonResponse({'status': 200, 'data': <dynamic>[]}, 200);
          },
        }),
        configureRequest: (req) {
          configureCount++;
          req.headers['X-Custom'] = '1';
        },
      );

      await client.getAddedPlants();
      expect(configureCount, 1);
      client.close();
    });

    test('format error inside authed request (invalid JSON on 200)', () async {
      await _seedAuth(store);
      final client = _clientWithRoutes(
        {
          '/v1/addedPlants': (r) => http.Response('not-json', 200),
        },
        store: store,
      );

      expect(
        client.getAddedPlants,
        throwsA(isA<PlantaFormatException>()),
      );
      client.close();
    });
  });
}

/// Seed valid auth tokens into the [InMemoryTokenStore].
Future<void> _seedAuth(InMemoryTokenStore store) async {
  await store.save(
    const Tokens(
      accessToken: 'ACCESS',
      refreshToken: 'REFRESH',
      tokenType: 'Bearer',
    ),
  );
}

/// Build a [PlantaApiClient] with a path -> response mapping.
PlantaApiClient _clientWithRoutes(
  Map<String, http.Response Function(http.Request)> routes, {
  required InMemoryTokenStore store,
}) {
  final client = _routerClient(routes);
  return PlantaApiClient(
    baseUrl: 'https://example.test',
    httpClient: client,
    tokenStore: store,
  );
}

/// Build a [PlantaApiClient] with a custom handler function for advanced flows.
PlantaApiClient _clientWithHandler(
  http.Response Function(http.Request) handler, {
  required InMemoryTokenStore store,
}) {
  final mock = MockClient((request) async => handler(request));
  return PlantaApiClient(
    baseUrl: 'https://example.test',
    httpClient: mock,
    tokenStore: store,
  );
}

/// Create a mock client that routes strictly by URL path.
http.Client _routerClient(
  Map<String, http.Response Function(http.Request)> routes,
) {
  return MockClient((request) async {
    final path = request.url.path;
    if (routes.containsKey(path)) {
      return routes[path]!(request);
    }
    return jsonResponse({'status': 404, 'message': 'No route'}, 404);
  });
}
