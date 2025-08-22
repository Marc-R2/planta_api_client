import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:planta_client/planta_client.dart';
import 'package:planta_client/src/services/services.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  group('PlantService', () {
    late InMemoryTokenStore tokenStore;
    late HttpService httpService;
    late AuthenticationService authService;
    late PlantService plantService;

    setUp(() {
      tokenStore = InMemoryTokenStore();
    });

    Future<void> _seedAuth() async {
      await tokenStore.save(const Tokens(
        accessToken: 'valid_access_token',
        refreshToken: 'valid_refresh_token',
        tokenType: 'Bearer',
      ));
    }

    test('getAddedPlants without cursor', () async {
      await _seedAuth();

      final mockClient = MockClient((request) async {
        expect(request.url.path, '/v1/addedPlants');
        expect(request.url.queryParameters, isEmpty);
        expect(request.headers['Authorization'], 'Bearer valid_access_token');

        return jsonResponse({
          'status': 200,
          'data': [
            {'id': 'plant1', 'name': 'Rose', 'health': 'good'},
            {'id': 'plant2', 'name': 'Tulip', 'health': 'excellent'},
          ],
          'pagination': {
            'nextPage': 'cursor123',
            'hasNext': true,
          },
        }, 200);
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      plantService = PlantService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      final page = await plantService.getAddedPlants();

      expect(page.plants, hasLength(2));
      expect(page.plants[0].id, 'plant1');
      expect(page.plants[1].id, 'plant2');
      expect(page.pagination?.nextPage, 'cursor123');
      expect(page.hasNext, isTrue);

      httpService.close();
    });

    test('getAddedPlants with cursor', () async {
      await _seedAuth();

      final mockClient = MockClient((request) async {
        expect(request.url.path, '/v1/addedPlants');
        expect(request.url.queryParameters['cursor'], 'cursor123');

        return jsonResponse({
          'status': 200,
          'data': [
            {'id': 'plant3', 'name': 'Daisy', 'health': 'good'},
          ],
          'pagination': null, // No more pages
        }, 200);
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      plantService = PlantService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      final page = await plantService.getAddedPlants(cursor: 'cursor123');

      expect(page.plants, hasLength(1));
      expect(page.plants[0].id, 'plant3');
      expect(page.pagination, isNull);
      expect(page.hasNext, isFalse);

      httpService.close();
    });

    test('getAddedPlants throws when not authenticated', () async {
      final mockClient = MockClient((request) async => throw Exception('Should not be called'));

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      plantService = PlantService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      expect(
        () => plantService.getAddedPlants(),
        throwsA(isA<PlantaAuthException>()
          .having((e) => e.message, 'message', 'Not authenticated. Call authorize() first.')),
      );

      httpService.close();
    });

    test('getAddedPlants handles 401 with successful refresh', () async {
      await _seedAuth();
      var requestCount = 0;

      final mockClient = MockClient((request) async {
        requestCount++;
        
        if (request.url.path == '/v1/addedPlants') {
          if (requestCount == 1) {
            // First request fails with 401
            return jsonResponse({
              'status': 401,
              'message': 'Token expired',
            }, 401);
          } else {
            // Second request succeeds
            return jsonResponse({
              'status': 200,
              'data': [{'id': 'plant1', 'name': 'Rose'}],
              'pagination': null,
            }, 200);
          }
        } else if (request.url.path == '/v1/auth/refreshToken') {
          // Refresh succeeds
          return jsonResponse({
            'status': 200,
            'data': {
              'accessToken': 'new_access_token',
              'refreshToken': 'new_refresh_token',
              'tokenType': 'Bearer',
            },
          }, 200);
        }
        throw Exception('Unexpected request: ${request.url}');
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      plantService = PlantService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      final page = await plantService.getAddedPlants();

      expect(page.plants, hasLength(1));
      expect(page.plants[0].id, 'plant1');
      expect(requestCount, 3); // 1 failed request + 1 refresh + 1 retry

      httpService.close();
    });

    test('streamAllAddedPlants yields all plants across pages', () async {
      await _seedAuth();
      var requestCount = 0;

      final mockClient = MockClient((request) async {
        requestCount++;
        expect(request.url.path, '/v1/addedPlants');

        if (requestCount == 1) {
          expect(request.url.queryParameters, isEmpty);
          return jsonResponse({
            'status': 200,
            'data': [
              {'id': 'plant1', 'name': 'Rose'},
              {'id': 'plant2', 'name': 'Tulip'},
            ],
            'pagination': {'nextPage': 'page2', 'hasNext': true},
          }, 200);
        } else if (requestCount == 2) {
          expect(request.url.queryParameters['cursor'], 'page2');
          return jsonResponse({
            'status': 200,
            'data': [
              {'id': 'plant3', 'name': 'Daisy'},
            ],
            'pagination': null,
          }, 200);
        }
        throw Exception('Too many requests');
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      plantService = PlantService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      final plants = <AddedPlant>[];
      await for (final plant in plantService.streamAllAddedPlants()) {
        plants.add(plant);
      }

      expect(plants, hasLength(3));
      expect(plants.map((p) => p.id), ['plant1', 'plant2', 'plant3']);
      expect(requestCount, 2);

      httpService.close();
    });

    test('streamAllAddedPlants stops when nextPage is empty', () async {
      await _seedAuth();

      final mockClient = MockClient((request) async {
        return jsonResponse({
          'status': 200,
          'data': [{'id': 'plant1', 'name': 'Rose'}],
          'pagination': {'nextPage': '', 'hasNext': false},
        }, 200);
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      plantService = PlantService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      final plants = <AddedPlant>[];
      await for (final plant in plantService.streamAllAddedPlants()) {
        plants.add(plant);
      }

      expect(plants, hasLength(1));

      httpService.close();
    });

    test('getAddedPlant success', () async {
      await _seedAuth();

      final mockClient = MockClient((request) async {
        expect(request.url.path, '/v1/addedPlants/plant123');
        expect(request.headers['Authorization'], 'Bearer valid_access_token');

        return jsonResponse({
          'status': 200,
          'data': {
            'id': 'plant123',
            'name': 'Special Rose',
            'health': 'excellent',
          },
        }, 200);
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      plantService = PlantService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      final plant = await plantService.getAddedPlant('plant123');

      expect(plant.id, 'plant123');
      expect(plant.name, 'Special Rose');

      httpService.close();
    });

    test('getAddedPlant throws PlantaNotFoundException for 404', () async {
      await _seedAuth();

      final mockClient = MockClient((request) async {
        return jsonResponse({
          'status': 404,
          'message': 'Plant not found',
        }, 404);
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      plantService = PlantService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      expect(
        () => plantService.getAddedPlant('nonexistent'),
        throwsA(isA<PlantaNotFoundException>()),
      );

      httpService.close();
    });

    test('handles empty data list', () async {
      await _seedAuth();

      final mockClient = MockClient((request) async {
        return jsonResponse({
          'status': 200,
          'data': [], // Empty list
          'pagination': null,
        }, 200);
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      plantService = PlantService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      final page = await plantService.getAddedPlants();
      expect(page.plants, isEmpty);
      expect(page.hasNext, isFalse);

      httpService.close();
    });
  });
}