// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'microclimate_protocol_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MicroclimateProtocolModel _$MicroclimateProtocolModelFromJson(
    Map<String, dynamic> json) {
  return _MicroclimateProtocolModel.fromJson(json);
}

/// @nodoc
mixin _$MicroclimateProtocolModel {
  int? get id => throw _privateConstructorUsedError;
  String? get organizationName => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  String? get measurementDate => throw _privateConstructorUsedError;
  String? get workplace => throw _privateConstructorUsedError;
  String? get workplaceId => throw _privateConstructorUsedError;
  String? get parameterName => throw _privateConstructorUsedError;
  String? get airTemperature01m => throw _privateConstructorUsedError;
  String? get airTemperature15m => throw _privateConstructorUsedError;
  String? get tncIndex01m => throw _privateConstructorUsedError;
  String? get tncIndex15m => throw _privateConstructorUsedError;
  String? get airVelocity01m => throw _privateConstructorUsedError;
  String? get airVelocity15m => throw _privateConstructorUsedError;
  String? get relativeHumidity => throw _privateConstructorUsedError;

  /// Serializes this MicroclimateProtocolModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MicroclimateProtocolModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MicroclimateProtocolModelCopyWith<MicroclimateProtocolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MicroclimateProtocolModelCopyWith<$Res> {
  factory $MicroclimateProtocolModelCopyWith(MicroclimateProtocolModel value,
          $Res Function(MicroclimateProtocolModel) then) =
      _$MicroclimateProtocolModelCopyWithImpl<$Res, MicroclimateProtocolModel>;
  @useResult
  $Res call(
      {int? id,
      String? organizationName,
      String? organizationId,
      String? measurementDate,
      String? workplace,
      String? workplaceId,
      String? parameterName,
      String? airTemperature01m,
      String? airTemperature15m,
      String? tncIndex01m,
      String? tncIndex15m,
      String? airVelocity01m,
      String? airVelocity15m,
      String? relativeHumidity});
}

/// @nodoc
class _$MicroclimateProtocolModelCopyWithImpl<$Res,
        $Val extends MicroclimateProtocolModel>
    implements $MicroclimateProtocolModelCopyWith<$Res> {
  _$MicroclimateProtocolModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MicroclimateProtocolModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? organizationName = freezed,
    Object? organizationId = freezed,
    Object? measurementDate = freezed,
    Object? workplace = freezed,
    Object? workplaceId = freezed,
    Object? parameterName = freezed,
    Object? airTemperature01m = freezed,
    Object? airTemperature15m = freezed,
    Object? tncIndex01m = freezed,
    Object? tncIndex15m = freezed,
    Object? airVelocity01m = freezed,
    Object? airVelocity15m = freezed,
    Object? relativeHumidity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      measurementDate: freezed == measurementDate
          ? _value.measurementDate
          : measurementDate // ignore: cast_nullable_to_non_nullable
              as String?,
      workplace: freezed == workplace
          ? _value.workplace
          : workplace // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaceId: freezed == workplaceId
          ? _value.workplaceId
          : workplaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      parameterName: freezed == parameterName
          ? _value.parameterName
          : parameterName // ignore: cast_nullable_to_non_nullable
              as String?,
      airTemperature01m: freezed == airTemperature01m
          ? _value.airTemperature01m
          : airTemperature01m // ignore: cast_nullable_to_non_nullable
              as String?,
      airTemperature15m: freezed == airTemperature15m
          ? _value.airTemperature15m
          : airTemperature15m // ignore: cast_nullable_to_non_nullable
              as String?,
      tncIndex01m: freezed == tncIndex01m
          ? _value.tncIndex01m
          : tncIndex01m // ignore: cast_nullable_to_non_nullable
              as String?,
      tncIndex15m: freezed == tncIndex15m
          ? _value.tncIndex15m
          : tncIndex15m // ignore: cast_nullable_to_non_nullable
              as String?,
      airVelocity01m: freezed == airVelocity01m
          ? _value.airVelocity01m
          : airVelocity01m // ignore: cast_nullable_to_non_nullable
              as String?,
      airVelocity15m: freezed == airVelocity15m
          ? _value.airVelocity15m
          : airVelocity15m // ignore: cast_nullable_to_non_nullable
              as String?,
      relativeHumidity: freezed == relativeHumidity
          ? _value.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MicroclimateProtocolModelImplCopyWith<$Res>
    implements $MicroclimateProtocolModelCopyWith<$Res> {
  factory _$$MicroclimateProtocolModelImplCopyWith(
          _$MicroclimateProtocolModelImpl value,
          $Res Function(_$MicroclimateProtocolModelImpl) then) =
      __$$MicroclimateProtocolModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? organizationName,
      String? organizationId,
      String? measurementDate,
      String? workplace,
      String? workplaceId,
      String? parameterName,
      String? airTemperature01m,
      String? airTemperature15m,
      String? tncIndex01m,
      String? tncIndex15m,
      String? airVelocity01m,
      String? airVelocity15m,
      String? relativeHumidity});
}

