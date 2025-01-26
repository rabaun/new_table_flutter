// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'severity_work_process_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeverityWorkProcessModel _$SeverityWorkProcessModelFromJson(
    Map<String, dynamic> json) {
  return _SeverityWorkProcessModel.fromJson(json);
}

/// @nodoc
mixin _$SeverityWorkProcessModel {
  int? get id => throw _privateConstructorUsedError;
  String? get organizationName => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  String? get measurementDate => throw _privateConstructorUsedError;
  String? get workplace => throw _privateConstructorUsedError;
  String? get workplaceId => throw _privateConstructorUsedError;
  String? get parameterName =>
      throw _privateConstructorUsedError; // Перемещение груза на расстояние до 1 м
  String? get massUpTo1mKg => throw _privateConstructorUsedError;
  String? get distanceUpTo1mM => throw _privateConstructorUsedError;
  String? get movementCountUpTo1m =>
      throw _privateConstructorUsedError; // Перемещение груза на расстояние от 1 до 5 м
  String? get mass1To5mKg => throw _privateConstructorUsedError;
  String? get distance1To5mM => throw _privateConstructorUsedError;
  String? get movementCount1To5m =>
      throw _privateConstructorUsedError; // Перемещение груза на расстояние более 5 м
  String? get massMoreThan5mKg => throw _privateConstructorUsedError;
  String? get distanceMoreThan5mM => throw _privateConstructorUsedError;
  String? get movementCountMoreThan5m =>
      throw _privateConstructorUsedError; // Подъем и перемещение (разовое) тяжести при чередовании с другой работой
  String? get liftingIntermittentMassKg => throw _privateConstructorUsedError;
  String? get liftingIntermittentMovementCount =>
      throw _privateConstructorUsedError; // Подъем и перемещение тяжести постоянно в течение рабочего дня
  String? get liftingConstantMassKg => throw _privateConstructorUsedError;
  String? get liftingConstantMovementCount =>
      throw _privateConstructorUsedError; // Подъем с рабочей поверхности
  String? get liftingFromSurfaceMassKg => throw _privateConstructorUsedError;
  String? get liftingFromSurfaceMovementCount =>
      throw _privateConstructorUsedError; // Подъем с пола
  String? get liftingFromFloorMassKg => throw _privateConstructorUsedError;
  String? get liftingFromFloorMovementCount =>
      throw _privateConstructorUsedError; // Стереотипные рабочие движения при локальной нагрузке
  String? get stereotypicalLocalMovementPerOperation =>
      throw _privateConstructorUsedError;
  String? get stereotypicalLocalOperationCount =>
      throw _privateConstructorUsedError; // Стереотипные рабочие движения при региональной нагрузке
  String? get stereotypicalRegionalMovementPerOperation =>
      throw _privateConstructorUsedError;
  String? get stereotypicalRegionalOperationCount =>
      throw _privateConstructorUsedError; // Статическая нагрузка (одной рукой)
  String? get staticLoadOneHandMassKg => throw _privateConstructorUsedError;
  String? get staticLoadOneHandHoldingTimeS =>
      throw _privateConstructorUsedError;
  String? get staticLoadOneHandOperationCount =>
      throw _privateConstructorUsedError; // Статическая нагрузка (двумя руками)
  String? get staticLoadTwoHandsMassKg => throw _privateConstructorUsedError;
  String? get staticLoadTwoHandsHoldingTimeS =>
      throw _privateConstructorUsedError;
  String? get staticLoadTwoHandsOperationCount =>
      throw _privateConstructorUsedError; // Статическая нагрузка (с участием мышц корпуса и ног)
  String? get staticLoadBodyAndLegsMassKg => throw _privateConstructorUsedError;
  String? get staticLoadBodyAndLegsHoldingTimeS =>
      throw _privateConstructorUsedError;
  String? get staticLoadBodyAndLegsOperationCount =>
      throw _privateConstructorUsedError; // Рабочая поза
  String? get freePosturePercentage => throw _privateConstructorUsedError;
  String? get standingPosturePercentage => throw _privateConstructorUsedError;
  String? get uncomfortablePosturePercentage =>
      throw _privateConstructorUsedError;
  String? get fixedPosturePercentage => throw _privateConstructorUsedError;
  String? get forcedPosturePercentage => throw _privateConstructorUsedError;
  String? get sittingPosturePercentage =>
      throw _privateConstructorUsedError; // Наклоны корпуса
  String? get tiltsPerOperation => throw _privateConstructorUsedError;
  String? get tiltsOperationCount =>
      throw _privateConstructorUsedError; // Перемещение в пространстве (по горизонтали)
  String? get horizontalMovementDistanceKm =>
      throw _privateConstructorUsedError;
  String? get horizontalMovementDistancePerMoveM =>
      throw _privateConstructorUsedError;
  String? get horizontalMovementCount =>
      throw _privateConstructorUsedError; // Перемещение в пространстве (по вертикали)
  String? get verticalMovementDistanceKm => throw _privateConstructorUsedError;
  String? get verticalMovementDistancePerMoveM =>
      throw _privateConstructorUsedError;
  String? get verticalMovementCount => throw _privateConstructorUsedError;

  /// Serializes this SeverityWorkProcessModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeverityWorkProcessModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeverityWorkProcessModelCopyWith<SeverityWorkProcessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeverityWorkProcessModelCopyWith<$Res> {
  factory $SeverityWorkProcessModelCopyWith(SeverityWorkProcessModel value,
          $Res Function(SeverityWorkProcessModel) then) =
      _$SeverityWorkProcessModelCopyWithImpl<$Res, SeverityWorkProcessModel>;
  @useResult
  $Res call(
      {int? id,
      String? organizationName,
      String? organizationId,
      String? measurementDate,
      String? workplace,
      String? workplaceId,
      String? parameterName,
      String? massUpTo1mKg,
      String? distanceUpTo1mM,
      String? movementCountUpTo1m,
      String? mass1To5mKg,
      String? distance1To5mM,
      String? movementCount1To5m,
      String? massMoreThan5mKg,
      String? distanceMoreThan5mM,
      String? movementCountMoreThan5m,
      String? liftingIntermittentMassKg,
      String? liftingIntermittentMovementCount,
      String? liftingConstantMassKg,
      String? liftingConstantMovementCount,
      String? liftingFromSurfaceMassKg,
      String? liftingFromSurfaceMovementCount,
      String? liftingFromFloorMassKg,
      String? liftingFromFloorMovementCount,
      String? stereotypicalLocalMovementPerOperation,
      String? stereotypicalLocalOperationCount,
      String? stereotypicalRegionalMovementPerOperation,
      String? stereotypicalRegionalOperationCount,
      String? staticLoadOneHandMassKg,
      String? staticLoadOneHandHoldingTimeS,
      String? staticLoadOneHandOperationCount,
      String? staticLoadTwoHandsMassKg,
      String? staticLoadTwoHandsHoldingTimeS,
      String? staticLoadTwoHandsOperationCount,
      String? staticLoadBodyAndLegsMassKg,
      String? staticLoadBodyAndLegsHoldingTimeS,
      String? staticLoadBodyAndLegsOperationCount,
      String? freePosturePercentage,
      String? standingPosturePercentage,
      String? uncomfortablePosturePercentage,
      String? fixedPosturePercentage,
      String? forcedPosturePercentage,
      String? sittingPosturePercentage,
      String? tiltsPerOperation,
      String? tiltsOperationCount,
      String? horizontalMovementDistanceKm,
      String? horizontalMovementDistancePerMoveM,
      String? horizontalMovementCount,
      String? verticalMovementDistanceKm,
      String? verticalMovementDistancePerMoveM,
      String? verticalMovementCount});
}

