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
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
    this.vil,
    this.shop,
  });

  TextEditingController? nameController;

  TextEditingController? sizeController;

  TextEditingController? sizeoneController;

  TextEditingController? areaController;

  TextEditingController? sizeLandLeasedController;

  TextEditingController? sizeLandIdleController;

  SelectionPopupModel? selectedDropDownValue;

  PrimaryFarmHoldingOneModel? primaryFarmHoldingOneModelObj;

  TextEditingController? shop;

  TextEditingController? vil;
  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;
  @override
  List<Object?> get props => [
        nameController,
        sizeController,
        sizeoneController,
        areaController,
        sizeLandLeasedController,
        sizeLandIdleController,
        selectedDropDownValue,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        vil,
        shop,
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
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    PrimaryFarmHoldingOneModel? primaryFarmHoldingOneModelObj,
    TextEditingController? shop,
    TextEditingController? vil,
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
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      selectedDropDownValue3:
          selectedDropDownValue3 ?? this.selectedDropDownValue3,
      selectedDropDownValue4:
          selectedDropDownValue4 ?? this.selectedDropDownValue4,
      shop: shop ?? this.shop,
      vil: vil ?? this.vil,
    );
  }
}
