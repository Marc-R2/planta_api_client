import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:planta_client/planta_client.dart';
import 'package:planta_client/src/services/services.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  group('ActionService', () {
    late InMemoryTokenStore tokenStore;
    late HttpService httpService;
    late AuthenticationService authService;
    late ActionService actionService;

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

    test('completeAction success with 204 response', () async {
      await _seedAuth();
      var requestCaptured = false;
      String? capturedBody;

      final mockClient = MockClient((request) async {
        requestCaptured = true;
        expect(request.url.path, '/v1/addedPlants/plant123/actions/complete');
        expect(request.method, 'POST');
        expect(request.headers['Authorization'], 'Bearer valid_access_token');
        expect(request.headers['Content-Type'], 'application/json');
        
        capturedBody = request.body;
        final body = jsonDecode(request.body);
        expect(body['actionType'], 'watering');

        return http.Response('', 204); // No content
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      actionService = ActionService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      // Should complete without throwing
      await actionService.completeAction(
        plantId: 'plant123',
        actionType: ActionType.watering,
      );

      expect(requestCaptured, isTrue);
      expect(capturedBody, isNotNull);

      httpService.close();
    });

    test('completeAction with different action types', () async {
      await _seedAuth();

      final actionTypes = [
        ActionType.watering,
        ActionType.fertilizing,
        ActionType.misting,
        ActionType.repotting,
      ];

      for (final actionType in actionTypes) {
        final mockClient = MockClient((request) async {
          final body = jsonDecode(request.body);
          expect(body['actionType'], actionType.apiValue);
          return http.Response('', 204);
        });

        httpService = HttpService(httpClient: mockClient);
        authService = AuthenticationService(
          baseUrl: 'https://test.api',
          tokenStore: tokenStore,
          httpService: httpService,
        );
        actionService = ActionService(
          baseUrl: 'https://test.api',
          tokenStore: tokenStore,
          httpService: httpService,
          authService: authService,
        );

        await actionService.completeAction(
          plantId: 'plant123',
          actionType: actionType,
        );

        httpService.close();
      }
    });

    test('completeAction throws when not authenticated', () async {
      final mockClient = MockClient((request) async => throw Exception('Should not be called'));

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      actionService = ActionService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      expect(
        () => actionService.completeAction(
          plantId: 'plant123',
          actionType: ActionType.watering,
        ),
        throwsA(isA<PlantaAuthException>()
          .having((e) => e.message, 'message', 'Not authenticated. Call authorize() first.')),
      );

      httpService.close();
    });

    test('completeAction handles 401 with successful refresh', () async {
      await _seedAuth();
      var requestCount = 0;

      final mockClient = MockClient((request) async {
        requestCount++;
        
        if (request.url.path.contains('/actions/complete')) {
          if (requestCount == 1) {
            // First request fails with 401
            return jsonResponse({
              'status': 401,
              'message': 'Token expired',
            }, 401);
          } else {
            // Second request succeeds
            return http.Response('', 204);
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
      actionService = ActionService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      // Should complete without throwing
      await actionService.completeAction(
        plantId: 'plant123',
        actionType: ActionType.watering,
      );

      expect(requestCount, 3); // 1 failed request + 1 refresh + 1 retry

      httpService.close();
    });

    test('completeAction throws PlantaBadRequestException for 400', () async {
      await _seedAuth();

      final mockClient = MockClient((request) async {
        return jsonResponse({
          'status': 400,
          'message': 'Invalid action type',
          'errorType': 'validation_error',
        }, 400);
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      actionService = ActionService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      expect(
        () => actionService.completeAction(
          plantId: 'plant123',
          actionType: ActionType.watering,
        ),
        throwsA(isA<PlantaBadRequestException>()
          .having((e) => e.message, 'message', 'Invalid action type')
          .having((e) => e.errorType, 'errorType', 'validation_error')),
      );

      httpService.close();
    });

    test('completeAction throws PlantaNotFoundException for 404', () async {
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
      actionService = ActionService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      expect(
        () => actionService.completeAction(
          plantId: 'nonexistent',
          actionType: ActionType.watering,
        ),
        throwsA(isA<PlantaNotFoundException>()),
      );

      httpService.close();
    });

    test('completeAction handles server error', () async {
      await _seedAuth();

      final mockClient = MockClient((request) async {
        return jsonResponse({
          'status': 500,
          'message': 'Internal server error',
        }, 500);
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      actionService = ActionService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      expect(
        () => actionService.completeAction(
          plantId: 'plant123',
          actionType: ActionType.watering,
        ),
        throwsA(isA<PlantaServerException>()),
      );

      httpService.close();
    });

    test('completeAction handles non-204 success responses', () async {
      await _seedAuth();

      final mockClient = MockClient((request) async {
        return jsonResponse({
          'status': 200,
          'message': 'Action completed successfully',
        }, 200);
      });

      httpService = HttpService(httpClient: mockClient);
      authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );
      actionService = ActionService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
        authService: authService,
      );

      // Should complete without throwing even though it's not 204
      await actionService.completeAction(
        plantId: 'plant123',
        actionType: ActionType.watering,
      );

      httpService.close();
    });

    test('completeAction includes correct URL path for different plant IDs', () async {
      await _seedAuth();

      final plantIds = ['plant1', 'plant-with-dash', 'UPPERCASE_PLANT'];

      for (final plantId in plantIds) {
        final mockClient = MockClient((request) async {
          expect(request.url.path, '/v1/addedPlants/$plantId/actions/complete');
          return http.Response('', 204);
        });

        httpService = HttpService(httpClient: mockClient);
        authService = AuthenticationService(
          baseUrl: 'https://test.api',
          tokenStore: tokenStore,
          httpService: httpService,
        );
        actionService = ActionService(
          baseUrl: 'https://test.api',
          tokenStore: tokenStore,
          httpService: httpService,
          authService: authService,
        );

        await actionService.completeAction(
          plantId: plantId,
          actionType: ActionType.watering,
        );

        httpService.close();
      }
    });
  });
}