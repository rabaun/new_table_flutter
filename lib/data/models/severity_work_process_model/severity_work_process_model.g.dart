// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'severity_work_process_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeverityWorkProcessModelImpl _$$SeverityWorkProcessModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SeverityWorkProcessModelImpl(
      id: (json['id'] as num?)?.toInt(),
      organizationName: json['organizationName'] as String?,
      organizationId: json['organizationId'] as String?,
      measurementDate: json['measurementDate'] as String?,
      workplace: json['workplace'] as String?,
      workplaceId: json['workplaceId'] as String?,
      parameterName: json['parameterName'] as String?,
      massUpTo1mKg: json['massUpTo1mKg'] as String?,
      distanceUpTo1mM: json['distanceUpTo1mM'] as String?,
      movementCountUpTo1m: json['movementCountUpTo1m'] as String?,
      mass1To5mKg: json['mass1To5mKg'] as String?,
      distance1To5mM: json['distance1To5mM'] as String?,
      movementCount1To5m: json['movementCount1To5m'] as String?,
      massMoreThan5mKg: json['massMoreThan5mKg'] as String?,
      distanceMoreThan5mM: json['distanceMoreThan5mM'] as String?,
      movementCountMoreThan5m: json['movementCountMoreThan5m'] as String?,
      liftingIntermittentMassKg: json['liftingIntermittentMassKg'] as String?,
      liftingIntermittentMovementCount:
          json['liftingIntermittentMovementCount'] as String?,
      liftingConstantMassKg: json['liftingConstantMassKg'] as String?,
      liftingConstantMovementCount:
          json['liftingConstantMovementCount'] as String?,
      liftingFromSurfaceMassKg: json['liftingFromSurfaceMassKg'] as String?,
      liftingFromSurfaceMovementCount:
          json['liftingFromSurfaceMovementCount'] as String?,
      liftingFromFloorMassKg: json['liftingFromFloorMassKg'] as String?,
      liftingFromFloorMovementCount:
          json['liftingFromFloorMovementCount'] as String?,
      stereotypicalLocalMovementPerOperation:
          json['stereotypicalLocalMovementPerOperation'] as String?,
      stereotypicalLocalOperationCount:
          json['stereotypicalLocalOperationCount'] as String?,
      stereotypicalRegionalMovementPerOperation:
          json['stereotypicalRegionalMovementPerOperation'] as String?,
      stereotypicalRegionalOperationCount:
          json['stereotypicalRegionalOperationCount'] as String?,
      staticLoadOneHandMassKg: json['staticLoadOneHandMassKg'] as String?,
      staticLoadOneHandHoldingTimeS:
          json['staticLoadOneHandHoldingTimeS'] as String?,
      staticLoadOneHandOperationCount:
          json['staticLoadOneHandOperationCount'] as String?,
      staticLoadTwoHandsMassKg: json['staticLoadTwoHandsMassKg'] as String?,
      staticLoadTwoHandsHoldingTimeS:
          json['staticLoadTwoHandsHoldingTimeS'] as String?,
      staticLoadTwoHandsOperationCount:
          json['staticLoadTwoHandsOperationCount'] as String?,
      staticLoadBodyAndLegsMassKg:
          json['staticLoadBodyAndLegsMassKg'] as String?,
      staticLoadBodyAndLegsHoldingTimeS:
          json['staticLoadBodyAndLegsHoldingTimeS'] as String?,
      staticLoadBodyAndLegsOperationCount:
          json['staticLoadBodyAndLegsOperationCount'] as String?,
      freePosturePercentage: json['freePosturePercentage'] as String?,
      standingPosturePercentage: json['standingPosturePercentage'] as String?,
      uncomfortablePosturePercentage:
          json['uncomfortablePosturePercentage'] as String?,
      fixedPosturePercentage: json['fixedPosturePercentage'] as String?,
      forcedPosturePercentage: json['forcedPosturePercentage'] as String?,
      sittingPosturePercentage: json['sittingPosturePercentage'] as String?,
      tiltsPerOperation: json['tiltsPerOperation'] as String?,
      tiltsOperationCount: json['tiltsOperationCount'] as String?,
      horizontalMovementDistanceKm:
          json['horizontalMovementDistanceKm'] as String?,
      horizontalMovementDistancePerMoveM:
          json['horizontalMovementDistancePerMoveM'] as String?,
      horizontalMovementCount: json['horizontalMovementCount'] as String?,
      verticalMovementDistanceKm: json['verticalMovementDistanceKm'] as String?,
      verticalMovementDistancePerMoveM:
          json['verticalMovementDistancePerMoveM'] as String?,
      verticalMovementCount: json['verticalMovementCount'] as String?,
    );

