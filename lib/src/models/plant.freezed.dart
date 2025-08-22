// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddedPlant _$AddedPlantFromJson(Map<String, dynamic> json) {
  return _AddedPlant.fromJson(json);
}

/// @nodoc
mixin _$AddedPlant {
  String get id => throw _privateConstructorUsedError;
  PlantNames? get names => throw _privateConstructorUsedError;
  PlantSite? get site => throw _privateConstructorUsedError;
  PlantImage? get image => throw _privateConstructorUsedError;
  PlantCare? get plantCare => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  String? get health => throw _privateConstructorUsedError;
  EnvironmentInfo? get environment => throw _privateConstructorUsedError;
  PlantActions? get actions => throw _privateConstructorUsedError;

  /// Serializes this AddedPlant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddedPlantCopyWith<AddedPlant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddedPlantCopyWith<$Res> {
  factory $AddedPlantCopyWith(
          AddedPlant value, $Res Function(AddedPlant) then) =
      _$AddedPlantCopyWithImpl<$Res, AddedPlant>;
  @useResult
  $Res call(
      {String id,
      PlantNames? names,
      PlantSite? site,
      PlantImage? image,
      PlantCare? plantCare,
      int? size,
      String? health,
      EnvironmentInfo? environment,
      PlantActions? actions});

  $PlantNamesCopyWith<$Res>? get names;
  $PlantSiteCopyWith<$Res>? get site;
  $PlantImageCopyWith<$Res>? get image;
  $PlantCareCopyWith<$Res>? get plantCare;
  $EnvironmentInfoCopyWith<$Res>? get environment;
  $PlantActionsCopyWith<$Res>? get actions;
}