/// @nodoc
class __$$MicroclimateProtocolModelImplCopyWithImpl<$Res>
    extends _$MicroclimateProtocolModelCopyWithImpl<$Res,
        _$MicroclimateProtocolModelImpl>
    implements _$$MicroclimateProtocolModelImplCopyWith<$Res> {
  __$$MicroclimateProtocolModelImplCopyWithImpl(
      _$MicroclimateProtocolModelImpl _value,
      $Res Function(_$MicroclimateProtocolModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MicroclimateProtocolModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? organizationName = freezed,
    Object? organizationId = freezed,
    Object? measurementDate = freezed,
    Object? workplace = freezed,
    Object? workplaceId = freezed,
    Object? parameterName = freezed,
    Object? airTemperature01m = freezed,
    Object? airTemperature15m = freezed,
    Object? tncIndex01m = freezed,
    Object? tncIndex15m = freezed,
    Object? airVelocity01m = freezed,
    Object? airVelocity15m = freezed,
    Object? relativeHumidity = freezed,
  }) {
    return _then(_$MicroclimateProtocolModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      measurementDate: freezed == measurementDate
          ? _value.measurementDate
          : measurementDate // ignore: cast_nullable_to_non_nullable
              as String?,
      workplace: freezed == workplace
          ? _value.workplace
          : workplace // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaceId: freezed == workplaceId
          ? _value.workplaceId
          : workplaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      parameterName: freezed == parameterName
          ? _value.parameterName
          : parameterName // ignore: cast_nullable_to_non_nullable
              as String?,
      airTemperature01m: freezed == airTemperature01m
          ? _value.airTemperature01m
          : airTemperature01m // ignore: cast_nullable_to_non_nullable
              as String?,
      airTemperature15m: freezed == airTemperature15m
          ? _value.airTemperature15m
          : airTemperature15m // ignore: cast_nullable_to_non_nullable
              as String?,
      tncIndex01m: freezed == tncIndex01m
          ? _value.tncIndex01m
          : tncIndex01m // ignore: cast_nullable_to_non_nullable
              as String?,
      tncIndex15m: freezed == tncIndex15m
          ? _value.tncIndex15m
          : tncIndex15m // ignore: cast_nullable_to_non_nullable
              as String?,
      airVelocity01m: freezed == airVelocity01m
          ? _value.airVelocity01m
          : airVelocity01m // ignore: cast_nullable_to_non_nullable
              as String?,
      airVelocity15m: freezed == airVelocity15m
          ? _value.airVelocity15m
          : airVelocity15m // ignore: cast_nullable_to_non_nullable
              as String?,
      relativeHumidity: freezed == relativeHumidity
          ? _value.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MicroclimateProtocolModelImpl implements _MicroclimateProtocolModel {
  const _$MicroclimateProtocolModelImpl(
      {this.id,
      this.organizationName,
      this.organizationId,
      this.measurementDate,
      this.workplace,
      this.workplaceId,
      this.parameterName,
      this.airTemperature01m,
      this.airTemperature15m,
      this.tncIndex01m,
      this.tncIndex15m,
      this.airVelocity01m,
      this.airVelocity15m,
      this.relativeHumidity});

  factory _$MicroclimateProtocolModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MicroclimateProtocolModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? organizationName;
  @override
  final String? organizationId;
  @override
  final String? measurementDate;
  @override
  final String? workplace;
  @override
  final String? workplaceId;
  @override
  final String? parameterName;
  @override
  final String? airTemperature01m;
  @override
  final String? airTemperature15m;
  @override
  final String? tncIndex01m;
  @override
  final String? tncIndex15m;
  @override
  final String? airVelocity01m;
  @override
  final String? airVelocity15m;
  @override
  final String? relativeHumidity;

  @override
  String toString() {
    return 'MicroclimateProtocolModel(id: $id, organizationName: $organizationName, organizationId: $organizationId, measurementDate: $measurementDate, workplace: $workplace, workplaceId: $workplaceId, parameterName: $parameterName, airTemperature01m: $airTemperature01m, airTemperature15m: $airTemperature15m, tncIndex01m: $tncIndex01m, tncIndex15m: $tncIndex15m, airVelocity01m: $airVelocity01m, airVelocity15m: $airVelocity15m, relativeHumidity: $relativeHumidity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MicroclimateProtocolModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.measurementDate, measurementDate) ||
                other.measurementDate == measurementDate) &&
            (identical(other.workplace, workplace) ||
                other.workplace == workplace) &&
            (identical(other.workplaceId, workplaceId) ||
                other.workplaceId == workplaceId) &&
            (identical(other.parameterName, parameterName) ||
                other.parameterName == parameterName) &&
            (identical(other.airTemperature01m, airTemperature01m) ||
                other.airTemperature01m == airTemperature01m) &&
            (identical(other.airTemperature15m, airTemperature15m) ||
                other.airTemperature15m == airTemperature15m) &&
            (identical(other.tncIndex01m, tncIndex01m) ||
                other.tncIndex01m == tncIndex01m) &&
            (identical(other.tncIndex15m, tncIndex15m) ||
                other.tncIndex15m == tncIndex15m) &&
            (identical(other.airVelocity01m, airVelocity01m) ||
                other.airVelocity01m == airVelocity01m) &&
            (identical(other.airVelocity15m, airVelocity15m) ||
                other.airVelocity15m == airVelocity15m) &&
            (identical(other.relativeHumidity, relativeHumidity) ||
                other.relativeHumidity == relativeHumidity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      organizationName,
      organizationId,
      measurementDate,
      workplace,
      workplaceId,
      parameterName,
      airTemperature01m,
      airTemperature15m,
      tncIndex01m,
      tncIndex15m,
      airVelocity01m,
      airVelocity15m,
      relativeHumidity);

  /// Create a copy of MicroclimateProtocolModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MicroclimateProtocolModelImplCopyWith<_$MicroclimateProtocolModelImpl>
      get copyWith => __$$MicroclimateProtocolModelImplCopyWithImpl<
          _$MicroclimateProtocolModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MicroclimateProtocolModelImplToJson(
      this,
    );
  }
}

abstract class _MicroclimateProtocolModel implements MicroclimateProtocolModel {
  const factory _MicroclimateProtocolModel(
      {final int? id,
      final String? organizationName,
      final String? organizationId,
      final String? measurementDate,
      final String? workplace,
      final String? workplaceId,
      final String? parameterName,
      final String? airTemperature01m,
      final String? airTemperature15m,
      final String? tncIndex01m,
      final String? tncIndex15m,
      final String? airVelocity01m,
      final String? airVelocity15m,
      final String? relativeHumidity}) = _$MicroclimateProtocolModelImpl;

  factory _MicroclimateProtocolModel.fromJson(Map<String, dynamic> json) =
      _$MicroclimateProtocolModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get organizationName;
  @override
  String? get organizationId;
  @override
  String? get measurementDate;
  @override
  String? get workplace;
  @override
  String? get workplaceId;
  @override
  String? get parameterName;
  @override
  String? get airTemperature01m;
  @override
  String? get airTemperature15m;
  @override
  String? get tncIndex01m;
  @override
  String? get tncIndex15m;
  @override
  String? get airVelocity01m;
  @override
  String? get airVelocity15m;
  @override
  String? get relativeHumidity;

  /// Create a copy of MicroclimateProtocolModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MicroclimateProtocolModelImplCopyWith<_$MicroclimateProtocolModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
