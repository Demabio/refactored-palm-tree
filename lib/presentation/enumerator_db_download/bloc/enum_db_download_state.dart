// ignore_for_file: must_be_immutable

part of 'enum_db_download_bloc.dart';

/// Represents the state of HomeFarmerNotFound in the application.
class EnumDbDownloadState extends Equatable {
  EnumDbDownloadState({
    this.homeFarmerNotFoundModelObj,
    this.count = 0,
    this.visibility = false,
    this.linebarvalue = 0,
    this.percentagedone = 0,
    this.failed = false,
    this.success = false,
    this.downing = false,
  });

  EnumDbDownloadModel? homeFarmerNotFoundModelObj;

  int count;

  bool visibility;

  double linebarvalue;

  int percentagedone;

  bool failed;

  bool success;
  bool downing;

  @override
  List<Object?> get props => [
        homeFarmerNotFoundModelObj,
        count,
        failed,
        percentagedone,
        linebarvalue,
        success,
        visibility,
        downing,
      ];
  EnumDbDownloadState copyWith({
    EnumDbDownloadModel? homeFarmerNotFoundModelObj,
    int? count,
    bool? visibility,
    double? linebarvalue,
    int? percentagedone,
    bool? failed,
    bool? success,
    bool? downing,
  }) {
    return EnumDbDownloadState(
      homeFarmerNotFoundModelObj:
          homeFarmerNotFoundModelObj ?? this.homeFarmerNotFoundModelObj,
      count: count ?? this.count,
      visibility: visibility ?? this.visibility,
      linebarvalue: linebarvalue ?? this.linebarvalue,
      percentagedone: percentagedone ?? this.percentagedone,
      failed: failed ?? this.failed,
      success: success ?? this.success,
      downing: downing ?? this.downing,
    );
  }
}
