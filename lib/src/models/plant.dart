import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_client/src/models/converters.dart';

part 'plant.freezed.dart';
part 'plant.g.dart';

/// Represents a user-added plant and associated metadata.
@freezed
class AddedPlant with _$AddedPlant {
  const factory AddedPlant({
    required String id,
    PlantNames? names,
    PlantSite? site,
    PlantImage? image,
    PlantCare? plantCare,
    int? size,
    String? health,
    EnvironmentInfo? environment,
    PlantActions? actions,
  }) = _AddedPlant;

  /// Construct from JSON map.
  factory AddedPlant.fromJson(Map<String, dynamic> json) =>
      _$AddedPlantFromJson(json);
}

/// Localized and/or custom plant naming attributes.
@freezed
class PlantNames with _$PlantNames {
  const factory PlantNames({
    String? localizedName,
    String? variety,
    String? custom,
    String? scientific,
  }) = _PlantNames;

  factory PlantNames.fromJson(Map<String, dynamic> json) =>
      _$PlantNamesFromJson(json);
}

/// Plant site (location) information including grow light usage.
@freezed
class PlantSite with _$PlantSite {
  const factory PlantSite({
    String? id,
    String? name,
    bool? hasGrowLight,
    int? activeGrowLightHours,
  }) = _PlantSite;

  factory PlantSite.fromJson(Map<String, dynamic> json) =>
      _$PlantSiteFromJson(json);
}

/// Plant image details (URL & lastUpdated timestamp).
@freezed
class PlantImage with _$PlantImage {
  const factory PlantImage({
    String? url,
    @NullableDateTimeTryParseConverter() DateTime? lastUpdated,
  }) = _PlantImage;

  factory PlantImage.fromJson(Map<String, dynamic> json) =>
      _$PlantImageFromJson(json);
}

/// Care customization: watering & fertilizing intervals.
@freezed
class PlantCare with _$PlantCare {
  const factory PlantCare({
    CustomCareInterval? customWatering,
    CustomCareInterval? customFertilizing,
  }) = _PlantCare;

  factory PlantCare.fromJson(Map<String, dynamic> json) =>
      _$PlantCareFromJson(json);
}

/// Custom interval settings (warm/cold period days).
@freezed
class CustomCareInterval with _$CustomCareInterval {
  const factory CustomCareInterval({
    bool? enabled,
    int? intervalWarmPeriod,
    int? intervalColdPeriod,
  }) = _CustomCareInterval;

  factory CustomCareInterval.fromJson(Map<String, dynamic> json) =>
      _$CustomCareIntervalFromJson(json);
}

/// Environmental factors around the plant (light, pot, etc.).
@freezed
class EnvironmentInfo with _$EnvironmentInfo {
  const factory EnvironmentInfo({
    bool? isNearAc,
    bool? isNearHeater,
    LightInfo? light,
    PotInfo? pot,
  }) = _EnvironmentInfo;

  factory EnvironmentInfo.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentInfoFromJson(json);
}

/// Light conditions data.
@freezed
class LightInfo with _$LightInfo {
  const factory LightInfo({
    int? distanceFromWindow,
    bool? hasGrowLight,
    int? activeGrowLightHours,
  }) = _LightInfo;

  factory LightInfo.fromJson(Map<String, dynamic> json) =>
      _$LightInfoFromJson(json);
}

/// Pot characteristics (size, soil, drainage, type).
@freezed
class PotInfo with _$PotInfo {
  const factory PotInfo({
    String? type,
    int? size,
    String? soil,
    bool? hasDrainage,
  }) = _PotInfo;

  factory PotInfo.fromJson(Map<String, dynamic> json) =>
      _$PotInfoFromJson(json);
}

/// Aggregate of scheduled & completed actions for different care categories.
@freezed
class PlantActions with _$PlantActions {
  const factory PlantActions({
    ActionSchedule? watering,
    ActionSchedule? fertilizing,
    ActionSchedule? repotting,
    ActionSchedule? cleaning,
    ActionSchedule? progressUpdate,
    ActionSchedule? misting,
  }) = _PlantActions;

  factory PlantActions.fromJson(Map<String, dynamic> json) =>
      _$PlantActionsFromJson(json);
}

/// Holds upcoming ([next])
/// and last completed ([completed]) instances of an action.
@freezed
class ActionSchedule with _$ActionSchedule {
  const factory ActionSchedule({
    ActionInstance? next,
    ActionInstance? completed,
  }) = _ActionSchedule;

  factory ActionSchedule.fromJson(Map<String, dynamic> json) =>
      _$ActionScheduleFromJson(json);
}

/// A single action occurrence (next due or completed).
@freezed
class ActionInstance with _$ActionInstance {
  const factory ActionInstance({
    @NullableDateTimeTryParseConverter() DateTime? date,
    String? type,
  }) = _ActionInstance;

  factory ActionInstance.fromJson(Map<String, dynamic> json) =>
      _$ActionInstanceFromJson(json);
}

/// Supported action types recognized by the API.
///
/// Use [apiValue] when serializing for requests.
/// Use [ActionType.fromApiValue] to safely map a string back to the enum.
@JsonEnum(fieldRename: FieldRename.none)
enum ActionType {
  @JsonValue('watering')
  watering('watering'),
  @JsonValue('fertilizing')
  fertilizing('fertilizing'),
  @JsonValue('repotting')
  repotting('repotting'),
  @JsonValue('cleaning')
  cleaning('cleaning'),
  @JsonValue('progressUpdate')
  progressUpdate('progressUpdate'),
  @JsonValue('misting')
  misting('misting');

  /// Raw string value expected by the API.
  final String apiValue;
  const ActionType(this.apiValue);

  /// Map a raw API string to an enum (null if unknown).
  static ActionType? fromApiValue(String value) {
    for (final v in ActionType.values) {
      if (v.apiValue == value) return v;
    }
    return null;
  }
}
