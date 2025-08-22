import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_client/src/models/converters.dart';

part 'tokens.freezed.dart';
part 'tokens.g.dart';

/// Authentication token bundle returned by authorization & refresh endpoints.
///
/// Fields:
/// - [accessToken] (Bearer token)
/// - [refreshToken] (used to obtain new access token)
/// - [tokenType] (e.g., "Bearer")
/// - [expiresAt] (optional; null when not provided or unparsable)
@freezed
class Tokens with _$Tokens {
  const factory Tokens({
    required String accessToken,
    required String tokenType,
    String? refreshToken,
    @NullableDateTimeTryParseConverter() DateTime? expiresAt,
  }) = _Tokens;

  /// Construct from JSON map.
  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
}
