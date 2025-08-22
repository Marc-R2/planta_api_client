import 'package:planta_client/planta_client.dart';
import 'package:test/test.dart';

void main() {
  group('InMemoryTokenStore', () {
    final store = InMemoryTokenStore();

    test('initially empty', () async {
      expect(await store.read(), isNull);
    });

    test('save and read returns same instance', () async {
      final t = Tokens(
        accessToken: 'a',
        refreshToken: 'r',
        tokenType: 'Bearer',
        expiresAt: DateTime.now(),
      );
      await store.save(t);
      final read = await store.read();
      expect(read, equals(t));
    });

    test('clear removes stored tokens', () async {
      await store.clear();
      expect(await store.read(), isNull);
    });
  });
}
