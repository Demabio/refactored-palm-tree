// ignore_for_file: must_be_immutable

part of 'farmer_registration_bloc.dart';

/// Represents the state of FarmerRegistration in the application.
class FarmerRegistrationState extends Equatable {
  FarmerRegistrationState({this.farmerRegistrationModelObj});

  FarmerRegistrationModel? farmerRegistrationModelObj;

  @override
  List<Object?> get props => [
        farmerRegistrationModelObj,
      ];
  FarmerRegistrationState copyWith(
      {FarmerRegistrationModel? farmerRegistrationModelObj}) {
    return FarmerRegistrationState(
      farmerRegistrationModelObj:
          farmerRegistrationModelObj ?? this.farmerRegistrationModelObj,
    );
  }
}
