// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workplace_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkplaceModel _$WorkplaceModelFromJson(Map<String, dynamic> json) {
  return _WorkplaceModel.fromJson(json);
}

/// @nodoc
mixin _$WorkplaceModel {
  int? get id => throw _privateConstructorUsedError;
  String? get organizationName => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  String? get departmentName => throw _privateConstructorUsedError;
  String? get workplaceName => throw _privateConstructorUsedError;
  String? get workplaceId => throw _privateConstructorUsedError;

  /// Serializes this WorkplaceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkplaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkplaceModelCopyWith<WorkplaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkplaceModelCopyWith<$Res> {
  factory $WorkplaceModelCopyWith(
          WorkplaceModel value, $Res Function(WorkplaceModel) then) =
      _$WorkplaceModelCopyWithImpl<$Res, WorkplaceModel>;
  @useResult
  $Res call(
      {int? id,
      String? organizationName,
      String? organizationId,
      String? departmentName,
      String? workplaceName,
      String? workplaceId});
}

/// @nodoc
class _$WorkplaceModelCopyWithImpl<$Res, $Val extends WorkplaceModel>
    implements $WorkplaceModelCopyWith<$Res> {
  _$WorkplaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkplaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? organizationName = freezed,
    Object? organizationId = freezed,
    Object? departmentName = freezed,
    Object? workplaceName = freezed,
    Object? workplaceId = freezed,
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
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaceName: freezed == workplaceName
          ? _value.workplaceName
          : workplaceName // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaceId: freezed == workplaceId
          ? _value.workplaceId
          : workplaceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkplaceModelImplCopyWith<$Res>
    implements $WorkplaceModelCopyWith<$Res> {
  factory _$$WorkplaceModelImplCopyWith(_$WorkplaceModelImpl value,
          $Res Function(_$WorkplaceModelImpl) then) =
      __$$WorkplaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? organizationName,
      String? organizationId,
      String? departmentName,
      String? workplaceName,
      String? workplaceId});
}

/// @nodoc
class __$$WorkplaceModelImplCopyWithImpl<$Res>
    extends _$WorkplaceModelCopyWithImpl<$Res, _$WorkplaceModelImpl>
    implements _$$WorkplaceModelImplCopyWith<$Res> {
  __$$WorkplaceModelImplCopyWithImpl(
      _$WorkplaceModelImpl _value, $Res Function(_$WorkplaceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkplaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? organizationName = freezed,
    Object? organizationId = freezed,
    Object? departmentName = freezed,
    Object? workplaceName = freezed,
    Object? workplaceId = freezed,
  }) {
    return _then(_$WorkplaceModelImpl(
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
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaceName: freezed == workplaceName
          ? _value.workplaceName
          : workplaceName // ignore: cast_nullable_to_non_nullable
              as String?,
      workplaceId: freezed == workplaceId
          ? _value.workplaceId
          : workplaceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkplaceModelImpl implements _WorkplaceModel {
  const _$WorkplaceModelImpl(
      {this.id,
      this.organizationName,
      this.organizationId,
      this.departmentName,
      this.workplaceName,
      this.workplaceId});

  factory _$WorkplaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkplaceModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? organizationName;
  @override
  final String? organizationId;
  @override
  final String? departmentName;
  @override
  final String? workplaceName;
  @override
  final String? workplaceId;

  @override
  String toString() {
    return 'WorkplaceModel(id: $id, organizationName: $organizationName, organizationId: $organizationId, departmentName: $departmentName, workplaceName: $workplaceName, workplaceId: $workplaceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkplaceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.workplaceName, workplaceName) ||
                other.workplaceName == workplaceName) &&
            (identical(other.workplaceId, workplaceId) ||
                other.workplaceId == workplaceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, organizationName,
      organizationId, departmentName, workplaceName, workplaceId);

  /// Create a copy of WorkplaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkplaceModelImplCopyWith<_$WorkplaceModelImpl> get copyWith =>
      __$$WorkplaceModelImplCopyWithImpl<_$WorkplaceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkplaceModelImplToJson(
      this,
    );
  }
}

abstract class _WorkplaceModel implements WorkplaceModel {
  const factory _WorkplaceModel(
      {final int? id,
      final String? organizationName,
      final String? organizationId,
      final String? departmentName,
      final String? workplaceName,
      final String? workplaceId}) = _$WorkplaceModelImpl;

  factory _WorkplaceModel.fromJson(Map<String, dynamic> json) =
      _$WorkplaceModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get organizationName;
  @override
  String? get organizationId;
  @override
  String? get departmentName;
  @override
  String? get workplaceName;
  @override
  String? get workplaceId;

  /// Create a copy of WorkplaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkplaceModelImplCopyWith<_$WorkplaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
