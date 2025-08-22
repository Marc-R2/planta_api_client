// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  String? get nextPage => throw _privateConstructorUsedError;

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res, Pagination>;
  @useResult
  $Res call({String? nextPage});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res, $Val extends Pagination>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl value, $Res Function(_$PaginationImpl) then) =
      __$$PaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nextPage});
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$PaginationImpl>
    implements _$$PaginationImplCopyWith<$Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl _value, $Res Function(_$PaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPage = freezed,
  }) {
    return _then(_$PaginationImpl(
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationImpl implements _Pagination {
  const _$PaginationImpl({this.nextPage});

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

  @override
  final String? nextPage;

  @override
  String toString() {
    return 'Pagination(nextPage: $nextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nextPage);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      __$$PaginationImplCopyWithImpl<_$PaginationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationImplToJson(
      this,
    );
  }
}

abstract class _Pagination implements Pagination {
  const factory _Pagination({final String? nextPage}) = _$PaginationImpl;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

  @override
  String? get nextPage;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddedPlantsPage {
  List<AddedPlant> get plants => throw _privateConstructorUsedError;
  Pagination? get pagination => throw _privateConstructorUsedError;

  /// Create a copy of AddedPlantsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddedPlantsPageCopyWith<AddedPlantsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddedPlantsPageCopyWith<$Res> {
  factory $AddedPlantsPageCopyWith(
          AddedPlantsPage value, $Res Function(AddedPlantsPage) then) =
      _$AddedPlantsPageCopyWithImpl<$Res, AddedPlantsPage>;
  @useResult
  $Res call({List<AddedPlant> plants, Pagination? pagination});

  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$AddedPlantsPageCopyWithImpl<$Res, $Val extends AddedPlantsPage>
    implements $AddedPlantsPageCopyWith<$Res> {
  _$AddedPlantsPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddedPlantsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plants = null,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      plants: null == plants
          ? _value.plants
          : plants // ignore: cast_nullable_to_non_nullable
              as List<AddedPlant>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ) as $Val);
  }

  /// Create a copy of AddedPlantsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddedPlantsPageImplCopyWith<$Res>
    implements $AddedPlantsPageCopyWith<$Res> {
  factory _$$AddedPlantsPageImplCopyWith(_$AddedPlantsPageImpl value,
          $Res Function(_$AddedPlantsPageImpl) then) =
      __$$AddedPlantsPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AddedPlant> plants, Pagination? pagination});

  @override
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$AddedPlantsPageImplCopyWithImpl<$Res>
    extends _$AddedPlantsPageCopyWithImpl<$Res, _$AddedPlantsPageImpl>
    implements _$$AddedPlantsPageImplCopyWith<$Res> {
  __$$AddedPlantsPageImplCopyWithImpl(
      _$AddedPlantsPageImpl _value, $Res Function(_$AddedPlantsPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddedPlantsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plants = null,
    Object? pagination = freezed,
  }) {
    return _then(_$AddedPlantsPageImpl(
      null == plants
          ? _value._plants
          : plants // ignore: cast_nullable_to_non_nullable
              as List<AddedPlant>,
      freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ));
  }
}

/// @nodoc

class _$AddedPlantsPageImpl extends _AddedPlantsPage {
  const _$AddedPlantsPageImpl(final List<AddedPlant> plants, this.pagination)
      : _plants = plants,
        super._();

  final List<AddedPlant> _plants;
  @override
  List<AddedPlant> get plants {
    if (_plants is EqualUnmodifiableListView) return _plants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plants);
  }

  @override
  final Pagination? pagination;

  @override
  String toString() {
    return 'AddedPlantsPage(plants: $plants, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddedPlantsPageImpl &&
            const DeepCollectionEquality().equals(other._plants, _plants) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_plants), pagination);

  /// Create a copy of AddedPlantsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddedPlantsPageImplCopyWith<_$AddedPlantsPageImpl> get copyWith =>
      __$$AddedPlantsPageImplCopyWithImpl<_$AddedPlantsPageImpl>(
          this, _$identity);
}

abstract class _AddedPlantsPage extends AddedPlantsPage {
  const factory _AddedPlantsPage(
          final List<AddedPlant> plants, final Pagination? pagination) =
      _$AddedPlantsPageImpl;
  const _AddedPlantsPage._() : super._();

  @override
  List<AddedPlant> get plants;
  @override
  Pagination? get pagination;

  /// Create a copy of AddedPlantsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddedPlantsPageImplCopyWith<_$AddedPlantsPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
