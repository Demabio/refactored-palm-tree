// ignore_for_file: must_be_immutable

part of 'farmer_registration_one_bloc.dart';

/// Represents the state of FarmerRegistrationOne in the application.
class FarmerRegistrationOneState extends Equatable {
  FarmerRegistrationOneState({this.farmerRegistrationOneModelObj});

  FarmerRegistrationOneModel? farmerRegistrationOneModelObj;

  @override
  List<Object?> get props => [
        farmerRegistrationOneModelObj,
      ];
  FarmerRegistrationOneState copyWith(
      {FarmerRegistrationOneModel? farmerRegistrationOneModelObj}) {
    return FarmerRegistrationOneState(
      farmerRegistrationOneModelObj:
          farmerRegistrationOneModelObj ?? this.farmerRegistrationOneModelObj,
    );
  }
}
