// ignore_for_file: must_be_immutable

part of 'add_farm_holding_one_bloc.dart';

/// Represents the state of AddFarmHoldingOne in the application.
class AddFarmHoldingOneState extends Equatable {
  AddFarmHoldingOneState({
    this.nameController,
    this.sizeController,
    this.sizeoneController,
    this.areaController,
    this.sizetwoController,
    this.sizethreeController,
    this.selectedDropDownValue,
    this.addFarmHoldingOneModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? sizeController;

  TextEditingController? sizeoneController;

  TextEditingController? areaController;

  TextEditingController? sizetwoController;

  TextEditingController? sizethreeController;

  SelectionPopupModel? selectedDropDownValue;

  AddFarmHoldingOneModel? addFarmHoldingOneModelObj;

  @override
  List<Object?> get props => [
        nameController,
        sizeController,
        sizeoneController,
        areaController,
        sizetwoController,
        sizethreeController,
        selectedDropDownValue,
        addFarmHoldingOneModelObj,
      ];
  AddFarmHoldingOneState copyWith({
    TextEditingController? nameController,
    TextEditingController? sizeController,
    TextEditingController? sizeoneController,
    TextEditingController? areaController,
    TextEditingController? sizetwoController,
    TextEditingController? sizethreeController,
    SelectionPopupModel? selectedDropDownValue,
    AddFarmHoldingOneModel? addFarmHoldingOneModelObj,
  }) {
    return AddFarmHoldingOneState(
      nameController: nameController ?? this.nameController,
      sizeController: sizeController ?? this.sizeController,
      sizeoneController: sizeoneController ?? this.sizeoneController,
      areaController: areaController ?? this.areaController,
      sizetwoController: sizetwoController ?? this.sizetwoController,
      sizethreeController: sizethreeController ?? this.sizethreeController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      addFarmHoldingOneModelObj:
          addFarmHoldingOneModelObj ?? this.addFarmHoldingOneModelObj,
    );
  }
}