Map<String, dynamic> _$$SeverityWorkProcessModelImplToJson(
        _$SeverityWorkProcessModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationName': instance.organizationName,
      'organizationId': instance.organizationId,
      'measurementDate': instance.measurementDate,
      'workplace': instance.workplace,
      'workplaceId': instance.workplaceId,
      'parameterName': instance.parameterName,
      'massUpTo1mKg': instance.massUpTo1mKg,
      'distanceUpTo1mM': instance.distanceUpTo1mM,
      'movementCountUpTo1m': instance.movementCountUpTo1m,
      'mass1To5mKg': instance.mass1To5mKg,
      'distance1To5mM': instance.distance1To5mM,
      'movementCount1To5m': instance.movementCount1To5m,
      'massMoreThan5mKg': instance.massMoreThan5mKg,
      'distanceMoreThan5mM': instance.distanceMoreThan5mM,
      'movementCountMoreThan5m': instance.movementCountMoreThan5m,
      'liftingIntermittentMassKg': instance.liftingIntermittentMassKg,
      'liftingIntermittentMovementCount':
          instance.liftingIntermittentMovementCount,
      'liftingConstantMassKg': instance.liftingConstantMassKg,
      'liftingConstantMovementCount': instance.liftingConstantMovementCount,
      'liftingFromSurfaceMassKg': instance.liftingFromSurfaceMassKg,
      'liftingFromSurfaceMovementCount':
          instance.liftingFromSurfaceMovementCount,
      'liftingFromFloorMassKg': instance.liftingFromFloorMassKg,
      'liftingFromFloorMovementCount': instance.liftingFromFloorMovementCount,
      'stereotypicalLocalMovementPerOperation':
          instance.stereotypicalLocalMovementPerOperation,
      'stereotypicalLocalOperationCount':
          instance.stereotypicalLocalOperationCount,
      'stereotypicalRegionalMovementPerOperation':
          instance.stereotypicalRegionalMovementPerOperation,
      'stereotypicalRegionalOperationCount':
          instance.stereotypicalRegionalOperationCount,
      'staticLoadOneHandMassKg': instance.staticLoadOneHandMassKg,
      'staticLoadOneHandHoldingTimeS': instance.staticLoadOneHandHoldingTimeS,
      'staticLoadOneHandOperationCount':
          instance.staticLoadOneHandOperationCount,
      'staticLoadTwoHandsMassKg': instance.staticLoadTwoHandsMassKg,
      'staticLoadTwoHandsHoldingTimeS': instance.staticLoadTwoHandsHoldingTimeS,
      'staticLoadTwoHandsOperationCount':
          instance.staticLoadTwoHandsOperationCount,
      'staticLoadBodyAndLegsMassKg': instance.staticLoadBodyAndLegsMassKg,
      'staticLoadBodyAndLegsHoldingTimeS':
          instance.staticLoadBodyAndLegsHoldingTimeS,
      'staticLoadBodyAndLegsOperationCount':
          instance.staticLoadBodyAndLegsOperationCount,
      'freePosturePercentage': instance.freePosturePercentage,
      'standingPosturePercentage': instance.standingPosturePercentage,
      'uncomfortablePosturePercentage': instance.uncomfortablePosturePercentage,
      'fixedPosturePercentage': instance.fixedPosturePercentage,
      'forcedPosturePercentage': instance.forcedPosturePercentage,
      'sittingPosturePercentage': instance.sittingPosturePercentage,
      'tiltsPerOperation': instance.tiltsPerOperation,
      'tiltsOperationCount': instance.tiltsOperationCount,
      'horizontalMovementDistanceKm': instance.horizontalMovementDistanceKm,
      'horizontalMovementDistancePerMoveM':
          instance.horizontalMovementDistancePerMoveM,
      'horizontalMovementCount': instance.horizontalMovementCount,
      'verticalMovementDistanceKm': instance.verticalMovementDistanceKm,
      'verticalMovementDistancePerMoveM':
          instance.verticalMovementDistancePerMoveM,
      'verticalMovementCount': instance.verticalMovementCount,
    };
