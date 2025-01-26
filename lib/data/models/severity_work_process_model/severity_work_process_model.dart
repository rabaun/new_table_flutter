import 'package:freezed_annotation/freezed_annotation.dart';

part 'severity_work_process_model.freezed.dart';
part 'severity_work_process_model.g.dart';

@freezed
class SeverityWorkProcessModel with _$SeverityWorkProcessModel {
  const factory SeverityWorkProcessModel({
    int? id,
    String? organizationName,
    String? organizationId,
    String? measurementDate,
    String? workplace,
    String? workplaceId,
    String? parameterName,

    // Перемещение груза на расстояние до 1 м
    String? massUpTo1mKg,
    String? distanceUpTo1mM,
    String? movementCountUpTo1m,

    // Перемещение груза на расстояние от 1 до 5 м
    String? mass1To5mKg,
    String? distance1To5mM,
    String? movementCount1To5m,

    // Перемещение груза на расстояние более 5 м
    String? massMoreThan5mKg,
    String? distanceMoreThan5mM,
    String? movementCountMoreThan5m,

    // Подъем и перемещение (разовое) тяжести при чередовании с другой работой
    String? liftingIntermittentMassKg,
    String? liftingIntermittentMovementCount,

    // Подъем и перемещение тяжести постоянно в течение рабочего дня
    String? liftingConstantMassKg,
    String? liftingConstantMovementCount,

    // Подъем с рабочей поверхности
    String? liftingFromSurfaceMassKg,
    String? liftingFromSurfaceMovementCount,

    // Подъем с пола
    String? liftingFromFloorMassKg,
    String? liftingFromFloorMovementCount,

    // Стереотипные рабочие движения при локальной нагрузке
    String? stereotypicalLocalMovementPerOperation,
    String? stereotypicalLocalOperationCount,

    // Стереотипные рабочие движения при региональной нагрузке
    String? stereotypicalRegionalMovementPerOperation,
    String? stereotypicalRegionalOperationCount,

    // Статическая нагрузка (одной рукой)
    String? staticLoadOneHandMassKg,
    String? staticLoadOneHandHoldingTimeS,
    String? staticLoadOneHandOperationCount,

    // Статическая нагрузка (двумя руками)
    String? staticLoadTwoHandsMassKg,
    String? staticLoadTwoHandsHoldingTimeS,
    String? staticLoadTwoHandsOperationCount,

    // Статическая нагрузка (с участием мышц корпуса и ног)
    String? staticLoadBodyAndLegsMassKg,
    String? staticLoadBodyAndLegsHoldingTimeS,
    String? staticLoadBodyAndLegsOperationCount,

    // Рабочая поза
    String? freePosturePercentage,
    String? standingPosturePercentage,
    String? uncomfortablePosturePercentage,
    String? fixedPosturePercentage,
    String? forcedPosturePercentage,
    String? sittingPosturePercentage,

    // Наклоны корпуса
    String? tiltsPerOperation,
    String? tiltsOperationCount,

    // Перемещение в пространстве (по горизонтали)
    String? horizontalMovementDistanceKm,
    String? horizontalMovementDistancePerMoveM,
    String? horizontalMovementCount,

    // Перемещение в пространстве (по вертикали)
    String? verticalMovementDistanceKm,
    String? verticalMovementDistancePerMoveM,
    String? verticalMovementCount,
  }) = _SeverityWorkProcessModel;

  factory SeverityWorkProcessModel.fromJson(Map<String, dynamic> json) => _$SeverityWorkProcessModelFromJson(json);
}
