import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:planta_client/planta_client.dart';
import 'package:planta_client/src/services/authentication_service.dart';
import 'package:planta_client/src/services/http_service.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  group('AuthenticationService', () {
    late InMemoryTokenStore tokenStore;
    late HttpService httpService;

    setUp(() {
      tokenStore = InMemoryTokenStore();
    });

    test('authorize success stores tokens', () async {
      final mockClient = MockClient((request) async {
        expect(request.url.path, '/v1/auth/authorize');
        expect(request.headers['Content-Type'], 'application/json');
        
        final body = jsonDecode(request.body);
        expect(body['code'], '123456');

        return jsonResponse({
          'status': 200,
          'data': {
            'accessToken': 'access_token_123',
            'refreshToken': 'refresh_token_456',
            'tokenType': 'Bearer',
            'expiresAt': '2030-01-01T00:00:00Z',
          },
        }, 200);
      });

      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      final tokens = await authService.authorize('123456');

      expect(tokens.accessToken, 'access_token_123');
      expect(tokens.refreshToken, 'refresh_token_456');
      expect(tokens.tokenType, 'Bearer');

      // Verify tokens were stored
      final storedTokens = await tokenStore.read();
      expect(storedTokens, equals(tokens));
      
      httpService.close();
    });

    test('authorize propagates format exception', () async {
      final mockClient = MockClient((request) async {
        return textResponse('invalid json', 200);
      });

      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      expect(
        () => authService.authorize('123456'),
        throwsA(isA<PlantaFormatException>()),
      );
      
      httpService.close();
    });

    test('authorize propagates API exception', () async {
      final mockClient = MockClient((request) async {
        return jsonResponse({
          'status': 400,
          'message': 'Invalid OTP code',
          'errorType': 'invalid_otp',
        }, 400);
      });

      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      expect(
        () => authService.authorize('invalid'),
        throwsA(isA<PlantaBadRequestException>()),
      );
      
      httpService.close();
    });

    test('refresh success with existing refresh token', () async {
      // Setup existing tokens
      await tokenStore.save(const Tokens(
        accessToken: 'old_access',
        refreshToken: 'valid_refresh',
        tokenType: 'Bearer',
      ));

      final mockClient = MockClient((request) async {
        expect(request.url.path, '/v1/auth/refreshToken');
        expect(request.headers['Content-Type'], 'application/json');
        
        final body = jsonDecode(request.body);
        expect(body['refreshToken'], 'valid_refresh');

        return jsonResponse({
          'status': 200,
          'data': {
            'accessToken': 'new_access_token',
            'refreshToken': 'new_refresh_token',
            'tokenType': 'Bearer',
            'expiresAt': null, // Test null handling
          },
        }, 200);
      });

      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      final newTokens = await authService.refresh();

      expect(newTokens.accessToken, 'new_access_token');
      expect(newTokens.refreshToken, 'new_refresh_token');

      // Verify new tokens were stored
      final storedTokens = await tokenStore.read();
      expect(storedTokens, equals(newTokens));
      
      httpService.close();
    });

    test('refresh throws exception when no tokens exist', () async {
      final mockClient = MockClient((request) async => throw Exception('Should not be called'));
      
      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      expect(
        () => authService.refresh(),
        throwsA(isA<PlantaAuthException>()
          .having((e) => e.message, 'message', 'No refresh token available.')),
      );
      
      httpService.close();
    });

    test('refresh throws exception when refresh token is null', () async {
      // Setup tokens with null refresh token
      await tokenStore.save(const Tokens(
        accessToken: 'access_token',
        refreshToken: null,
        tokenType: 'Bearer',
      ));

      final mockClient = MockClient((request) async => throw Exception('Should not be called'));
      
      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      expect(
        () => authService.refresh(),
        throwsA(isA<PlantaAuthException>()
          .having((e) => e.message, 'message', 'No refresh token available.')),
      );
      
      httpService.close();
    });

    test('refresh propagates HTTP errors', () async {
      await tokenStore.save(const Tokens(
        accessToken: 'access',
        refreshToken: 'invalid_refresh',
        tokenType: 'Bearer',
      ));

      final mockClient = MockClient((request) async {
        return jsonResponse({
          'status': 401,
          'message': 'Invalid refresh token',
          'errorType': 'invalid_refresh_token',
        }, 401);
      });

      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      expect(
        () => authService.refresh(),
        throwsA(isA<PlantaAuthException>()),
      );
      
      httpService.close();
    });

    test('getCurrentTokens returns stored tokens', () async {
      const tokens = Tokens(
        accessToken: 'test_access',
        refreshToken: 'test_refresh',
        tokenType: 'Bearer',
      );
      await tokenStore.save(tokens);

      final mockClient = MockClient((request) async => throw Exception('Should not be called'));
      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      final result = await authService.getCurrentTokens();
      expect(result, equals(tokens));
      
      httpService.close();
    });

    test('getCurrentTokens returns null when no tokens stored', () async {
      final mockClient = MockClient((request) async => throw Exception('Should not be called'));
      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      final result = await authService.getCurrentTokens();
      expect(result, isNull);
      
      httpService.close();
    });

    test('clearTokens removes stored tokens', () async {
      await tokenStore.save(const Tokens(
        accessToken: 'test',
        refreshToken: 'test',
        tokenType: 'Bearer',
      ));

      final mockClient = MockClient((request) async => throw Exception('Should not be called'));
      httpService = HttpService(httpClient: mockClient);
      final authService = AuthenticationService(
        baseUrl: 'https://test.api',
        tokenStore: tokenStore,
        httpService: httpService,
      );

      await authService.clearTokens();
      
      final result = await tokenStore.read();
      expect(result, isNull);
      
      httpService.close();
    });
  });
}