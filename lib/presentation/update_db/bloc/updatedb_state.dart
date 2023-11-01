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
    this.visibility2 = false,
    this.linebarvalue2 = 0,
    this.percentagedone2 = 0,
    this.failed2 = false,
    this.success2 = false,
  });

  UpdateDBModel? homeFarmerNotFoundModelObj;

  int count;

  bool visibility;

  double linebarvalue;

  int percentagedone;

  bool failed;

  bool success;

  bool visibility2;

  double linebarvalue2;

  int percentagedone2;

  bool failed2;

  bool success2;

  @override
  List<Object?> get props => [
        homeFarmerNotFoundModelObj,
        count,
        failed,
        percentagedone,
        linebarvalue,
        success,
        visibility2,
        failed2,
        percentagedone2,
        linebarvalue2,
        success2,
        visibility2,
      ];
  UpdateDBState copyWith({
    UpdateDBModel? homeFarmerNotFoundModelObj,
    int? count,
    bool? visibility,
    bool? visibility2,
    double? linebarvalue,
    int? percentagedone,
    double? linebarvalue2,
    int? percentagedone2,
    bool? failed,
    bool? success,
    bool? failed2,
    bool? success2,
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
      visibility2: visibility2 ?? this.visibility2,
      linebarvalue2: linebarvalue2 ?? this.linebarvalue2,
      percentagedone2: percentagedone2 ?? this.percentagedone2,
      failed2: failed2 ?? this.failed2,
      success2: success2 ?? this.success2,
    );
  }
}