/// @nodoc
class _$AddedPlantCopyWithImpl<$Res, $Val extends AddedPlant>
    implements $AddedPlantCopyWith<$Res> {
  _$AddedPlantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? names = freezed,
    Object? site = freezed,
    Object? image = freezed,
    Object? plantCare = freezed,
    Object? size = freezed,
    Object? health = freezed,
    Object? environment = freezed,
    Object? actions = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      names: freezed == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as PlantNames?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as PlantSite?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PlantImage?,
      plantCare: freezed == plantCare
          ? _value.plantCare
          : plantCare // ignore: cast_nullable_to_non_nullable
              as PlantCare?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      health: freezed == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as String?,
      environment: freezed == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as EnvironmentInfo?,
      actions: freezed == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as PlantActions?,
    ) as $Val);
  }

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlantNamesCopyWith<$Res>? get names {
    if (_value.names == null) {
      return null;
    }

    return $PlantNamesCopyWith<$Res>(_value.names!, (value) {
      return _then(_value.copyWith(names: value) as $Val);
    });
  }

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlantSiteCopyWith<$Res>? get site {
    if (_value.site == null) {
      return null;
    }

    return $PlantSiteCopyWith<$Res>(_value.site!, (value) {
      return _then(_value.copyWith(site: value) as $Val);
    });
  }

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlantImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $PlantImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlantCareCopyWith<$Res>? get plantCare {
    if (_value.plantCare == null) {
      return null;
    }

    return $PlantCareCopyWith<$Res>(_value.plantCare!, (value) {
      return _then(_value.copyWith(plantCare: value) as $Val);
    });
  }

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EnvironmentInfoCopyWith<$Res>? get environment {
    if (_value.environment == null) {
      return null;
    }

    return $EnvironmentInfoCopyWith<$Res>(_value.environment!, (value) {
      return _then(_value.copyWith(environment: value) as $Val);
    });
  }

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlantActionsCopyWith<$Res>? get actions {
    if (_value.actions == null) {
      return null;
    }

    return $PlantActionsCopyWith<$Res>(_value.actions!, (value) {
      return _then(_value.copyWith(actions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddedPlantImplCopyWith<$Res>
    implements $AddedPlantCopyWith<$Res> {
  factory _$$AddedPlantImplCopyWith(
          _$AddedPlantImpl value, $Res Function(_$AddedPlantImpl) then) =
      __$$AddedPlantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PlantNames? names,
      PlantSite? site,
      PlantImage? image,
      PlantCare? plantCare,
      int? size,
      String? health,
      EnvironmentInfo? environment,
      PlantActions? actions});

  @override
  $PlantNamesCopyWith<$Res>? get names;
  @override
  $PlantSiteCopyWith<$Res>? get site;
  @override
  $PlantImageCopyWith<$Res>? get image;
  @override
  $PlantCareCopyWith<$Res>? get plantCare;
  @override
  $EnvironmentInfoCopyWith<$Res>? get environment;
  @override
  $PlantActionsCopyWith<$Res>? get actions;
}

/// @nodoc
class __$$AddedPlantImplCopyWithImpl<$Res>
    extends _$AddedPlantCopyWithImpl<$Res, _$AddedPlantImpl>
    implements _$$AddedPlantImplCopyWith<$Res> {
  __$$AddedPlantImplCopyWithImpl(
      _$AddedPlantImpl _value, $Res Function(_$AddedPlantImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? names = freezed,
    Object? site = freezed,
    Object? image = freezed,
    Object? plantCare = freezed,
    Object? size = freezed,
    Object? health = freezed,
    Object? environment = freezed,
    Object? actions = freezed,
  }) {
    return _then(_$AddedPlantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      names: freezed == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as PlantNames?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as PlantSite?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PlantImage?,
      plantCare: freezed == plantCare
          ? _value.plantCare
          : plantCare // ignore: cast_nullable_to_non_nullable
              as PlantCare?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      health: freezed == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as String?,
      environment: freezed == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as EnvironmentInfo?,
      actions: freezed == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as PlantActions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddedPlantImpl implements _AddedPlant {
  const _$AddedPlantImpl(
      {required this.id,
      this.names,
      this.site,
      this.image,
      this.plantCare,
      this.size,
      this.health,
      this.environment,
      this.actions});

  factory _$AddedPlantImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddedPlantImplFromJson(json);

  @override
  final String id;
  @override
  final PlantNames? names;
  @override
  final PlantSite? site;
  @override
  final PlantImage? image;
  @override
  final PlantCare? plantCare;
  @override
  final int? size;
  @override
  final String? health;
  @override
  final EnvironmentInfo? environment;
  @override
  final PlantActions? actions;

  @override
  String toString() {
    return 'AddedPlant(id: $id, names: $names, site: $site, image: $image, plantCare: $plantCare, size: $size, health: $health, environment: $environment, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddedPlantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.names, names) || other.names == names) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.plantCare, plantCare) ||
                other.plantCare == plantCare) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.environment, environment) ||
                other.environment == environment) &&
            (identical(other.actions, actions) || other.actions == actions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, names, site, image,
      plantCare, size, health, environment, actions);

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddedPlantImplCopyWith<_$AddedPlantImpl> get copyWith =>
      __$$AddedPlantImplCopyWithImpl<_$AddedPlantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddedPlantImplToJson(
      this,
    );
  }
}

abstract class _AddedPlant implements AddedPlant {
  const factory _AddedPlant(
      {required final String id,
      final PlantNames? names,
      final PlantSite? site,
      final PlantImage? image,
      final PlantCare? plantCare,
      final int? size,
      final String? health,
      final EnvironmentInfo? environment,
      final PlantActions? actions}) = _$AddedPlantImpl;

  factory _AddedPlant.fromJson(Map<String, dynamic> json) =
      _$AddedPlantImpl.fromJson;

  @override
  String get id;
  @override
  PlantNames? get names;
  @override
  PlantSite? get site;
  @override
  PlantImage? get image;
  @override
  PlantCare? get plantCare;
  @override
  int? get size;
  @override
  String? get health;
  @override
  EnvironmentInfo? get environment;
  @override
  PlantActions? get actions;

  /// Create a copy of AddedPlant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddedPlantImplCopyWith<_$AddedPlantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlantNames _$PlantNamesFromJson(Map<String, dynamic> json) {
  return _PlantNames.fromJson(json);
}

/// @nodoc
mixin _$PlantNames {
  String? get localizedName => throw _privateConstructorUsedError;
  String? get variety => throw _privateConstructorUsedError;
  String? get custom => throw _privateConstructorUsedError;
  String? get scientific => throw _privateConstructorUsedError;

  /// Serializes this PlantNames to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantNames
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantNamesCopyWith<PlantNames> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantNamesCopyWith<$Res> {
  factory $PlantNamesCopyWith(
          PlantNames value, $Res Function(PlantNames) then) =
      _$PlantNamesCopyWithImpl<$Res, PlantNames>;
  @useResult
  $Res call(
      {String? localizedName,
      String? variety,
      String? custom,
      String? scientific});
}

/// @nodoc
class _$PlantNamesCopyWithImpl<$Res, $Val extends PlantNames>
    implements $PlantNamesCopyWith<$Res> {
  _$PlantNamesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantNames
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localizedName = freezed,
    Object? variety = freezed,
    Object? custom = freezed,
    Object? scientific = freezed,
  }) {
    return _then(_value.copyWith(
      localizedName: freezed == localizedName
          ? _value.localizedName
          : localizedName // ignore: cast_nullable_to_non_nullable
              as String?,
      variety: freezed == variety
          ? _value.variety
          : variety // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _value.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as String?,
      scientific: freezed == scientific
          ? _value.scientific
          : scientific // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantNamesImplCopyWith<$Res>
    implements $PlantNamesCopyWith<$Res> {
  factory _$$PlantNamesImplCopyWith(
          _$PlantNamesImpl value, $Res Function(_$PlantNamesImpl) then) =
      __$$PlantNamesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? localizedName,
      String? variety,
      String? custom,
      String? scientific});
}

/// @nodoc
class __$$PlantNamesImplCopyWithImpl<$Res>
    extends _$PlantNamesCopyWithImpl<$Res, _$PlantNamesImpl>
    implements _$$PlantNamesImplCopyWith<$Res> {
  __$$PlantNamesImplCopyWithImpl(
      _$PlantNamesImpl _value, $Res Function(_$PlantNamesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantNames
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localizedName = freezed,
    Object? variety = freezed,
    Object? custom = freezed,
    Object? scientific = freezed,
  }) {
    return _then(_$PlantNamesImpl(
      localizedName: freezed == localizedName
          ? _value.localizedName
          : localizedName // ignore: cast_nullable_to_non_nullable
              as String?,
      variety: freezed == variety
          ? _value.variety
          : variety // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _value.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as String?,
      scientific: freezed == scientific
          ? _value.scientific
          : scientific // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantNamesImpl implements _PlantNames {
  const _$PlantNamesImpl(
      {this.localizedName, this.variety, this.custom, this.scientific});

  factory _$PlantNamesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantNamesImplFromJson(json);

  @override
  final String? localizedName;
  @override
  final String? variety;
  @override
  final String? custom;
  @override
  final String? scientific;

  @override
  String toString() {
    return 'PlantNames(localizedName: $localizedName, variety: $variety, custom: $custom, scientific: $scientific)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantNamesImpl &&
            (identical(other.localizedName, localizedName) ||
                other.localizedName == localizedName) &&
            (identical(other.variety, variety) || other.variety == variety) &&
            (identical(other.custom, custom) || other.custom == custom) &&
            (identical(other.scientific, scientific) ||
                other.scientific == scientific));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, localizedName, variety, custom, scientific);

  /// Create a copy of PlantNames
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantNamesImplCopyWith<_$PlantNamesImpl> get copyWith =>
      __$$PlantNamesImplCopyWithImpl<_$PlantNamesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantNamesImplToJson(
      this,
    );
  }
}

abstract class _PlantNames implements PlantNames {
  const factory _PlantNames(
      {final String? localizedName,
      final String? variety,
      final String? custom,
      final String? scientific}) = _$PlantNamesImpl;

  factory _PlantNames.fromJson(Map<String, dynamic> json) =
      _$PlantNamesImpl.fromJson;

  @override
  String? get localizedName;
  @override
  String? get variety;
  @override
  String? get custom;
  @override
  String? get scientific;

  /// Create a copy of PlantNames
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantNamesImplCopyWith<_$PlantNamesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlantSite _$PlantSiteFromJson(Map<String, dynamic> json) {
  return _PlantSite.fromJson(json);
}

/// @nodoc
mixin _$PlantSite {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get hasGrowLight => throw _privateConstructorUsedError;
  int? get activeGrowLightHours => throw _privateConstructorUsedError;

  /// Serializes this PlantSite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantSite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantSiteCopyWith<PlantSite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantSiteCopyWith<$Res> {
  factory $PlantSiteCopyWith(PlantSite value, $Res Function(PlantSite) then) =
      _$PlantSiteCopyWithImpl<$Res, PlantSite>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      bool? hasGrowLight,
      int? activeGrowLightHours});
}

/// @nodoc
class _$PlantSiteCopyWithImpl<$Res, $Val extends PlantSite>
    implements $PlantSiteCopyWith<$Res> {
  _$PlantSiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantSite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? hasGrowLight = freezed,
    Object? activeGrowLightHours = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      hasGrowLight: freezed == hasGrowLight
          ? _value.hasGrowLight
          : hasGrowLight // ignore: cast_nullable_to_non_nullable
              as bool?,
      activeGrowLightHours: freezed == activeGrowLightHours
          ? _value.activeGrowLightHours
          : activeGrowLightHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantSiteImplCopyWith<$Res>
    implements $PlantSiteCopyWith<$Res> {
  factory _$$PlantSiteImplCopyWith(
          _$PlantSiteImpl value, $Res Function(_$PlantSiteImpl) then) =
      __$$PlantSiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      bool? hasGrowLight,
      int? activeGrowLightHours});
}

/// @nodoc
class __$$PlantSiteImplCopyWithImpl<$Res>
    extends _$PlantSiteCopyWithImpl<$Res, _$PlantSiteImpl>
    implements _$$PlantSiteImplCopyWith<$Res> {
  __$$PlantSiteImplCopyWithImpl(
      _$PlantSiteImpl _value, $Res Function(_$PlantSiteImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantSite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? hasGrowLight = freezed,
    Object? activeGrowLightHours = freezed,
  }) {
    return _then(_$PlantSiteImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      hasGrowLight: freezed == hasGrowLight
          ? _value.hasGrowLight
          : hasGrowLight // ignore: cast_nullable_to_non_nullable
              as bool?,
      activeGrowLightHours: freezed == activeGrowLightHours
          ? _value.activeGrowLightHours
          : activeGrowLightHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantSiteImpl implements _PlantSite {
  const _$PlantSiteImpl(
      {this.id, this.name, this.hasGrowLight, this.activeGrowLightHours});

  factory _$PlantSiteImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantSiteImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final bool? hasGrowLight;
  @override
  final int? activeGrowLightHours;

  @override
  String toString() {
    return 'PlantSite(id: $id, name: $name, hasGrowLight: $hasGrowLight, activeGrowLightHours: $activeGrowLightHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantSiteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hasGrowLight, hasGrowLight) ||
                other.hasGrowLight == hasGrowLight) &&
            (identical(other.activeGrowLightHours, activeGrowLightHours) ||
                other.activeGrowLightHours == activeGrowLightHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, hasGrowLight, activeGrowLightHours);

  /// Create a copy of PlantSite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantSiteImplCopyWith<_$PlantSiteImpl> get copyWith =>
      __$$PlantSiteImplCopyWithImpl<_$PlantSiteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantSiteImplToJson(
      this,
    );
  }
}

abstract class _PlantSite implements PlantSite {
  const factory _PlantSite(
      {final String? id,
      final String? name,
      final bool? hasGrowLight,
      final int? activeGrowLightHours}) = _$PlantSiteImpl;

  factory _PlantSite.fromJson(Map<String, dynamic> json) =
      _$PlantSiteImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  bool? get hasGrowLight;
  @override
  int? get activeGrowLightHours;

  /// Create a copy of PlantSite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantSiteImplCopyWith<_$PlantSiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlantImage _$PlantImageFromJson(Map<String, dynamic> json) {
  return _PlantImage.fromJson(json);
}

/// @nodoc
mixin _$PlantImage {
  String? get url => throw _privateConstructorUsedError;
  @NullableDateTimeTryParseConverter()
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this PlantImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantImageCopyWith<PlantImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantImageCopyWith<$Res> {
  factory $PlantImageCopyWith(
          PlantImage value, $Res Function(PlantImage) then) =
      _$PlantImageCopyWithImpl<$Res, PlantImage>;
  @useResult
  $Res call(
      {String? url,
      @NullableDateTimeTryParseConverter() DateTime? lastUpdated});
}

/// @nodoc
class _$PlantImageCopyWithImpl<$Res, $Val extends PlantImage>
    implements $PlantImageCopyWith<$Res> {
  _$PlantImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantImageImplCopyWith<$Res>
    implements $PlantImageCopyWith<$Res> {
  factory _$$PlantImageImplCopyWith(
          _$PlantImageImpl value, $Res Function(_$PlantImageImpl) then) =
      __$$PlantImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      @NullableDateTimeTryParseConverter() DateTime? lastUpdated});
}

/// @nodoc
class __$$PlantImageImplCopyWithImpl<$Res>
    extends _$PlantImageCopyWithImpl<$Res, _$PlantImageImpl>
    implements _$$PlantImageImplCopyWith<$Res> {
  __$$PlantImageImplCopyWithImpl(
      _$PlantImageImpl _value, $Res Function(_$PlantImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$PlantImageImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantImageImpl implements _PlantImage {
  const _$PlantImageImpl(
      {this.url, @NullableDateTimeTryParseConverter() this.lastUpdated});

  factory _$PlantImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantImageImplFromJson(json);

  @override
  final String? url;
  @override
  @NullableDateTimeTryParseConverter()
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'PlantImage(url: $url, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantImageImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, lastUpdated);

  /// Create a copy of PlantImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantImageImplCopyWith<_$PlantImageImpl> get copyWith =>
      __$$PlantImageImplCopyWithImpl<_$PlantImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantImageImplToJson(
      this,
    );
  }
}

abstract class _PlantImage implements PlantImage {
  const factory _PlantImage(
          {final String? url,
          @NullableDateTimeTryParseConverter() final DateTime? lastUpdated}) =
      _$PlantImageImpl;

  factory _PlantImage.fromJson(Map<String, dynamic> json) =
      _$PlantImageImpl.fromJson;

  @override
  String? get url;
  @override
  @NullableDateTimeTryParseConverter()
  DateTime? get lastUpdated;

  /// Create a copy of PlantImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantImageImplCopyWith<_$PlantImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlantCare _$PlantCareFromJson(Map<String, dynamic> json) {
  return _PlantCare.fromJson(json);
}

/// @nodoc
mixin _$PlantCare {
  CustomCareInterval? get customWatering => throw _privateConstructorUsedError;
  CustomCareInterval? get customFertilizing =>
      throw _privateConstructorUsedError;

  /// Serializes this PlantCare to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantCareCopyWith<PlantCare> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantCareCopyWith<$Res> {
  factory $PlantCareCopyWith(PlantCare value, $Res Function(PlantCare) then) =
      _$PlantCareCopyWithImpl<$Res, PlantCare>;
  @useResult
  $Res call(
      {CustomCareInterval? customWatering,
      CustomCareInterval? customFertilizing});

  $CustomCareIntervalCopyWith<$Res>? get customWatering;
  $CustomCareIntervalCopyWith<$Res>? get customFertilizing;
}

/// @nodoc
class _$PlantCareCopyWithImpl<$Res, $Val extends PlantCare>
    implements $PlantCareCopyWith<$Res> {
  _$PlantCareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customWatering = freezed,
    Object? customFertilizing = freezed,
  }) {
    return _then(_value.copyWith(
      customWatering: freezed == customWatering
          ? _value.customWatering
          : customWatering // ignore: cast_nullable_to_non_nullable
              as CustomCareInterval?,
      customFertilizing: freezed == customFertilizing
          ? _value.customFertilizing
          : customFertilizing // ignore: cast_nullable_to_non_nullable
              as CustomCareInterval?,
    ) as $Val);
  }

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomCareIntervalCopyWith<$Res>? get customWatering {
    if (_value.customWatering == null) {
      return null;
    }

    return $CustomCareIntervalCopyWith<$Res>(_value.customWatering!, (value) {
      return _then(_value.copyWith(customWatering: value) as $Val);
    });
  }

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomCareIntervalCopyWith<$Res>? get customFertilizing {
    if (_value.customFertilizing == null) {
      return null;
    }

    return $CustomCareIntervalCopyWith<$Res>(_value.customFertilizing!,
        (value) {
      return _then(_value.copyWith(customFertilizing: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlantCareImplCopyWith<$Res>
    implements $PlantCareCopyWith<$Res> {
  factory _$$PlantCareImplCopyWith(
          _$PlantCareImpl value, $Res Function(_$PlantCareImpl) then) =
      __$$PlantCareImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomCareInterval? customWatering,
      CustomCareInterval? customFertilizing});

  @override
  $CustomCareIntervalCopyWith<$Res>? get customWatering;
  @override
  $CustomCareIntervalCopyWith<$Res>? get customFertilizing;
}

/// @nodoc
class __$$PlantCareImplCopyWithImpl<$Res>
    extends _$PlantCareCopyWithImpl<$Res, _$PlantCareImpl>
    implements _$$PlantCareImplCopyWith<$Res> {
  __$$PlantCareImplCopyWithImpl(
      _$PlantCareImpl _value, $Res Function(_$PlantCareImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customWatering = freezed,
    Object? customFertilizing = freezed,
  }) {
    return _then(_$PlantCareImpl(
      customWatering: freezed == customWatering
          ? _value.customWatering
          : customWatering // ignore: cast_nullable_to_non_nullable
              as CustomCareInterval?,
      customFertilizing: freezed == customFertilizing
          ? _value.customFertilizing
          : customFertilizing // ignore: cast_nullable_to_non_nullable
              as CustomCareInterval?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantCareImpl implements _PlantCare {
  const _$PlantCareImpl({this.customWatering, this.customFertilizing});

  factory _$PlantCareImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantCareImplFromJson(json);

  @override
  final CustomCareInterval? customWatering;
  @override
  final CustomCareInterval? customFertilizing;

  @override
  String toString() {
    return 'PlantCare(customWatering: $customWatering, customFertilizing: $customFertilizing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantCareImpl &&
            (identical(other.customWatering, customWatering) ||
                other.customWatering == customWatering) &&
            (identical(other.customFertilizing, customFertilizing) ||
                other.customFertilizing == customFertilizing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, customWatering, customFertilizing);

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantCareImplCopyWith<_$PlantCareImpl> get copyWith =>
      __$$PlantCareImplCopyWithImpl<_$PlantCareImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantCareImplToJson(
      this,
    );
  }
}

abstract class _PlantCare implements PlantCare {
  const factory _PlantCare(
      {final CustomCareInterval? customWatering,
      final CustomCareInterval? customFertilizing}) = _$PlantCareImpl;

  factory _PlantCare.fromJson(Map<String, dynamic> json) =
      _$PlantCareImpl.fromJson;

  @override
  CustomCareInterval? get customWatering;
  @override
  CustomCareInterval? get customFertilizing;

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantCareImplCopyWith<_$PlantCareImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomCareInterval _$CustomCareIntervalFromJson(Map<String, dynamic> json) {
  return _CustomCareInterval.fromJson(json);
}

/// @nodoc
mixin _$CustomCareInterval {
  bool? get enabled => throw _privateConstructorUsedError;
  int? get intervalWarmPeriod => throw _privateConstructorUsedError;
  int? get intervalColdPeriod => throw _privateConstructorUsedError;

  /// Serializes this CustomCareInterval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomCareInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomCareIntervalCopyWith<CustomCareInterval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomCareIntervalCopyWith<$Res> {
  factory $CustomCareIntervalCopyWith(
          CustomCareInterval value, $Res Function(CustomCareInterval) then) =
      _$CustomCareIntervalCopyWithImpl<$Res, CustomCareInterval>;
  @useResult
  $Res call({bool? enabled, int? intervalWarmPeriod, int? intervalColdPeriod});
}

/// @nodoc
class _$CustomCareIntervalCopyWithImpl<$Res, $Val extends CustomCareInterval>
    implements $CustomCareIntervalCopyWith<$Res> {
  _$CustomCareIntervalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomCareInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
    Object? intervalWarmPeriod = freezed,
    Object? intervalColdPeriod = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      intervalWarmPeriod: freezed == intervalWarmPeriod
          ? _value.intervalWarmPeriod
          : intervalWarmPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      intervalColdPeriod: freezed == intervalColdPeriod
          ? _value.intervalColdPeriod
          : intervalColdPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomCareIntervalImplCopyWith<$Res>
    implements $CustomCareIntervalCopyWith<$Res> {
  factory _$$CustomCareIntervalImplCopyWith(_$CustomCareIntervalImpl value,
          $Res Function(_$CustomCareIntervalImpl) then) =
      __$$CustomCareIntervalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? enabled, int? intervalWarmPeriod, int? intervalColdPeriod});
}

/// @nodoc
class __$$CustomCareIntervalImplCopyWithImpl<$Res>
    extends _$CustomCareIntervalCopyWithImpl<$Res, _$CustomCareIntervalImpl>
    implements _$$CustomCareIntervalImplCopyWith<$Res> {
  __$$CustomCareIntervalImplCopyWithImpl(_$CustomCareIntervalImpl _value,
      $Res Function(_$CustomCareIntervalImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomCareInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
    Object? intervalWarmPeriod = freezed,
    Object? intervalColdPeriod = freezed,
  }) {
    return _then(_$CustomCareIntervalImpl(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      intervalWarmPeriod: freezed == intervalWarmPeriod
          ? _value.intervalWarmPeriod
          : intervalWarmPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      intervalColdPeriod: freezed == intervalColdPeriod
          ? _value.intervalColdPeriod
          : intervalColdPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomCareIntervalImpl implements _CustomCareInterval {
  const _$CustomCareIntervalImpl(
      {this.enabled, this.intervalWarmPeriod, this.intervalColdPeriod});

  factory _$CustomCareIntervalImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomCareIntervalImplFromJson(json);

  @override
  final bool? enabled;
  @override
  final int? intervalWarmPeriod;
  @override
  final int? intervalColdPeriod;

  @override
  String toString() {
    return 'CustomCareInterval(enabled: $enabled, intervalWarmPeriod: $intervalWarmPeriod, intervalColdPeriod: $intervalColdPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomCareIntervalImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.intervalWarmPeriod, intervalWarmPeriod) ||
                other.intervalWarmPeriod == intervalWarmPeriod) &&
            (identical(other.intervalColdPeriod, intervalColdPeriod) ||
                other.intervalColdPeriod == intervalColdPeriod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, enabled, intervalWarmPeriod, intervalColdPeriod);

  /// Create a copy of CustomCareInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomCareIntervalImplCopyWith<_$CustomCareIntervalImpl> get copyWith =>
      __$$CustomCareIntervalImplCopyWithImpl<_$CustomCareIntervalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomCareIntervalImplToJson(
      this,
    );
  }
}

abstract class _CustomCareInterval implements CustomCareInterval {
  const factory _CustomCareInterval(
      {final bool? enabled,
      final int? intervalWarmPeriod,
      final int? intervalColdPeriod}) = _$CustomCareIntervalImpl;

  factory _CustomCareInterval.fromJson(Map<String, dynamic> json) =
      _$CustomCareIntervalImpl.fromJson;

  @override
  bool? get enabled;
  @override
  int? get intervalWarmPeriod;
  @override
  int? get intervalColdPeriod;

  /// Create a copy of CustomCareInterval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomCareIntervalImplCopyWith<_$CustomCareIntervalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnvironmentInfo _$EnvironmentInfoFromJson(Map<String, dynamic> json) {
  return _EnvironmentInfo.fromJson(json);
}

/// @nodoc
mixin _$EnvironmentInfo {
  bool? get isNearAc => throw _privateConstructorUsedError;
  bool? get isNearHeater => throw _privateConstructorUsedError;
  LightInfo? get light => throw _privateConstructorUsedError;
  PotInfo? get pot => throw _privateConstructorUsedError;

  /// Serializes this EnvironmentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnvironmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnvironmentInfoCopyWith<EnvironmentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentInfoCopyWith<$Res> {
  factory $EnvironmentInfoCopyWith(
          EnvironmentInfo value, $Res Function(EnvironmentInfo) then) =
      _$EnvironmentInfoCopyWithImpl<$Res, EnvironmentInfo>;
  @useResult
  $Res call(
      {bool? isNearAc, bool? isNearHeater, LightInfo? light, PotInfo? pot});

  $LightInfoCopyWith<$Res>? get light;
  $PotInfoCopyWith<$Res>? get pot;
}

/// @nodoc
class _$EnvironmentInfoCopyWithImpl<$Res, $Val extends EnvironmentInfo>
    implements $EnvironmentInfoCopyWith<$Res> {
  _$EnvironmentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnvironmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNearAc = freezed,
    Object? isNearHeater = freezed,
    Object? light = freezed,
    Object? pot = freezed,
  }) {
    return _then(_value.copyWith(
      isNearAc: freezed == isNearAc
          ? _value.isNearAc
          : isNearAc // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNearHeater: freezed == isNearHeater
          ? _value.isNearHeater
          : isNearHeater // ignore: cast_nullable_to_non_nullable
              as bool?,
      light: freezed == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as LightInfo?,
      pot: freezed == pot
          ? _value.pot
          : pot // ignore: cast_nullable_to_non_nullable
              as PotInfo?,
    ) as $Val);
  }

  /// Create a copy of EnvironmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightInfoCopyWith<$Res>? get light {
    if (_value.light == null) {
      return null;
    }

    return $LightInfoCopyWith<$Res>(_value.light!, (value) {
      return _then(_value.copyWith(light: value) as $Val);
    });
  }

  /// Create a copy of EnvironmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PotInfoCopyWith<$Res>? get pot {
    if (_value.pot == null) {
      return null;
    }

    return $PotInfoCopyWith<$Res>(_value.pot!, (value) {
      return _then(_value.copyWith(pot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EnvironmentInfoImplCopyWith<$Res>
    implements $EnvironmentInfoCopyWith<$Res> {
  factory _$$EnvironmentInfoImplCopyWith(_$EnvironmentInfoImpl value,
          $Res Function(_$EnvironmentInfoImpl) then) =
      __$$EnvironmentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isNearAc, bool? isNearHeater, LightInfo? light, PotInfo? pot});

  @override
  $LightInfoCopyWith<$Res>? get light;
  @override
  $PotInfoCopyWith<$Res>? get pot;
}

/// @nodoc
class __$$EnvironmentInfoImplCopyWithImpl<$Res>
    extends _$EnvironmentInfoCopyWithImpl<$Res, _$EnvironmentInfoImpl>
    implements _$$EnvironmentInfoImplCopyWith<$Res> {
  __$$EnvironmentInfoImplCopyWithImpl(
      _$EnvironmentInfoImpl _value, $Res Function(_$EnvironmentInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnvironmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNearAc = freezed,
    Object? isNearHeater = freezed,
    Object? light = freezed,
    Object? pot = freezed,
  }) {
    return _then(_$EnvironmentInfoImpl(
      isNearAc: freezed == isNearAc
          ? _value.isNearAc
          : isNearAc // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNearHeater: freezed == isNearHeater
          ? _value.isNearHeater
          : isNearHeater // ignore: cast_nullable_to_non_nullable
              as bool?,
      light: freezed == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as LightInfo?,
      pot: freezed == pot
          ? _value.pot
          : pot // ignore: cast_nullable_to_non_nullable
              as PotInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnvironmentInfoImpl implements _EnvironmentInfo {
  const _$EnvironmentInfoImpl(
      {this.isNearAc, this.isNearHeater, this.light, this.pot});

  factory _$EnvironmentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnvironmentInfoImplFromJson(json);

  @override
  final bool? isNearAc;
  @override
  final bool? isNearHeater;
  @override
  final LightInfo? light;
  @override
  final PotInfo? pot;

  @override
  String toString() {
    return 'EnvironmentInfo(isNearAc: $isNearAc, isNearHeater: $isNearHeater, light: $light, pot: $pot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvironmentInfoImpl &&
            (identical(other.isNearAc, isNearAc) ||
                other.isNearAc == isNearAc) &&
            (identical(other.isNearHeater, isNearHeater) ||
                other.isNearHeater == isNearHeater) &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.pot, pot) || other.pot == pot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isNearAc, isNearHeater, light, pot);

  /// Create a copy of EnvironmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvironmentInfoImplCopyWith<_$EnvironmentInfoImpl> get copyWith =>
      __$$EnvironmentInfoImplCopyWithImpl<_$EnvironmentInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnvironmentInfoImplToJson(
      this,
    );
  }
}

abstract class _EnvironmentInfo implements EnvironmentInfo {
  const factory _EnvironmentInfo(
      {final bool? isNearAc,
      final bool? isNearHeater,
      final LightInfo? light,
      final PotInfo? pot}) = _$EnvironmentInfoImpl;

  factory _EnvironmentInfo.fromJson(Map<String, dynamic> json) =
      _$EnvironmentInfoImpl.fromJson;

  @override
  bool? get isNearAc;
  @override
  bool? get isNearHeater;
  @override
  LightInfo? get light;
  @override
  PotInfo? get pot;

  /// Create a copy of EnvironmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnvironmentInfoImplCopyWith<_$EnvironmentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LightInfo _$LightInfoFromJson(Map<String, dynamic> json) {
  return _LightInfo.fromJson(json);
}

/// @nodoc
mixin _$LightInfo {
  int? get distanceFromWindow => throw _privateConstructorUsedError;
  bool? get hasGrowLight => throw _privateConstructorUsedError;
  int? get activeGrowLightHours => throw _privateConstructorUsedError;

  /// Serializes this LightInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightInfoCopyWith<LightInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightInfoCopyWith<$Res> {
  factory $LightInfoCopyWith(LightInfo value, $Res Function(LightInfo) then) =
      _$LightInfoCopyWithImpl<$Res, LightInfo>;
  @useResult
  $Res call(
      {int? distanceFromWindow, bool? hasGrowLight, int? activeGrowLightHours});
}

/// @nodoc
class _$LightInfoCopyWithImpl<$Res, $Val extends LightInfo>
    implements $LightInfoCopyWith<$Res> {
  _$LightInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distanceFromWindow = freezed,
    Object? hasGrowLight = freezed,
    Object? activeGrowLightHours = freezed,
  }) {
    return _then(_value.copyWith(
      distanceFromWindow: freezed == distanceFromWindow
          ? _value.distanceFromWindow
          : distanceFromWindow // ignore: cast_nullable_to_non_nullable
              as int?,
      hasGrowLight: freezed == hasGrowLight
          ? _value.hasGrowLight
          : hasGrowLight // ignore: cast_nullable_to_non_nullable
              as bool?,
      activeGrowLightHours: freezed == activeGrowLightHours
          ? _value.activeGrowLightHours
          : activeGrowLightHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LightInfoImplCopyWith<$Res>
    implements $LightInfoCopyWith<$Res> {
  factory _$$LightInfoImplCopyWith(
          _$LightInfoImpl value, $Res Function(_$LightInfoImpl) then) =
      __$$LightInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? distanceFromWindow, bool? hasGrowLight, int? activeGrowLightHours});
}

/// @nodoc
class __$$LightInfoImplCopyWithImpl<$Res>
    extends _$LightInfoCopyWithImpl<$Res, _$LightInfoImpl>
    implements _$$LightInfoImplCopyWith<$Res> {
  __$$LightInfoImplCopyWithImpl(
      _$LightInfoImpl _value, $Res Function(_$LightInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LightInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distanceFromWindow = freezed,
    Object? hasGrowLight = freezed,
    Object? activeGrowLightHours = freezed,
  }) {
    return _then(_$LightInfoImpl(
      distanceFromWindow: freezed == distanceFromWindow
          ? _value.distanceFromWindow
          : distanceFromWindow // ignore: cast_nullable_to_non_nullable
              as int?,
      hasGrowLight: freezed == hasGrowLight
          ? _value.hasGrowLight
          : hasGrowLight // ignore: cast_nullable_to_non_nullable
              as bool?,
      activeGrowLightHours: freezed == activeGrowLightHours
          ? _value.activeGrowLightHours
          : activeGrowLightHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LightInfoImpl implements _LightInfo {
  const _$LightInfoImpl(
      {this.distanceFromWindow, this.hasGrowLight, this.activeGrowLightHours});

  factory _$LightInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightInfoImplFromJson(json);

  @override
  final int? distanceFromWindow;
  @override
  final bool? hasGrowLight;
  @override
  final int? activeGrowLightHours;

  @override
  String toString() {
    return 'LightInfo(distanceFromWindow: $distanceFromWindow, hasGrowLight: $hasGrowLight, activeGrowLightHours: $activeGrowLightHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightInfoImpl &&
            (identical(other.distanceFromWindow, distanceFromWindow) ||
                other.distanceFromWindow == distanceFromWindow) &&
            (identical(other.hasGrowLight, hasGrowLight) ||
                other.hasGrowLight == hasGrowLight) &&
            (identical(other.activeGrowLightHours, activeGrowLightHours) ||
                other.activeGrowLightHours == activeGrowLightHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, distanceFromWindow, hasGrowLight, activeGrowLightHours);

  /// Create a copy of LightInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightInfoImplCopyWith<_$LightInfoImpl> get copyWith =>
      __$$LightInfoImplCopyWithImpl<_$LightInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LightInfoImplToJson(
      this,
    );
  }
}

abstract class _LightInfo implements LightInfo {
  const factory _LightInfo(
      {final int? distanceFromWindow,
      final bool? hasGrowLight,
      final int? activeGrowLightHours}) = _$LightInfoImpl;

  factory _LightInfo.fromJson(Map<String, dynamic> json) =
      _$LightInfoImpl.fromJson;

  @override
  int? get distanceFromWindow;
  @override
  bool? get hasGrowLight;
  @override
  int? get activeGrowLightHours;

  /// Create a copy of LightInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightInfoImplCopyWith<_$LightInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PotInfo _$PotInfoFromJson(Map<String, dynamic> json) {
  return _PotInfo.fromJson(json);
}

/// @nodoc
mixin _$PotInfo {
  String? get type => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  String? get soil => throw _privateConstructorUsedError;
  bool? get hasDrainage => throw _privateConstructorUsedError;

  /// Serializes this PotInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PotInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PotInfoCopyWith<PotInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PotInfoCopyWith<$Res> {
  factory $PotInfoCopyWith(PotInfo value, $Res Function(PotInfo) then) =
      _$PotInfoCopyWithImpl<$Res, PotInfo>;
  @useResult
  $Res call({String? type, int? size, String? soil, bool? hasDrainage});
}

/// @nodoc
class _$PotInfoCopyWithImpl<$Res, $Val extends PotInfo>
    implements $PotInfoCopyWith<$Res> {
  _$PotInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PotInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? size = freezed,
    Object? soil = freezed,
    Object? hasDrainage = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      soil: freezed == soil
          ? _value.soil
          : soil // ignore: cast_nullable_to_non_nullable
              as String?,
      hasDrainage: freezed == hasDrainage
          ? _value.hasDrainage
          : hasDrainage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PotInfoImplCopyWith<$Res> implements $PotInfoCopyWith<$Res> {
  factory _$$PotInfoImplCopyWith(
          _$PotInfoImpl value, $Res Function(_$PotInfoImpl) then) =
      __$$PotInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, int? size, String? soil, bool? hasDrainage});
}

/// @nodoc
class __$$PotInfoImplCopyWithImpl<$Res>
    extends _$PotInfoCopyWithImpl<$Res, _$PotInfoImpl>
    implements _$$PotInfoImplCopyWith<$Res> {
  __$$PotInfoImplCopyWithImpl(
      _$PotInfoImpl _value, $Res Function(_$PotInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PotInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? size = freezed,
    Object? soil = freezed,
    Object? hasDrainage = freezed,
  }) {
    return _then(_$PotInfoImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      soil: freezed == soil
          ? _value.soil
          : soil // ignore: cast_nullable_to_non_nullable
              as String?,
      hasDrainage: freezed == hasDrainage
          ? _value.hasDrainage
          : hasDrainage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PotInfoImpl implements _PotInfo {
  const _$PotInfoImpl({this.type, this.size, this.soil, this.hasDrainage});

  factory _$PotInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PotInfoImplFromJson(json);

  @override
  final String? type;
  @override
  final int? size;
  @override
  final String? soil;
  @override
  final bool? hasDrainage;

  @override
  String toString() {
    return 'PotInfo(type: $type, size: $size, soil: $soil, hasDrainage: $hasDrainage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PotInfoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.soil, soil) || other.soil == soil) &&
            (identical(other.hasDrainage, hasDrainage) ||
                other.hasDrainage == hasDrainage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, size, soil, hasDrainage);

  /// Create a copy of PotInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PotInfoImplCopyWith<_$PotInfoImpl> get copyWith =>
      __$$PotInfoImplCopyWithImpl<_$PotInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PotInfoImplToJson(
      this,
    );
  }
}

abstract class _PotInfo implements PotInfo {
  const factory _PotInfo(
      {final String? type,
      final int? size,
      final String? soil,
      final bool? hasDrainage}) = _$PotInfoImpl;

  factory _PotInfo.fromJson(Map<String, dynamic> json) = _$PotInfoImpl.fromJson;

  @override
  String? get type;
  @override
  int? get size;
  @override
  String? get soil;
  @override
  bool? get hasDrainage;

  /// Create a copy of PotInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PotInfoImplCopyWith<_$PotInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlantActions _$PlantActionsFromJson(Map<String, dynamic> json) {
  return _PlantActions.fromJson(json);
}

/// @nodoc
mixin _$PlantActions {
  ActionSchedule? get watering => throw _privateConstructorUsedError;
  ActionSchedule? get fertilizing => throw _privateConstructorUsedError;
  ActionSchedule? get repotting => throw _privateConstructorUsedError;
  ActionSchedule? get cleaning => throw _privateConstructorUsedError;
  ActionSchedule? get progressUpdate => throw _privateConstructorUsedError;
  ActionSchedule? get misting => throw _privateConstructorUsedError;

  /// Serializes this PlantActions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantActionsCopyWith<PlantActions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantActionsCopyWith<$Res> {
  factory $PlantActionsCopyWith(
          PlantActions value, $Res Function(PlantActions) then) =
      _$PlantActionsCopyWithImpl<$Res, PlantActions>;
  @useResult
  $Res call(
      {ActionSchedule? watering,
      ActionSchedule? fertilizing,
      ActionSchedule? repotting,
      ActionSchedule? cleaning,
      ActionSchedule? progressUpdate,
      ActionSchedule? misting});

  $ActionScheduleCopyWith<$Res>? get watering;
  $ActionScheduleCopyWith<$Res>? get fertilizing;
  $ActionScheduleCopyWith<$Res>? get repotting;
  $ActionScheduleCopyWith<$Res>? get cleaning;
  $ActionScheduleCopyWith<$Res>? get progressUpdate;
  $ActionScheduleCopyWith<$Res>? get misting;
}

/// @nodoc
class _$PlantActionsCopyWithImpl<$Res, $Val extends PlantActions>
    implements $PlantActionsCopyWith<$Res> {
  _$PlantActionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watering = freezed,
    Object? fertilizing = freezed,
    Object? repotting = freezed,
    Object? cleaning = freezed,
    Object? progressUpdate = freezed,
    Object? misting = freezed,
  }) {
    return _then(_value.copyWith(
      watering: freezed == watering
          ? _value.watering
          : watering // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      fertilizing: freezed == fertilizing
          ? _value.fertilizing
          : fertilizing // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      repotting: freezed == repotting
          ? _value.repotting
          : repotting // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      cleaning: freezed == cleaning
          ? _value.cleaning
          : cleaning // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      progressUpdate: freezed == progressUpdate
          ? _value.progressUpdate
          : progressUpdate // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      misting: freezed == misting
          ? _value.misting
          : misting // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
    ) as $Val);
  }

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionScheduleCopyWith<$Res>? get watering {
    if (_value.watering == null) {
      return null;
    }

    return $ActionScheduleCopyWith<$Res>(_value.watering!, (value) {
      return _then(_value.copyWith(watering: value) as $Val);
    });
  }

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionScheduleCopyWith<$Res>? get fertilizing {
    if (_value.fertilizing == null) {
      return null;
    }

    return $ActionScheduleCopyWith<$Res>(_value.fertilizing!, (value) {
      return _then(_value.copyWith(fertilizing: value) as $Val);
    });
  }

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionScheduleCopyWith<$Res>? get repotting {
    if (_value.repotting == null) {
      return null;
    }

    return $ActionScheduleCopyWith<$Res>(_value.repotting!, (value) {
      return _then(_value.copyWith(repotting: value) as $Val);
    });
  }

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionScheduleCopyWith<$Res>? get cleaning {
    if (_value.cleaning == null) {
      return null;
    }

    return $ActionScheduleCopyWith<$Res>(_value.cleaning!, (value) {
      return _then(_value.copyWith(cleaning: value) as $Val);
    });
  }

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionScheduleCopyWith<$Res>? get progressUpdate {
    if (_value.progressUpdate == null) {
      return null;
    }

    return $ActionScheduleCopyWith<$Res>(_value.progressUpdate!, (value) {
      return _then(_value.copyWith(progressUpdate: value) as $Val);
    });
  }

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionScheduleCopyWith<$Res>? get misting {
    if (_value.misting == null) {
      return null;
    }

    return $ActionScheduleCopyWith<$Res>(_value.misting!, (value) {
      return _then(_value.copyWith(misting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlantActionsImplCopyWith<$Res>
    implements $PlantActionsCopyWith<$Res> {
  factory _$$PlantActionsImplCopyWith(
          _$PlantActionsImpl value, $Res Function(_$PlantActionsImpl) then) =
      __$$PlantActionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ActionSchedule? watering,
      ActionSchedule? fertilizing,
      ActionSchedule? repotting,
      ActionSchedule? cleaning,
      ActionSchedule? progressUpdate,
      ActionSchedule? misting});

  @override
  $ActionScheduleCopyWith<$Res>? get watering;
  @override
  $ActionScheduleCopyWith<$Res>? get fertilizing;
  @override
  $ActionScheduleCopyWith<$Res>? get repotting;
  @override
  $ActionScheduleCopyWith<$Res>? get cleaning;
  @override
  $ActionScheduleCopyWith<$Res>? get progressUpdate;
  @override
  $ActionScheduleCopyWith<$Res>? get misting;
}

/// @nodoc
class __$$PlantActionsImplCopyWithImpl<$Res>
    extends _$PlantActionsCopyWithImpl<$Res, _$PlantActionsImpl>
    implements _$$PlantActionsImplCopyWith<$Res> {
  __$$PlantActionsImplCopyWithImpl(
      _$PlantActionsImpl _value, $Res Function(_$PlantActionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watering = freezed,
    Object? fertilizing = freezed,
    Object? repotting = freezed,
    Object? cleaning = freezed,
    Object? progressUpdate = freezed,
    Object? misting = freezed,
  }) {
    return _then(_$PlantActionsImpl(
      watering: freezed == watering
          ? _value.watering
          : watering // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      fertilizing: freezed == fertilizing
          ? _value.fertilizing
          : fertilizing // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      repotting: freezed == repotting
          ? _value.repotting
          : repotting // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      cleaning: freezed == cleaning
          ? _value.cleaning
          : cleaning // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      progressUpdate: freezed == progressUpdate
          ? _value.progressUpdate
          : progressUpdate // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
      misting: freezed == misting
          ? _value.misting
          : misting // ignore: cast_nullable_to_non_nullable
              as ActionSchedule?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantActionsImpl implements _PlantActions {
  const _$PlantActionsImpl(
      {this.watering,
      this.fertilizing,
      this.repotting,
      this.cleaning,
      this.progressUpdate,
      this.misting});

  factory _$PlantActionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantActionsImplFromJson(json);

  @override
  final ActionSchedule? watering;
  @override
  final ActionSchedule? fertilizing;
  @override
  final ActionSchedule? repotting;
  @override
  final ActionSchedule? cleaning;
  @override
  final ActionSchedule? progressUpdate;
  @override
  final ActionSchedule? misting;

  @override
  String toString() {
    return 'PlantActions(watering: $watering, fertilizing: $fertilizing, repotting: $repotting, cleaning: $cleaning, progressUpdate: $progressUpdate, misting: $misting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantActionsImpl &&
            (identical(other.watering, watering) ||
                other.watering == watering) &&
            (identical(other.fertilizing, fertilizing) ||
                other.fertilizing == fertilizing) &&
            (identical(other.repotting, repotting) ||
                other.repotting == repotting) &&
            (identical(other.cleaning, cleaning) ||
                other.cleaning == cleaning) &&
            (identical(other.progressUpdate, progressUpdate) ||
                other.progressUpdate == progressUpdate) &&
            (identical(other.misting, misting) || other.misting == misting));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, watering, fertilizing, repotting,
      cleaning, progressUpdate, misting);

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantActionsImplCopyWith<_$PlantActionsImpl> get copyWith =>
      __$$PlantActionsImplCopyWithImpl<_$PlantActionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantActionsImplToJson(
      this,
    );
  }
}

abstract class _PlantActions implements PlantActions {
  const factory _PlantActions(
      {final ActionSchedule? watering,
      final ActionSchedule? fertilizing,
      final ActionSchedule? repotting,
      final ActionSchedule? cleaning,
      final ActionSchedule? progressUpdate,
      final ActionSchedule? misting}) = _$PlantActionsImpl;

  factory _PlantActions.fromJson(Map<String, dynamic> json) =
      _$PlantActionsImpl.fromJson;

  @override
  ActionSchedule? get watering;
  @override
  ActionSchedule? get fertilizing;
  @override
  ActionSchedule? get repotting;
  @override
  ActionSchedule? get cleaning;
  @override
  ActionSchedule? get progressUpdate;
  @override
  ActionSchedule? get misting;

  /// Create a copy of PlantActions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantActionsImplCopyWith<_$PlantActionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActionSchedule _$ActionScheduleFromJson(Map<String, dynamic> json) {
  return _ActionSchedule.fromJson(json);
}

/// @nodoc
mixin _$ActionSchedule {
  ActionInstance? get next => throw _privateConstructorUsedError;
  ActionInstance? get completed => throw _privateConstructorUsedError;

  /// Serializes this ActionSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionScheduleCopyWith<ActionSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionScheduleCopyWith<$Res> {
  factory $ActionScheduleCopyWith(
          ActionSchedule value, $Res Function(ActionSchedule) then) =
      _$ActionScheduleCopyWithImpl<$Res, ActionSchedule>;
  @useResult
  $Res call({ActionInstance? next, ActionInstance? completed});

  $ActionInstanceCopyWith<$Res>? get next;
  $ActionInstanceCopyWith<$Res>? get completed;
}

/// @nodoc
class _$ActionScheduleCopyWithImpl<$Res, $Val extends ActionSchedule>
    implements $ActionScheduleCopyWith<$Res> {
  _$ActionScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as ActionInstance?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as ActionInstance?,
    ) as $Val);
  }

  /// Create a copy of ActionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionInstanceCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $ActionInstanceCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }

  /// Create a copy of ActionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActionInstanceCopyWith<$Res>? get completed {
    if (_value.completed == null) {
      return null;
    }

    return $ActionInstanceCopyWith<$Res>(_value.completed!, (value) {
      return _then(_value.copyWith(completed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActionScheduleImplCopyWith<$Res>
    implements $ActionScheduleCopyWith<$Res> {
  factory _$$ActionScheduleImplCopyWith(_$ActionScheduleImpl value,
          $Res Function(_$ActionScheduleImpl) then) =
      __$$ActionScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionInstance? next, ActionInstance? completed});

  @override
  $ActionInstanceCopyWith<$Res>? get next;
  @override
  $ActionInstanceCopyWith<$Res>? get completed;
}

/// @nodoc
class __$$ActionScheduleImplCopyWithImpl<$Res>
    extends _$ActionScheduleCopyWithImpl<$Res, _$ActionScheduleImpl>
    implements _$$ActionScheduleImplCopyWith<$Res> {
  __$$ActionScheduleImplCopyWithImpl(
      _$ActionScheduleImpl _value, $Res Function(_$ActionScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$ActionScheduleImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as ActionInstance?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as ActionInstance?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionScheduleImpl implements _ActionSchedule {
  const _$ActionScheduleImpl({this.next, this.completed});

  factory _$ActionScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionScheduleImplFromJson(json);

  @override
  final ActionInstance? next;
  @override
  final ActionInstance? completed;

  @override
  String toString() {
    return 'ActionSchedule(next: $next, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionScheduleImpl &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next, completed);

  /// Create a copy of ActionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionScheduleImplCopyWith<_$ActionScheduleImpl> get copyWith =>
      __$$ActionScheduleImplCopyWithImpl<_$ActionScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionScheduleImplToJson(
      this,
    );
  }
}

abstract class _ActionSchedule implements ActionSchedule {
  const factory _ActionSchedule(
      {final ActionInstance? next,
      final ActionInstance? completed}) = _$ActionScheduleImpl;

  factory _ActionSchedule.fromJson(Map<String, dynamic> json) =
      _$ActionScheduleImpl.fromJson;

  @override
  ActionInstance? get next;
  @override
  ActionInstance? get completed;

  /// Create a copy of ActionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionScheduleImplCopyWith<_$ActionScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActionInstance _$ActionInstanceFromJson(Map<String, dynamic> json) {
  return _ActionInstance.fromJson(json);
}

/// @nodoc
mixin _$ActionInstance {
  @NullableDateTimeTryParseConverter()
  DateTime? get date => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this ActionInstance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActionInstance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionInstanceCopyWith<ActionInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionInstanceCopyWith<$Res> {
  factory $ActionInstanceCopyWith(
          ActionInstance value, $Res Function(ActionInstance) then) =
      _$ActionInstanceCopyWithImpl<$Res, ActionInstance>;
  @useResult
  $Res call(
      {@NullableDateTimeTryParseConverter() DateTime? date, String? type});
}

/// @nodoc
class _$ActionInstanceCopyWithImpl<$Res, $Val extends ActionInstance>
    implements $ActionInstanceCopyWith<$Res> {
  _$ActionInstanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionInstance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionInstanceImplCopyWith<$Res>
    implements $ActionInstanceCopyWith<$Res> {
  factory _$$ActionInstanceImplCopyWith(_$ActionInstanceImpl value,
          $Res Function(_$ActionInstanceImpl) then) =
      __$$ActionInstanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@NullableDateTimeTryParseConverter() DateTime? date, String? type});
}

/// @nodoc
class __$$ActionInstanceImplCopyWithImpl<$Res>
    extends _$ActionInstanceCopyWithImpl<$Res, _$ActionInstanceImpl>
    implements _$$ActionInstanceImplCopyWith<$Res> {
  __$$ActionInstanceImplCopyWithImpl(
      _$ActionInstanceImpl _value, $Res Function(_$ActionInstanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionInstance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? type = freezed,
  }) {
    return _then(_$ActionInstanceImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionInstanceImpl implements _ActionInstance {
  const _$ActionInstanceImpl(
      {@NullableDateTimeTryParseConverter() this.date, this.type});

  factory _$ActionInstanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionInstanceImplFromJson(json);

  @override
  @NullableDateTimeTryParseConverter()
  final DateTime? date;
  @override
  final String? type;

  @override
  String toString() {
    return 'ActionInstance(date: $date, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionInstanceImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, type);

  /// Create a copy of ActionInstance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionInstanceImplCopyWith<_$ActionInstanceImpl> get copyWith =>
      __$$ActionInstanceImplCopyWithImpl<_$ActionInstanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionInstanceImplToJson(
      this,
    );
  }
}

abstract class _ActionInstance implements ActionInstance {
  const factory _ActionInstance(
      {@NullableDateTimeTryParseConverter() final DateTime? date,
      final String? type}) = _$ActionInstanceImpl;

  factory _ActionInstance.fromJson(Map<String, dynamic> json) =
      _$ActionInstanceImpl.fromJson;

  @override
  @NullableDateTimeTryParseConverter()
  DateTime? get date;
  @override
  String? get type;

  /// Create a copy of ActionInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionInstanceImplCopyWith<_$ActionInstanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
