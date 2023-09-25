// ignore_for_file: must_be_immutable

part of 'farmers_identification_bloc.dart';

/// Represents the state of FarmersIdentification in the application.
class FarmersIdentificationState extends Equatable {
  FarmersIdentificationState({this.farmersIdentificationModelObj});

  FarmersIdentificationModel? farmersIdentificationModelObj;

  @override
  List<Object?> get props => [
        farmersIdentificationModelObj,
      ];
  FarmersIdentificationState copyWith(
      {FarmersIdentificationModel? farmersIdentificationModelObj}) {
    return FarmersIdentificationState(
      farmersIdentificationModelObj:
          farmersIdentificationModelObj ?? this.farmersIdentificationModelObj,
    );
  }
}
