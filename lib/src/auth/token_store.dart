import 'dart:async';
import 'package:planta_client/src/models/models.dart';

/// Abstraction for token persistence.
///
/// Implementations may choose:
/// - In-memory (development/tests)
/// - File-based
/// - Secure storage (Flutter mobile)
/// - Encrypted stores
abstract class TokenStore {
  /// Persist tokens.
  Future<void> save(Tokens tokens);

  /// Retrieve previously saved tokens. Returns null if none.
  Future<Tokens?> read();

  /// Clear stored tokens.
  Future<void> clear();
}

/// Simple in-memory implementation (not production secure).
///
/// Useful for tests, prototypes, ephemeral CLI tools.
/// For production, implement a secure [TokenStore].
class InMemoryTokenStore implements TokenStore {
  Tokens? _cached;

  @override
  Future<void> save(Tokens tokens) async {
    _cached = tokens;
  }

  @override
  Future<Tokens?> read() async => _cached;

  @override
  Future<void> clear() async {
    _cached = null;
  }
}
