import 'package:freezed_annotation/freezed_annotation.dart';

/// JSON converter for nullable DateTime fields with defensive parsing.
///
/// Behavior:
/// - null or empty string -> null
/// - unparsable string -> null (no exception)
/// - valid ISO 8601 string -> parsed DateTime (UTC or local per input)
class NullableDateTimeTryParseConverter
    implements JsonConverter<DateTime?, Object?> {
  const NullableDateTimeTryParseConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    final s = json.toString().trim();
    if (s.isEmpty) return null;
    return DateTime.tryParse(s);
  }

  @override
  Object? toJson(DateTime? object) => object?.toIso8601String();
}
