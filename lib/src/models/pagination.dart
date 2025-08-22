import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_client/src/models/plant.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

/// Pagination metadata object returned inside plant list responses.
///
/// [nextPage] is a cursor string you can supply back to GET /v1/addedPlants
/// to retrieve the next page. If null or empty, no further pages exist.
@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    String? nextPage,
  }) = _Pagination;

  /// Construct from JSON map.
  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

/// Aggregate page combining list of [AddedPlant] and optional [Pagination].
///
/// Not a direct one-to-one JSON structure (we compose it after decoding).
@freezed
class AddedPlantsPage with _$AddedPlantsPage {
  const factory AddedPlantsPage(
    List<AddedPlant> plants,
    Pagination? pagination,
  ) = _AddedPlantsPage;

  const AddedPlantsPage._();

  /// True if a subsequent page exists.
  bool get hasNext =>
      pagination?.nextPage != null && pagination!.nextPage!.isNotEmpty;
}