/// @nodoc
class _$SeverityWorkProcessModelCopyWithImpl<$Res,
        $Val extends SeverityWorkProcessModel>
    implements $SeverityWorkProcessModelCopyWith<$Res> {
  _$SeverityWorkProcessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeverityWorkProcessModel
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
    Object? massUpTo1mKg = freezed,
    Object? distanceUpTo1mM = freezed,
    Object? movementCountUpTo1m = freezed,
    Object? mass1To5mKg = freezed,
    Object? distance1To5mM = freezed,
    Object? movementCount1To5m = freezed,
    Object? massMoreThan5mKg = freezed,
    Object? distanceMoreThan5mM = freezed,
    Object? movementCountMoreThan5m = freezed,
    Object? liftingIntermittentMassKg = freezed,
    Object? liftingIntermittentMovementCount = freezed,
    Object? liftingConstantMassKg = freezed,
    Object? liftingConstantMovementCount = freezed,
    Object? liftingFromSurfaceMassKg = freezed,
    Object? liftingFromSurfaceMovementCount = freezed,
    Object? liftingFromFloorMassKg = freezed,
    Object? liftingFromFloorMovementCount = freezed,
    Object? stereotypicalLocalMovementPerOperation = freezed,
    Object? stereotypicalLocalOperationCount = freezed,
    Object? stereotypicalRegionalMovementPerOperation = freezed,
    Object? stereotypicalRegionalOperationCount = freezed,
    Object? staticLoadOneHandMassKg = freezed,
    Object? staticLoadOneHandHoldingTimeS = freezed,
    Object? staticLoadOneHandOperationCount = freezed,
    Object? staticLoadTwoHandsMassKg = freezed,
    Object? staticLoadTwoHandsHoldingTimeS = freezed,
    Object? staticLoadTwoHandsOperationCount = freezed,
    Object? staticLoadBodyAndLegsMassKg = freezed,
    Object? staticLoadBodyAndLegsHoldingTimeS = freezed,
    Object? staticLoadBodyAndLegsOperationCount = freezed,
    Object? freePosturePercentage = freezed,
    Object? standingPosturePercentage = freezed,
    Object? uncomfortablePosturePercentage = freezed,
    Object? fixedPosturePercentage = freezed,
    Object? forcedPosturePercentage = freezed,
    Object? sittingPosturePercentage = freezed,
    Object? tiltsPerOperation = freezed,
    Object? tiltsOperationCount = freezed,
    Object? horizontalMovementDistanceKm = freezed,
    Object? horizontalMovementDistancePerMoveM = freezed,
    Object? horizontalMovementCount = freezed,
    Object? verticalMovementDistanceKm = freezed,
    Object? verticalMovementDistancePerMoveM = freezed,
    Object? verticalMovementCount = freezed,
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
      massUpTo1mKg: freezed == massUpTo1mKg
          ? _value.massUpTo1mKg
          : massUpTo1mKg // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceUpTo1mM: freezed == distanceUpTo1mM
          ? _value.distanceUpTo1mM
          : distanceUpTo1mM // ignore: cast_nullable_to_non_nullable
              as String?,
      movementCountUpTo1m: freezed == movementCountUpTo1m
          ? _value.movementCountUpTo1m
          : movementCountUpTo1m // ignore: cast_nullable_to_non_nullable
              as String?,
      mass1To5mKg: freezed == mass1To5mKg
          ? _value.mass1To5mKg
          : mass1To5mKg // ignore: cast_nullable_to_non_nullable
              as String?,
      distance1To5mM: freezed == distance1To5mM
          ? _value.distance1To5mM
          : distance1To5mM // ignore: cast_nullable_to_non_nullable
              as String?,
      movementCount1To5m: freezed == movementCount1To5m
          ? _value.movementCount1To5m
          : movementCount1To5m // ignore: cast_nullable_to_non_nullable
              as String?,
      massMoreThan5mKg: freezed == massMoreThan5mKg
          ? _value.massMoreThan5mKg
          : massMoreThan5mKg // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceMoreThan5mM: freezed == distanceMoreThan5mM
          ? _value.distanceMoreThan5mM
          : distanceMoreThan5mM // ignore: cast_nullable_to_non_nullable
              as String?,
      movementCountMoreThan5m: freezed == movementCountMoreThan5m
          ? _value.movementCountMoreThan5m
          : movementCountMoreThan5m // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingIntermittentMassKg: freezed == liftingIntermittentMassKg
          ? _value.liftingIntermittentMassKg
          : liftingIntermittentMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingIntermittentMovementCount: freezed ==
              liftingIntermittentMovementCount
          ? _value.liftingIntermittentMovementCount
          : liftingIntermittentMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingConstantMassKg: freezed == liftingConstantMassKg
          ? _value.liftingConstantMassKg
          : liftingConstantMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingConstantMovementCount: freezed == liftingConstantMovementCount
          ? _value.liftingConstantMovementCount
          : liftingConstantMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingFromSurfaceMassKg: freezed == liftingFromSurfaceMassKg
          ? _value.liftingFromSurfaceMassKg
          : liftingFromSurfaceMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingFromSurfaceMovementCount: freezed ==
              liftingFromSurfaceMovementCount
          ? _value.liftingFromSurfaceMovementCount
          : liftingFromSurfaceMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingFromFloorMassKg: freezed == liftingFromFloorMassKg
          ? _value.liftingFromFloorMassKg
          : liftingFromFloorMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingFromFloorMovementCount: freezed == liftingFromFloorMovementCount
          ? _value.liftingFromFloorMovementCount
          : liftingFromFloorMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      stereotypicalLocalMovementPerOperation: freezed ==
              stereotypicalLocalMovementPerOperation
          ? _value.stereotypicalLocalMovementPerOperation
          : stereotypicalLocalMovementPerOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      stereotypicalLocalOperationCount: freezed ==
              stereotypicalLocalOperationCount
          ? _value.stereotypicalLocalOperationCount
          : stereotypicalLocalOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      stereotypicalRegionalMovementPerOperation: freezed ==
              stereotypicalRegionalMovementPerOperation
          ? _value.stereotypicalRegionalMovementPerOperation
          : stereotypicalRegionalMovementPerOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      stereotypicalRegionalOperationCount: freezed ==
              stereotypicalRegionalOperationCount
          ? _value.stereotypicalRegionalOperationCount
          : stereotypicalRegionalOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadOneHandMassKg: freezed == staticLoadOneHandMassKg
          ? _value.staticLoadOneHandMassKg
          : staticLoadOneHandMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadOneHandHoldingTimeS: freezed == staticLoadOneHandHoldingTimeS
          ? _value.staticLoadOneHandHoldingTimeS
          : staticLoadOneHandHoldingTimeS // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadOneHandOperationCount: freezed ==
              staticLoadOneHandOperationCount
          ? _value.staticLoadOneHandOperationCount
          : staticLoadOneHandOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadTwoHandsMassKg: freezed == staticLoadTwoHandsMassKg
          ? _value.staticLoadTwoHandsMassKg
          : staticLoadTwoHandsMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadTwoHandsHoldingTimeS: freezed == staticLoadTwoHandsHoldingTimeS
          ? _value.staticLoadTwoHandsHoldingTimeS
          : staticLoadTwoHandsHoldingTimeS // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadTwoHandsOperationCount: freezed ==
              staticLoadTwoHandsOperationCount
          ? _value.staticLoadTwoHandsOperationCount
          : staticLoadTwoHandsOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadBodyAndLegsMassKg: freezed == staticLoadBodyAndLegsMassKg
          ? _value.staticLoadBodyAndLegsMassKg
          : staticLoadBodyAndLegsMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadBodyAndLegsHoldingTimeS: freezed ==
              staticLoadBodyAndLegsHoldingTimeS
          ? _value.staticLoadBodyAndLegsHoldingTimeS
          : staticLoadBodyAndLegsHoldingTimeS // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadBodyAndLegsOperationCount: freezed ==
              staticLoadBodyAndLegsOperationCount
          ? _value.staticLoadBodyAndLegsOperationCount
          : staticLoadBodyAndLegsOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      freePosturePercentage: freezed == freePosturePercentage
          ? _value.freePosturePercentage
          : freePosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      standingPosturePercentage: freezed == standingPosturePercentage
          ? _value.standingPosturePercentage
          : standingPosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      uncomfortablePosturePercentage: freezed == uncomfortablePosturePercentage
          ? _value.uncomfortablePosturePercentage
          : uncomfortablePosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      fixedPosturePercentage: freezed == fixedPosturePercentage
          ? _value.fixedPosturePercentage
          : fixedPosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      forcedPosturePercentage: freezed == forcedPosturePercentage
          ? _value.forcedPosturePercentage
          : forcedPosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      sittingPosturePercentage: freezed == sittingPosturePercentage
          ? _value.sittingPosturePercentage
          : sittingPosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      tiltsPerOperation: freezed == tiltsPerOperation
          ? _value.tiltsPerOperation
          : tiltsPerOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      tiltsOperationCount: freezed == tiltsOperationCount
          ? _value.tiltsOperationCount
          : tiltsOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      horizontalMovementDistanceKm: freezed == horizontalMovementDistanceKm
          ? _value.horizontalMovementDistanceKm
          : horizontalMovementDistanceKm // ignore: cast_nullable_to_non_nullable
              as String?,
      horizontalMovementDistancePerMoveM: freezed ==
              horizontalMovementDistancePerMoveM
          ? _value.horizontalMovementDistancePerMoveM
          : horizontalMovementDistancePerMoveM // ignore: cast_nullable_to_non_nullable
              as String?,
      horizontalMovementCount: freezed == horizontalMovementCount
          ? _value.horizontalMovementCount
          : horizontalMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      verticalMovementDistanceKm: freezed == verticalMovementDistanceKm
          ? _value.verticalMovementDistanceKm
          : verticalMovementDistanceKm // ignore: cast_nullable_to_non_nullable
              as String?,
      verticalMovementDistancePerMoveM: freezed ==
              verticalMovementDistancePerMoveM
          ? _value.verticalMovementDistancePerMoveM
          : verticalMovementDistancePerMoveM // ignore: cast_nullable_to_non_nullable
              as String?,
      verticalMovementCount: freezed == verticalMovementCount
          ? _value.verticalMovementCount
          : verticalMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeverityWorkProcessModelImplCopyWith<$Res>
    implements $SeverityWorkProcessModelCopyWith<$Res> {
  factory _$$SeverityWorkProcessModelImplCopyWith(
          _$SeverityWorkProcessModelImpl value,
          $Res Function(_$SeverityWorkProcessModelImpl) then) =
      __$$SeverityWorkProcessModelImplCopyWithImpl<$Res>;
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
      String? massUpTo1mKg,
      String? distanceUpTo1mM,
      String? movementCountUpTo1m,
      String? mass1To5mKg,
      String? distance1To5mM,
      String? movementCount1To5m,
      String? massMoreThan5mKg,
      String? distanceMoreThan5mM,
      String? movementCountMoreThan5m,
      String? liftingIntermittentMassKg,
      String? liftingIntermittentMovementCount,
      String? liftingConstantMassKg,
      String? liftingConstantMovementCount,
      String? liftingFromSurfaceMassKg,
      String? liftingFromSurfaceMovementCount,
      String? liftingFromFloorMassKg,
      String? liftingFromFloorMovementCount,
      String? stereotypicalLocalMovementPerOperation,
      String? stereotypicalLocalOperationCount,
      String? stereotypicalRegionalMovementPerOperation,
      String? stereotypicalRegionalOperationCount,
      String? staticLoadOneHandMassKg,
      String? staticLoadOneHandHoldingTimeS,
      String? staticLoadOneHandOperationCount,
      String? staticLoadTwoHandsMassKg,
      String? staticLoadTwoHandsHoldingTimeS,
      String? staticLoadTwoHandsOperationCount,
      String? staticLoadBodyAndLegsMassKg,
      String? staticLoadBodyAndLegsHoldingTimeS,
      String? staticLoadBodyAndLegsOperationCount,
      String? freePosturePercentage,
      String? standingPosturePercentage,
      String? uncomfortablePosturePercentage,
      String? fixedPosturePercentage,
      String? forcedPosturePercentage,
      String? sittingPosturePercentage,
      String? tiltsPerOperation,
      String? tiltsOperationCount,
      String? horizontalMovementDistanceKm,
      String? horizontalMovementDistancePerMoveM,
      String? horizontalMovementCount,
      String? verticalMovementDistanceKm,
      String? verticalMovementDistancePerMoveM,
      String? verticalMovementCount});
}

