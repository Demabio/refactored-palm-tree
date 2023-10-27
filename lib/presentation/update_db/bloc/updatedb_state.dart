// ignore_for_file: must_be_immutable

part of 'updatedb_bloc.dart';

/// Represents the state of HomeFarmerNotFound in the application.
class UpdateDBState extends Equatable {
  UpdateDBState({
    this.homeFarmerNotFoundModelObj,
    this.count = 0,
    this.visibility = false,
    this.linebarvalue = 0,
    this.percentagedone = 0,
    this.failed = false,
    this.success = false,
  });

  UpdateDBModel? homeFarmerNotFoundModelObj;

  int count;

  bool visibility;

  double linebarvalue;

  int percentagedone;

  bool failed;

  bool success;

  @override
  List<Object?> get props => [
        homeFarmerNotFoundModelObj,
        count,
        failed,
        percentagedone,
        linebarvalue,
        success,
        visibility,
      ];
  UpdateDBState copyWith({
    UpdateDBModel? homeFarmerNotFoundModelObj,
    int? count,
    bool? visibility,
    double? linebarvalue,
    int? percentagedone,
    bool? failed,
    bool? success,
  }) {
    return UpdateDBState(
      homeFarmerNotFoundModelObj:
          homeFarmerNotFoundModelObj ?? this.homeFarmerNotFoundModelObj,
      count: count ?? this.count,
      visibility: visibility ?? this.visibility,
      linebarvalue: linebarvalue ?? this.linebarvalue,
      percentagedone: percentagedone ?? this.percentagedone,
      failed: failed ?? this.failed,
      success: success ?? this.success,
    );
  }
}
