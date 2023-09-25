// ignore_for_file: must_be_immutable

part of 'profile_address_details_bloc.dart';

/// Represents the state of ProfileAddressDetails in the application.
class ProfileAddressDetailsState extends Equatable {
  ProfileAddressDetailsState({
    this.addressController,
    this.addressController1,
    this.cityController,
    this.enterpostalController,
    this.phoneNumberController,
    this.profileAddressDetailsModelObj,
  });

  TextEditingController? addressController;

  TextEditingController? addressController1;

  TextEditingController? cityController;

  TextEditingController? enterpostalController;

  TextEditingController? phoneNumberController;

  ProfileAddressDetailsModel? profileAddressDetailsModelObj;

  @override
  List<Object?> get props => [
        addressController,
        addressController1,
        cityController,
        enterpostalController,
        phoneNumberController,
        profileAddressDetailsModelObj,
      ];
  ProfileAddressDetailsState copyWith({
    TextEditingController? addressController,
    TextEditingController? addressController1,
    TextEditingController? cityController,
    TextEditingController? enterpostalController,
    TextEditingController? phoneNumberController,
    ProfileAddressDetailsModel? profileAddressDetailsModelObj,
  }) {
    return ProfileAddressDetailsState(
      addressController: addressController ?? this.addressController,
      addressController1: addressController1 ?? this.addressController1,
      cityController: cityController ?? this.cityController,
      enterpostalController:
          enterpostalController ?? this.enterpostalController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      profileAddressDetailsModelObj:
          profileAddressDetailsModelObj ?? this.profileAddressDetailsModelObj,
    );
  }
}