/// @nodoc
class __$$SeverityWorkProcessModelImplCopyWithImpl<$Res>
    extends _$SeverityWorkProcessModelCopyWithImpl<$Res,
        _$SeverityWorkProcessModelImpl>
    implements _$$SeverityWorkProcessModelImplCopyWith<$Res> {
  __$$SeverityWorkProcessModelImplCopyWithImpl(
      _$SeverityWorkProcessModelImpl _value,
      $Res Function(_$SeverityWorkProcessModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeverityWorkProcessModel
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
    Object? massUpTo1mKg = freezed,
    Object? distanceUpTo1mM = freezed,
    Object? movementCountUpTo1m = freezed,
    Object? mass1To5mKg = freezed,
    Object? distance1To5mM = freezed,
    Object? movementCount1To5m = freezed,
    Object? massMoreThan5mKg = freezed,
    Object? distanceMoreThan5mM = freezed,
    Object? movementCountMoreThan5m = freezed,
    Object? liftingIntermittentMassKg = freezed,
    Object? liftingIntermittentMovementCount = freezed,
    Object? liftingConstantMassKg = freezed,
    Object? liftingConstantMovementCount = freezed,
    Object? liftingFromSurfaceMassKg = freezed,
    Object? liftingFromSurfaceMovementCount = freezed,
    Object? liftingFromFloorMassKg = freezed,
    Object? liftingFromFloorMovementCount = freezed,
    Object? stereotypicalLocalMovementPerOperation = freezed,
    Object? stereotypicalLocalOperationCount = freezed,
    Object? stereotypicalRegionalMovementPerOperation = freezed,
    Object? stereotypicalRegionalOperationCount = freezed,
    Object? staticLoadOneHandMassKg = freezed,
    Object? staticLoadOneHandHoldingTimeS = freezed,
    Object? staticLoadOneHandOperationCount = freezed,
    Object? staticLoadTwoHandsMassKg = freezed,
    Object? staticLoadTwoHandsHoldingTimeS = freezed,
    Object? staticLoadTwoHandsOperationCount = freezed,
    Object? staticLoadBodyAndLegsMassKg = freezed,
    Object? staticLoadBodyAndLegsHoldingTimeS = freezed,
    Object? staticLoadBodyAndLegsOperationCount = freezed,
    Object? freePosturePercentage = freezed,
    Object? standingPosturePercentage = freezed,
    Object? uncomfortablePosturePercentage = freezed,
    Object? fixedPosturePercentage = freezed,
    Object? forcedPosturePercentage = freezed,
    Object? sittingPosturePercentage = freezed,
    Object? tiltsPerOperation = freezed,
    Object? tiltsOperationCount = freezed,
    Object? horizontalMovementDistanceKm = freezed,
    Object? horizontalMovementDistancePerMoveM = freezed,
    Object? horizontalMovementCount = freezed,
    Object? verticalMovementDistanceKm = freezed,
    Object? verticalMovementDistancePerMoveM = freezed,
    Object? verticalMovementCount = freezed,
  }) {
    return _then(_$SeverityWorkProcessModelImpl(
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
      massUpTo1mKg: freezed == massUpTo1mKg
          ? _value.massUpTo1mKg
          : massUpTo1mKg // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceUpTo1mM: freezed == distanceUpTo1mM
          ? _value.distanceUpTo1mM
          : distanceUpTo1mM // ignore: cast_nullable_to_non_nullable
              as String?,
      movementCountUpTo1m: freezed == movementCountUpTo1m
          ? _value.movementCountUpTo1m
          : movementCountUpTo1m // ignore: cast_nullable_to_non_nullable
              as String?,
      mass1To5mKg: freezed == mass1To5mKg
          ? _value.mass1To5mKg
          : mass1To5mKg // ignore: cast_nullable_to_non_nullable
              as String?,
      distance1To5mM: freezed == distance1To5mM
          ? _value.distance1To5mM
          : distance1To5mM // ignore: cast_nullable_to_non_nullable
              as String?,
      movementCount1To5m: freezed == movementCount1To5m
          ? _value.movementCount1To5m
          : movementCount1To5m // ignore: cast_nullable_to_non_nullable
              as String?,
      massMoreThan5mKg: freezed == massMoreThan5mKg
          ? _value.massMoreThan5mKg
          : massMoreThan5mKg // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceMoreThan5mM: freezed == distanceMoreThan5mM
          ? _value.distanceMoreThan5mM
          : distanceMoreThan5mM // ignore: cast_nullable_to_non_nullable
              as String?,
      movementCountMoreThan5m: freezed == movementCountMoreThan5m
          ? _value.movementCountMoreThan5m
          : movementCountMoreThan5m // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingIntermittentMassKg: freezed == liftingIntermittentMassKg
          ? _value.liftingIntermittentMassKg
          : liftingIntermittentMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingIntermittentMovementCount: freezed ==
              liftingIntermittentMovementCount
          ? _value.liftingIntermittentMovementCount
          : liftingIntermittentMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingConstantMassKg: freezed == liftingConstantMassKg
          ? _value.liftingConstantMassKg
          : liftingConstantMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingConstantMovementCount: freezed == liftingConstantMovementCount
          ? _value.liftingConstantMovementCount
          : liftingConstantMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingFromSurfaceMassKg: freezed == liftingFromSurfaceMassKg
          ? _value.liftingFromSurfaceMassKg
          : liftingFromSurfaceMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingFromSurfaceMovementCount: freezed ==
              liftingFromSurfaceMovementCount
          ? _value.liftingFromSurfaceMovementCount
          : liftingFromSurfaceMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingFromFloorMassKg: freezed == liftingFromFloorMassKg
          ? _value.liftingFromFloorMassKg
          : liftingFromFloorMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      liftingFromFloorMovementCount: freezed == liftingFromFloorMovementCount
          ? _value.liftingFromFloorMovementCount
          : liftingFromFloorMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      stereotypicalLocalMovementPerOperation: freezed ==
              stereotypicalLocalMovementPerOperation
          ? _value.stereotypicalLocalMovementPerOperation
          : stereotypicalLocalMovementPerOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      stereotypicalLocalOperationCount: freezed ==
              stereotypicalLocalOperationCount
          ? _value.stereotypicalLocalOperationCount
          : stereotypicalLocalOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      stereotypicalRegionalMovementPerOperation: freezed ==
              stereotypicalRegionalMovementPerOperation
          ? _value.stereotypicalRegionalMovementPerOperation
          : stereotypicalRegionalMovementPerOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      stereotypicalRegionalOperationCount: freezed ==
              stereotypicalRegionalOperationCount
          ? _value.stereotypicalRegionalOperationCount
          : stereotypicalRegionalOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadOneHandMassKg: freezed == staticLoadOneHandMassKg
          ? _value.staticLoadOneHandMassKg
          : staticLoadOneHandMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadOneHandHoldingTimeS: freezed == staticLoadOneHandHoldingTimeS
          ? _value.staticLoadOneHandHoldingTimeS
          : staticLoadOneHandHoldingTimeS // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadOneHandOperationCount: freezed ==
              staticLoadOneHandOperationCount
          ? _value.staticLoadOneHandOperationCount
          : staticLoadOneHandOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadTwoHandsMassKg: freezed == staticLoadTwoHandsMassKg
          ? _value.staticLoadTwoHandsMassKg
          : staticLoadTwoHandsMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadTwoHandsHoldingTimeS: freezed == staticLoadTwoHandsHoldingTimeS
          ? _value.staticLoadTwoHandsHoldingTimeS
          : staticLoadTwoHandsHoldingTimeS // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadTwoHandsOperationCount: freezed ==
              staticLoadTwoHandsOperationCount
          ? _value.staticLoadTwoHandsOperationCount
          : staticLoadTwoHandsOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadBodyAndLegsMassKg: freezed == staticLoadBodyAndLegsMassKg
          ? _value.staticLoadBodyAndLegsMassKg
          : staticLoadBodyAndLegsMassKg // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadBodyAndLegsHoldingTimeS: freezed ==
              staticLoadBodyAndLegsHoldingTimeS
          ? _value.staticLoadBodyAndLegsHoldingTimeS
          : staticLoadBodyAndLegsHoldingTimeS // ignore: cast_nullable_to_non_nullable
              as String?,
      staticLoadBodyAndLegsOperationCount: freezed ==
              staticLoadBodyAndLegsOperationCount
          ? _value.staticLoadBodyAndLegsOperationCount
          : staticLoadBodyAndLegsOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      freePosturePercentage: freezed == freePosturePercentage
          ? _value.freePosturePercentage
          : freePosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      standingPosturePercentage: freezed == standingPosturePercentage
          ? _value.standingPosturePercentage
          : standingPosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      uncomfortablePosturePercentage: freezed == uncomfortablePosturePercentage
          ? _value.uncomfortablePosturePercentage
          : uncomfortablePosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      fixedPosturePercentage: freezed == fixedPosturePercentage
          ? _value.fixedPosturePercentage
          : fixedPosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      forcedPosturePercentage: freezed == forcedPosturePercentage
          ? _value.forcedPosturePercentage
          : forcedPosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      sittingPosturePercentage: freezed == sittingPosturePercentage
          ? _value.sittingPosturePercentage
          : sittingPosturePercentage // ignore: cast_nullable_to_non_nullable
              as String?,
      tiltsPerOperation: freezed == tiltsPerOperation
          ? _value.tiltsPerOperation
          : tiltsPerOperation // ignore: cast_nullable_to_non_nullable
              as String?,
      tiltsOperationCount: freezed == tiltsOperationCount
          ? _value.tiltsOperationCount
          : tiltsOperationCount // ignore: cast_nullable_to_non_nullable
              as String?,
      horizontalMovementDistanceKm: freezed == horizontalMovementDistanceKm
          ? _value.horizontalMovementDistanceKm
          : horizontalMovementDistanceKm // ignore: cast_nullable_to_non_nullable
              as String?,
      horizontalMovementDistancePerMoveM: freezed ==
              horizontalMovementDistancePerMoveM
          ? _value.horizontalMovementDistancePerMoveM
          : horizontalMovementDistancePerMoveM // ignore: cast_nullable_to_non_nullable
              as String?,
      horizontalMovementCount: freezed == horizontalMovementCount
          ? _value.horizontalMovementCount
          : horizontalMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
      verticalMovementDistanceKm: freezed == verticalMovementDistanceKm
          ? _value.verticalMovementDistanceKm
          : verticalMovementDistanceKm // ignore: cast_nullable_to_non_nullable
              as String?,
      verticalMovementDistancePerMoveM: freezed ==
              verticalMovementDistancePerMoveM
          ? _value.verticalMovementDistancePerMoveM
          : verticalMovementDistancePerMoveM // ignore: cast_nullable_to_non_nullable
              as String?,
      verticalMovementCount: freezed == verticalMovementCount
          ? _value.verticalMovementCount
          : verticalMovementCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeverityWorkProcessModelImpl implements _SeverityWorkProcessModel {
  const _$SeverityWorkProcessModelImpl(
      {this.id,
      this.organizationName,
      this.organizationId,
      this.measurementDate,
      this.workplace,
      this.workplaceId,
      this.parameterName,
      this.massUpTo1mKg,
      this.distanceUpTo1mM,
      this.movementCountUpTo1m,
      this.mass1To5mKg,
      this.distance1To5mM,
      this.movementCount1To5m,
      this.massMoreThan5mKg,
      this.distanceMoreThan5mM,
      this.movementCountMoreThan5m,
      this.liftingIntermittentMassKg,
      this.liftingIntermittentMovementCount,
      this.liftingConstantMassKg,
      this.liftingConstantMovementCount,
      this.liftingFromSurfaceMassKg,
      this.liftingFromSurfaceMovementCount,
      this.liftingFromFloorMassKg,
      this.liftingFromFloorMovementCount,
      this.stereotypicalLocalMovementPerOperation,
      this.stereotypicalLocalOperationCount,
      this.stereotypicalRegionalMovementPerOperation,
      this.stereotypicalRegionalOperationCount,
      this.staticLoadOneHandMassKg,
      this.staticLoadOneHandHoldingTimeS,
      this.staticLoadOneHandOperationCount,
      this.staticLoadTwoHandsMassKg,
      this.staticLoadTwoHandsHoldingTimeS,
      this.staticLoadTwoHandsOperationCount,
      this.staticLoadBodyAndLegsMassKg,
      this.staticLoadBodyAndLegsHoldingTimeS,
      this.staticLoadBodyAndLegsOperationCount,
      this.freePosturePercentage,
      this.standingPosturePercentage,
      this.uncomfortablePosturePercentage,
      this.fixedPosturePercentage,
      this.forcedPosturePercentage,
      this.sittingPosturePercentage,
      this.tiltsPerOperation,
      this.tiltsOperationCount,
      this.horizontalMovementDistanceKm,
      this.horizontalMovementDistancePerMoveM,
      this.horizontalMovementCount,
      this.verticalMovementDistanceKm,
      this.verticalMovementDistancePerMoveM,
      this.verticalMovementCount});

  factory _$SeverityWorkProcessModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeverityWorkProcessModelImplFromJson(json);

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
// Перемещение груза на расстояние до 1 м
  @override
  final String? massUpTo1mKg;
  @override
  final String? distanceUpTo1mM;
  @override
  final String? movementCountUpTo1m;
// Перемещение груза на расстояние от 1 до 5 м
  @override
  final String? mass1To5mKg;
  @override
  final String? distance1To5mM;
  @override
  final String? movementCount1To5m;
// Перемещение груза на расстояние более 5 м
  @override
  final String? massMoreThan5mKg;
  @override
  final String? distanceMoreThan5mM;
  @override
  final String? movementCountMoreThan5m;
// Подъем и перемещение (разовое) тяжести при чередовании с другой работой
  @override
  final String? liftingIntermittentMassKg;
  @override
  final String? liftingIntermittentMovementCount;
// Подъем и перемещение тяжести постоянно в течение рабочего дня
  @override
  final String? liftingConstantMassKg;
  @override
  final String? liftingConstantMovementCount;
// Подъем с рабочей поверхности
  @override
  final String? liftingFromSurfaceMassKg;
  @override
  final String? liftingFromSurfaceMovementCount;
// Подъем с пола
  @override
  final String? liftingFromFloorMassKg;
  @override
  final String? liftingFromFloorMovementCount;
// Стереотипные рабочие движения при локальной нагрузке
  @override
  final String? stereotypicalLocalMovementPerOperation;
  @override
  final String? stereotypicalLocalOperationCount;
// Стереотипные рабочие движения при региональной нагрузке
  @override
  final String? stereotypicalRegionalMovementPerOperation;
  @override
  final String? stereotypicalRegionalOperationCount;
// Статическая нагрузка (одной рукой)
  @override
  final String? staticLoadOneHandMassKg;
  @override
  final String? staticLoadOneHandHoldingTimeS;
  @override
  final String? staticLoadOneHandOperationCount;
// Статическая нагрузка (двумя руками)
  @override
  final String? staticLoadTwoHandsMassKg;
  @override
  final String? staticLoadTwoHandsHoldingTimeS;
  @override
  final String? staticLoadTwoHandsOperationCount;
// Статическая нагрузка (с участием мышц корпуса и ног)
  @override
  final String? staticLoadBodyAndLegsMassKg;
  @override
  final String? staticLoadBodyAndLegsHoldingTimeS;
  @override
  final String? staticLoadBodyAndLegsOperationCount;
// Рабочая поза
  @override
  final String? freePosturePercentage;
  @override
  final String? standingPosturePercentage;
  @override
  final String? uncomfortablePosturePercentage;
  @override
  final String? fixedPosturePercentage;
  @override
  final String? forcedPosturePercentage;
  @override
  final String? sittingPosturePercentage;
// Наклоны корпуса
  @override
  final String? tiltsPerOperation;
  @override
  final String? tiltsOperationCount;
// Перемещение в пространстве (по горизонтали)
  @override
  final String? horizontalMovementDistanceKm;
  @override
  final String? horizontalMovementDistancePerMoveM;
  @override
  final String? horizontalMovementCount;
// Перемещение в пространстве (по вертикали)
  @override
  final String? verticalMovementDistanceKm;
  @override
  final String? verticalMovementDistancePerMoveM;
  @override
  final String? verticalMovementCount;

  @override
  String toString() {
    return 'SeverityWorkProcessModel(id: $id, organizationName: $organizationName, organizationId: $organizationId, measurementDate: $measurementDate, workplace: $workplace, workplaceId: $workplaceId, parameterName: $parameterName, massUpTo1mKg: $massUpTo1mKg, distanceUpTo1mM: $distanceUpTo1mM, movementCountUpTo1m: $movementCountUpTo1m, mass1To5mKg: $mass1To5mKg, distance1To5mM: $distance1To5mM, movementCount1To5m: $movementCount1To5m, massMoreThan5mKg: $massMoreThan5mKg, distanceMoreThan5mM: $distanceMoreThan5mM, movementCountMoreThan5m: $movementCountMoreThan5m, liftingIntermittentMassKg: $liftingIntermittentMassKg, liftingIntermittentMovementCount: $liftingIntermittentMovementCount, liftingConstantMassKg: $liftingConstantMassKg, liftingConstantMovementCount: $liftingConstantMovementCount, liftingFromSurfaceMassKg: $liftingFromSurfaceMassKg, liftingFromSurfaceMovementCount: $liftingFromSurfaceMovementCount, liftingFromFloorMassKg: $liftingFromFloorMassKg, liftingFromFloorMovementCount: $liftingFromFloorMovementCount, stereotypicalLocalMovementPerOperation: $stereotypicalLocalMovementPerOperation, stereotypicalLocalOperationCount: $stereotypicalLocalOperationCount, stereotypicalRegionalMovementPerOperation: $stereotypicalRegionalMovementPerOperation, stereotypicalRegionalOperationCount: $stereotypicalRegionalOperationCount, staticLoadOneHandMassKg: $staticLoadOneHandMassKg, staticLoadOneHandHoldingTimeS: $staticLoadOneHandHoldingTimeS, staticLoadOneHandOperationCount: $staticLoadOneHandOperationCount, staticLoadTwoHandsMassKg: $staticLoadTwoHandsMassKg, staticLoadTwoHandsHoldingTimeS: $staticLoadTwoHandsHoldingTimeS, staticLoadTwoHandsOperationCount: $staticLoadTwoHandsOperationCount, staticLoadBodyAndLegsMassKg: $staticLoadBodyAndLegsMassKg, staticLoadBodyAndLegsHoldingTimeS: $staticLoadBodyAndLegsHoldingTimeS, staticLoadBodyAndLegsOperationCount: $staticLoadBodyAndLegsOperationCount, freePosturePercentage: $freePosturePercentage, standingPosturePercentage: $standingPosturePercentage, uncomfortablePosturePercentage: $uncomfortablePosturePercentage, fixedPosturePercentage: $fixedPosturePercentage, forcedPosturePercentage: $forcedPosturePercentage, sittingPosturePercentage: $sittingPosturePercentage, tiltsPerOperation: $tiltsPerOperation, tiltsOperationCount: $tiltsOperationCount, horizontalMovementDistanceKm: $horizontalMovementDistanceKm, horizontalMovementDistancePerMoveM: $horizontalMovementDistancePerMoveM, horizontalMovementCount: $horizontalMovementCount, verticalMovementDistanceKm: $verticalMovementDistanceKm, verticalMovementDistancePerMoveM: $verticalMovementDistancePerMoveM, verticalMovementCount: $verticalMovementCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeverityWorkProcessModelImpl &&
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
            (identical(other.massUpTo1mKg, massUpTo1mKg) ||
                other.massUpTo1mKg == massUpTo1mKg) &&
            (identical(other.distanceUpTo1mM, distanceUpTo1mM) ||
                other.distanceUpTo1mM == distanceUpTo1mM) &&
            (identical(other.movementCountUpTo1m, movementCountUpTo1m) ||
                other.movementCountUpTo1m == movementCountUpTo1m) &&
            (identical(other.mass1To5mKg, mass1To5mKg) ||
                other.mass1To5mKg == mass1To5mKg) &&
            (identical(other.distance1To5mM, distance1To5mM) ||
                other.distance1To5mM == distance1To5mM) &&
            (identical(other.movementCount1To5m, movementCount1To5m) ||
                other.movementCount1To5m == movementCount1To5m) &&
            (identical(other.massMoreThan5mKg, massMoreThan5mKg) ||
                other.massMoreThan5mKg == massMoreThan5mKg) &&
            (identical(other.distanceMoreThan5mM, distanceMoreThan5mM) ||
                other.distanceMoreThan5mM == distanceMoreThan5mM) &&
            (identical(other.movementCountMoreThan5m, movementCountMoreThan5m) ||
                other.movementCountMoreThan5m == movementCountMoreThan5m) &&
            (identical(other.liftingIntermittentMassKg, liftingIntermittentMassKg) ||
                other.liftingIntermittentMassKg == liftingIntermittentMassKg) &&
            (identical(other.liftingIntermittentMovementCount, liftingIntermittentMovementCount) ||
                other.liftingIntermittentMovementCount ==
                    liftingIntermittentMovementCount) &&
            (identical(other.liftingConstantMassKg, liftingConstantMassKg) ||
                other.liftingConstantMassKg == liftingConstantMassKg) &&
            (identical(other.liftingConstantMovementCount, liftingConstantMovementCount) ||
                other.liftingConstantMovementCount ==
                    liftingConstantMovementCount) &&
            (identical(other.liftingFromSurfaceMassKg, liftingFromSurfaceMassKg) ||
                other.liftingFromSurfaceMassKg == liftingFromSurfaceMassKg) &&
            (identical(other.liftingFromSurfaceMovementCount, liftingFromSurfaceMovementCount) ||
                other.liftingFromSurfaceMovementCount ==
                    liftingFromSurfaceMovementCount) &&
            (identical(other.liftingFromFloorMassKg, liftingFromFloorMassKg) ||
                other.liftingFromFloorMassKg == liftingFromFloorMassKg) &&
            (identical(other.liftingFromFloorMovementCount, liftingFromFloorMovementCount) ||
                other.liftingFromFloorMovementCount ==
                    liftingFromFloorMovementCount) &&
            (identical(other.stereotypicalLocalMovementPerOperation, stereotypicalLocalMovementPerOperation) ||
                other.stereotypicalLocalMovementPerOperation ==
                    stereotypicalLocalMovementPerOperation) &&
            (identical(other.stereotypicalLocalOperationCount, stereotypicalLocalOperationCount) ||
                other.stereotypicalLocalOperationCount ==
                    stereotypicalLocalOperationCount) &&
            (identical(other.stereotypicalRegionalMovementPerOperation, stereotypicalRegionalMovementPerOperation) || other.stereotypicalRegionalMovementPerOperation == stereotypicalRegionalMovementPerOperation) &&
            (identical(other.stereotypicalRegionalOperationCount, stereotypicalRegionalOperationCount) || other.stereotypicalRegionalOperationCount == stereotypicalRegionalOperationCount) &&
            (identical(other.staticLoadOneHandMassKg, staticLoadOneHandMassKg) || other.staticLoadOneHandMassKg == staticLoadOneHandMassKg) &&
            (identical(other.staticLoadOneHandHoldingTimeS, staticLoadOneHandHoldingTimeS) || other.staticLoadOneHandHoldingTimeS == staticLoadOneHandHoldingTimeS) &&
            (identical(other.staticLoadOneHandOperationCount, staticLoadOneHandOperationCount) || other.staticLoadOneHandOperationCount == staticLoadOneHandOperationCount) &&
            (identical(other.staticLoadTwoHandsMassKg, staticLoadTwoHandsMassKg) || other.staticLoadTwoHandsMassKg == staticLoadTwoHandsMassKg) &&
            (identical(other.staticLoadTwoHandsHoldingTimeS, staticLoadTwoHandsHoldingTimeS) || other.staticLoadTwoHandsHoldingTimeS == staticLoadTwoHandsHoldingTimeS) &&
            (identical(other.staticLoadTwoHandsOperationCount, staticLoadTwoHandsOperationCount) || other.staticLoadTwoHandsOperationCount == staticLoadTwoHandsOperationCount) &&
            (identical(other.staticLoadBodyAndLegsMassKg, staticLoadBodyAndLegsMassKg) || other.staticLoadBodyAndLegsMassKg == staticLoadBodyAndLegsMassKg) &&
            (identical(other.staticLoadBodyAndLegsHoldingTimeS, staticLoadBodyAndLegsHoldingTimeS) || other.staticLoadBodyAndLegsHoldingTimeS == staticLoadBodyAndLegsHoldingTimeS) &&
            (identical(other.staticLoadBodyAndLegsOperationCount, staticLoadBodyAndLegsOperationCount) || other.staticLoadBodyAndLegsOperationCount == staticLoadBodyAndLegsOperationCount) &&
            (identical(other.freePosturePercentage, freePosturePercentage) || other.freePosturePercentage == freePosturePercentage) &&
            (identical(other.standingPosturePercentage, standingPosturePercentage) || other.standingPosturePercentage == standingPosturePercentage) &&
            (identical(other.uncomfortablePosturePercentage, uncomfortablePosturePercentage) || other.uncomfortablePosturePercentage == uncomfortablePosturePercentage) &&
            (identical(other.fixedPosturePercentage, fixedPosturePercentage) || other.fixedPosturePercentage == fixedPosturePercentage) &&
            (identical(other.forcedPosturePercentage, forcedPosturePercentage) || other.forcedPosturePercentage == forcedPosturePercentage) &&
            (identical(other.sittingPosturePercentage, sittingPosturePercentage) || other.sittingPosturePercentage == sittingPosturePercentage) &&
            (identical(other.tiltsPerOperation, tiltsPerOperation) || other.tiltsPerOperation == tiltsPerOperation) &&
            (identical(other.tiltsOperationCount, tiltsOperationCount) || other.tiltsOperationCount == tiltsOperationCount) &&
            (identical(other.horizontalMovementDistanceKm, horizontalMovementDistanceKm) || other.horizontalMovementDistanceKm == horizontalMovementDistanceKm) &&
            (identical(other.horizontalMovementDistancePerMoveM, horizontalMovementDistancePerMoveM) || other.horizontalMovementDistancePerMoveM == horizontalMovementDistancePerMoveM) &&
            (identical(other.horizontalMovementCount, horizontalMovementCount) || other.horizontalMovementCount == horizontalMovementCount) &&
            (identical(other.verticalMovementDistanceKm, verticalMovementDistanceKm) || other.verticalMovementDistanceKm == verticalMovementDistanceKm) &&
            (identical(other.verticalMovementDistancePerMoveM, verticalMovementDistancePerMoveM) || other.verticalMovementDistancePerMoveM == verticalMovementDistancePerMoveM) &&
            (identical(other.verticalMovementCount, verticalMovementCount) || other.verticalMovementCount == verticalMovementCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        organizationName,
        organizationId,
        measurementDate,
        workplace,
        workplaceId,
        parameterName,
        massUpTo1mKg,
        distanceUpTo1mM,
        movementCountUpTo1m,
        mass1To5mKg,
        distance1To5mM,
        movementCount1To5m,
        massMoreThan5mKg,
        distanceMoreThan5mM,
        movementCountMoreThan5m,
        liftingIntermittentMassKg,
        liftingIntermittentMovementCount,
        liftingConstantMassKg,
        liftingConstantMovementCount,
        liftingFromSurfaceMassKg,
        liftingFromSurfaceMovementCount,
        liftingFromFloorMassKg,
        liftingFromFloorMovementCount,
        stereotypicalLocalMovementPerOperation,
        stereotypicalLocalOperationCount,
        stereotypicalRegionalMovementPerOperation,
        stereotypicalRegionalOperationCount,
        staticLoadOneHandMassKg,
        staticLoadOneHandHoldingTimeS,
        staticLoadOneHandOperationCount,
        staticLoadTwoHandsMassKg,
        staticLoadTwoHandsHoldingTimeS,
        staticLoadTwoHandsOperationCount,
        staticLoadBodyAndLegsMassKg,
        staticLoadBodyAndLegsHoldingTimeS,
        staticLoadBodyAndLegsOperationCount,
        freePosturePercentage,
        standingPosturePercentage,
        uncomfortablePosturePercentage,
        fixedPosturePercentage,
        forcedPosturePercentage,
        sittingPosturePercentage,
        tiltsPerOperation,
        tiltsOperationCount,
        horizontalMovementDistanceKm,
        horizontalMovementDistancePerMoveM,
        horizontalMovementCount,
        verticalMovementDistanceKm,
        verticalMovementDistancePerMoveM,
        verticalMovementCount
      ]);

  /// Create a copy of SeverityWorkProcessModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeverityWorkProcessModelImplCopyWith<_$SeverityWorkProcessModelImpl>
      get copyWith => __$$SeverityWorkProcessModelImplCopyWithImpl<
          _$SeverityWorkProcessModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeverityWorkProcessModelImplToJson(
      this,
    );
  }
}

abstract class _SeverityWorkProcessModel implements SeverityWorkProcessModel {
  const factory _SeverityWorkProcessModel(
      {final int? id,
      final String? organizationName,
      final String? organizationId,
      final String? measurementDate,
      final String? workplace,
      final String? workplaceId,
      final String? parameterName,
      final String? massUpTo1mKg,
      final String? distanceUpTo1mM,
      final String? movementCountUpTo1m,
      final String? mass1To5mKg,
      final String? distance1To5mM,
      final String? movementCount1To5m,
      final String? massMoreThan5mKg,
      final String? distanceMoreThan5mM,
      final String? movementCountMoreThan5m,
      final String? liftingIntermittentMassKg,
      final String? liftingIntermittentMovementCount,
      final String? liftingConstantMassKg,
      final String? liftingConstantMovementCount,
      final String? liftingFromSurfaceMassKg,
      final String? liftingFromSurfaceMovementCount,
      final String? liftingFromFloorMassKg,
      final String? liftingFromFloorMovementCount,
      final String? stereotypicalLocalMovementPerOperation,
      final String? stereotypicalLocalOperationCount,
      final String? stereotypicalRegionalMovementPerOperation,
      final String? stereotypicalRegionalOperationCount,
      final String? staticLoadOneHandMassKg,
      final String? staticLoadOneHandHoldingTimeS,
      final String? staticLoadOneHandOperationCount,
      final String? staticLoadTwoHandsMassKg,
      final String? staticLoadTwoHandsHoldingTimeS,
      final String? staticLoadTwoHandsOperationCount,
      final String? staticLoadBodyAndLegsMassKg,
      final String? staticLoadBodyAndLegsHoldingTimeS,
      final String? staticLoadBodyAndLegsOperationCount,
      final String? freePosturePercentage,
      final String? standingPosturePercentage,
      final String? uncomfortablePosturePercentage,
      final String? fixedPosturePercentage,
      final String? forcedPosturePercentage,
      final String? sittingPosturePercentage,
      final String? tiltsPerOperation,
      final String? tiltsOperationCount,
      final String? horizontalMovementDistanceKm,
      final String? horizontalMovementDistancePerMoveM,
      final String? horizontalMovementCount,
      final String? verticalMovementDistanceKm,
      final String? verticalMovementDistancePerMoveM,
      final String? verticalMovementCount}) = _$SeverityWorkProcessModelImpl;

  factory _SeverityWorkProcessModel.fromJson(Map<String, dynamic> json) =
      _$SeverityWorkProcessModelImpl.fromJson;

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
  String? get parameterName; // Перемещение груза на расстояние до 1 м
  @override
  String? get massUpTo1mKg;
  @override
  String? get distanceUpTo1mM;
  @override
  String?
      get movementCountUpTo1m; // Перемещение груза на расстояние от 1 до 5 м
  @override
  String? get mass1To5mKg;
  @override
  String? get distance1To5mM;
  @override
  String? get movementCount1To5m; // Перемещение груза на расстояние более 5 м
  @override
  String? get massMoreThan5mKg;
  @override
  String? get distanceMoreThan5mM;
  @override
  String?
      get movementCountMoreThan5m; // Подъем и перемещение (разовое) тяжести при чередовании с другой работой
  @override
  String? get liftingIntermittentMassKg;
  @override
  String?
      get liftingIntermittentMovementCount; // Подъем и перемещение тяжести постоянно в течение рабочего дня
  @override
  String? get liftingConstantMassKg;
  @override
  String? get liftingConstantMovementCount; // Подъем с рабочей поверхности
  @override
  String? get liftingFromSurfaceMassKg;
  @override
  String? get liftingFromSurfaceMovementCount; // Подъем с пола
  @override
  String? get liftingFromFloorMassKg;
  @override
  String?
      get liftingFromFloorMovementCount; // Стереотипные рабочие движения при локальной нагрузке
  @override
  String? get stereotypicalLocalMovementPerOperation;
  @override
  String?
      get stereotypicalLocalOperationCount; // Стереотипные рабочие движения при региональной нагрузке
  @override
  String? get stereotypicalRegionalMovementPerOperation;
  @override
  String?
      get stereotypicalRegionalOperationCount; // Статическая нагрузка (одной рукой)
  @override
  String? get staticLoadOneHandMassKg;
  @override
  String? get staticLoadOneHandHoldingTimeS;
  @override
  String?
      get staticLoadOneHandOperationCount; // Статическая нагрузка (двумя руками)
  @override
  String? get staticLoadTwoHandsMassKg;
  @override
  String? get staticLoadTwoHandsHoldingTimeS;
  @override
  String?
      get staticLoadTwoHandsOperationCount; // Статическая нагрузка (с участием мышц корпуса и ног)
  @override
  String? get staticLoadBodyAndLegsMassKg;
  @override
  String? get staticLoadBodyAndLegsHoldingTimeS;
  @override
  String? get staticLoadBodyAndLegsOperationCount; // Рабочая поза
  @override
  String? get freePosturePercentage;
  @override
  String? get standingPosturePercentage;
  @override
  String? get uncomfortablePosturePercentage;
  @override
  String? get fixedPosturePercentage;
  @override
  String? get forcedPosturePercentage;
  @override
  String? get sittingPosturePercentage; // Наклоны корпуса
  @override
  String? get tiltsPerOperation;
  @override
  String?
      get tiltsOperationCount; // Перемещение в пространстве (по горизонтали)
  @override
  String? get horizontalMovementDistanceKm;
  @override
  String? get horizontalMovementDistancePerMoveM;
  @override
  String?
      get horizontalMovementCount; // Перемещение в пространстве (по вертикали)
  @override
  String? get verticalMovementDistanceKm;
  @override
  String? get verticalMovementDistancePerMoveM;
  @override
  String? get verticalMovementCount;

  /// Create a copy of SeverityWorkProcessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeverityWorkProcessModelImplCopyWith<_$SeverityWorkProcessModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
