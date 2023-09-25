// ignore_for_file: must_be_immutable

part of 'farmers_identification_two_bloc.dart';

/// Represents the state of FarmersIdentificationTwo in the application.
class FarmersIdentificationTwoState extends Equatable {
  FarmersIdentificationTwoState({
    this.idnumberoneController,
    this.mobileNumberController,
    this.emailController,
    this.addressController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.farmersIdentificationTwoModelObj,
  });

  TextEditingController? idnumberoneController;

  TextEditingController? mobileNumberController;

  TextEditingController? emailController;

  TextEditingController? addressController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  FarmersIdentificationTwoModel? farmersIdentificationTwoModelObj;

  @override
  List<Object?> get props => [
        idnumberoneController,
        mobileNumberController,
        emailController,
        addressController,
        selectedDropDownValue,
        selectedDropDownValue1,
        farmersIdentificationTwoModelObj,
      ];
  FarmersIdentificationTwoState copyWith({
    TextEditingController? idnumberoneController,
    TextEditingController? mobileNumberController,
    TextEditingController? emailController,
    TextEditingController? addressController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    FarmersIdentificationTwoModel? farmersIdentificationTwoModelObj,
  }) {
    return FarmersIdentificationTwoState(
      idnumberoneController:
          idnumberoneController ?? this.idnumberoneController,
      mobileNumberController:
          mobileNumberController ?? this.mobileNumberController,
      emailController: emailController ?? this.emailController,
      addressController: addressController ?? this.addressController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      farmersIdentificationTwoModelObj: farmersIdentificationTwoModelObj ??
          this.farmersIdentificationTwoModelObj,
    );
  }
}
