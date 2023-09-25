// ignore_for_file: must_be_immutable

part of 'primary_farm_holding_one_bloc.dart';

/// Represents the state of PrimaryFarmHoldingOne in the application.
class PrimaryFarmHoldingOneState extends Equatable {
  PrimaryFarmHoldingOneState({
    this.nameController,
    this.sizeController,
    this.sizeoneController,
    this.areaController,
    this.sizeLandLeasedController,
    this.sizeLandIdleController,
    this.selectedDropDownValue,
    this.primaryFarmHoldingOneModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? sizeController;

  TextEditingController? sizeoneController;

  TextEditingController? areaController;

  TextEditingController? sizeLandLeasedController;

  TextEditingController? sizeLandIdleController;

  SelectionPopupModel? selectedDropDownValue;

  PrimaryFarmHoldingOneModel? primaryFarmHoldingOneModelObj;

  @override
  List<Object?> get props => [
        nameController,
        sizeController,
        sizeoneController,
        areaController,
        sizeLandLeasedController,
        sizeLandIdleController,
        selectedDropDownValue,
        primaryFarmHoldingOneModelObj,
      ];
  PrimaryFarmHoldingOneState copyWith({
    TextEditingController? nameController,
    TextEditingController? sizeController,
    TextEditingController? sizeoneController,
    TextEditingController? areaController,
    TextEditingController? sizeLandLeasedController,
    TextEditingController? sizeLandIdleController,
    SelectionPopupModel? selectedDropDownValue,
    PrimaryFarmHoldingOneModel? primaryFarmHoldingOneModelObj,
  }) {
    return PrimaryFarmHoldingOneState(
      nameController: nameController ?? this.nameController,
      sizeController: sizeController ?? this.sizeController,
      sizeoneController: sizeoneController ?? this.sizeoneController,
      areaController: areaController ?? this.areaController,
      sizeLandLeasedController:
          sizeLandLeasedController ?? this.sizeLandLeasedController,
      sizeLandIdleController:
          sizeLandIdleController ?? this.sizeLandIdleController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      primaryFarmHoldingOneModelObj:
          primaryFarmHoldingOneModelObj ?? this.primaryFarmHoldingOneModelObj,
    );
  }
}
