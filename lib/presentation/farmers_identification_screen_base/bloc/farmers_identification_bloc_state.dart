// ignore_for_file: must_be_immutable

part of 'farmers_identification_base_bloc.dart';

/// Represents the state of FarmersIdentification in the application.
class FarmersIdentificationBaseState extends Equatable {
  FarmersIdentificationBaseState({this.farmersIdentificationModelObj});

  FarmersIdentificationBaseModel? farmersIdentificationModelObj;

  @override
  List<Object?> get props => [
        farmersIdentificationModelObj,
      ];
  FarmersIdentificationBaseState copyWith(
      {FarmersIdentificationBaseModel? farmersIdentificationModelObj}) {
    return FarmersIdentificationBaseState(
      farmersIdentificationModelObj:
          farmersIdentificationModelObj ?? this.farmersIdentificationModelObj,
    );
  }
}
