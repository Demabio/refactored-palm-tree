// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_six_bloc.dart';

/// Represents the state of AddLandandwatermgmtSix in the application.
class AddLandandwatermgmtSixState extends Equatable {
  AddLandandwatermgmtSixState({
    this.continueController,
    this.balancehistoryController,
    this.arrowdownController,
    this.balancehistoryController1,
    this.arrowdownoneController,
    this.schemevalueController,
    this.arrowdowntwoController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.trash = false,
    this.communityScheme = false,
    this.trashone = false,
    this.addLandandwatermgmtSixModelObj,
  });

  TextEditingController? continueController;

  TextEditingController? balancehistoryController;

  TextEditingController? arrowdownController;

  TextEditingController? balancehistoryController1;

  TextEditingController? arrowdownoneController;

  TextEditingController? schemevalueController;

  TextEditingController? arrowdowntwoController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  AddLandandwatermgmtSixModel? addLandandwatermgmtSixModelObj;

  bool trash;

  bool communityScheme;

  bool trashone;

  @override
  List<Object?> get props => [
        continueController,
        balancehistoryController,
        arrowdownController,
        balancehistoryController1,
        arrowdownoneController,
        schemevalueController,
        arrowdowntwoController,
        selectedDropDownValue,
        selectedDropDownValue1,
        trash,
        communityScheme,
        trashone,
        addLandandwatermgmtSixModelObj,
      ];
  AddLandandwatermgmtSixState copyWith({
    TextEditingController? continueController,
    TextEditingController? balancehistoryController,
    TextEditingController? arrowdownController,
    TextEditingController? balancehistoryController1,
    TextEditingController? arrowdownoneController,
    TextEditingController? schemevalueController,
    TextEditingController? arrowdowntwoController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    bool? trash,
    bool? communityScheme,
    bool? trashone,
    AddLandandwatermgmtSixModel? addLandandwatermgmtSixModelObj,
  }) {
    return AddLandandwatermgmtSixState(
      continueController: continueController ?? this.continueController,
      balancehistoryController:
          balancehistoryController ?? this.balancehistoryController,
      arrowdownController: arrowdownController ?? this.arrowdownController,
      balancehistoryController1:
          balancehistoryController1 ?? this.balancehistoryController1,
      arrowdownoneController:
          arrowdownoneController ?? this.arrowdownoneController,
      schemevalueController:
          schemevalueController ?? this.schemevalueController,
      arrowdowntwoController:
          arrowdowntwoController ?? this.arrowdowntwoController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      trash: trash ?? this.trash,
      communityScheme: communityScheme ?? this.communityScheme,
      trashone: trashone ?? this.trashone,
      addLandandwatermgmtSixModelObj:
          addLandandwatermgmtSixModelObj ?? this.addLandandwatermgmtSixModelObj,
    );
  }
}
