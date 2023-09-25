// ignore_for_file: must_be_immutable

part of 'farmers_identification_one_bloc.dart';

/// Represents the state of FarmersIdentificationOne in the application.
class FarmersIdentificationOneState extends Equatable {
  FarmersIdentificationOneState({
    this.nameController,
    this.areaNumberController,
    this.shoppingCenterController,
    this.nameController1,
    this.farmersIdentificationOneModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? areaNumberController;

  TextEditingController? shoppingCenterController;

  TextEditingController? nameController1;

  FarmersIdentificationOneModel? farmersIdentificationOneModelObj;

  @override
  List<Object?> get props => [
        nameController,
        areaNumberController,
        shoppingCenterController,
        nameController1,
        farmersIdentificationOneModelObj,
      ];
  FarmersIdentificationOneState copyWith({
    TextEditingController? nameController,
    TextEditingController? areaNumberController,
    TextEditingController? shoppingCenterController,
    TextEditingController? nameController1,
    FarmersIdentificationOneModel? farmersIdentificationOneModelObj,
  }) {
    return FarmersIdentificationOneState(
      nameController: nameController ?? this.nameController,
      areaNumberController: areaNumberController ?? this.areaNumberController,
      shoppingCenterController:
          shoppingCenterController ?? this.shoppingCenterController,
      nameController1: nameController1 ?? this.nameController1,
      farmersIdentificationOneModelObj: farmersIdentificationOneModelObj ??
          this.farmersIdentificationOneModelObj,
    );
  }
}
