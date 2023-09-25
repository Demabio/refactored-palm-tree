// ignore_for_file: must_be_immutable

part of 'add_financialandservices_four_bloc.dart';

/// Represents the state of AddFinancialandservicesFour in the application.
class AddFinancialandservicesFourState extends Equatable {
  AddFinancialandservicesFourState({
    this.balancehistoryController,
    this.balancehistoryController1,
    this.balancehistoryController2,
    this.balancehistoryController3,
    this.balancehistoryController4,
    this.balancehistoryController5,
    this.selectedDropDownValue,
    this.trash = false,
    this.trashone = false,
    this.trashtwo = false,
    this.trashthree = false,
    this.trashfour = false,
    this.trashfive = false,
    this.addFinancialandservicesFourModelObj,
  });

  TextEditingController? balancehistoryController;

  TextEditingController? balancehistoryController1;

  TextEditingController? balancehistoryController2;

  TextEditingController? balancehistoryController3;

  TextEditingController? balancehistoryController4;

  TextEditingController? balancehistoryController5;

  SelectionPopupModel? selectedDropDownValue;

  AddFinancialandservicesFourModel? addFinancialandservicesFourModelObj;

  bool trash;

  bool trashone;

  bool trashtwo;

  bool trashthree;

  bool trashfour;

  bool trashfive;

  @override
  List<Object?> get props => [
        balancehistoryController,
        balancehistoryController1,
        balancehistoryController2,
        balancehistoryController3,
        balancehistoryController4,
        balancehistoryController5,
        selectedDropDownValue,
        trash,
        trashone,
        trashtwo,
        trashthree,
        trashfour,
        trashfive,
        addFinancialandservicesFourModelObj,
      ];
  AddFinancialandservicesFourState copyWith({
    TextEditingController? balancehistoryController,
    TextEditingController? balancehistoryController1,
    TextEditingController? balancehistoryController2,
    TextEditingController? balancehistoryController3,
    TextEditingController? balancehistoryController4,
    TextEditingController? balancehistoryController5,
    SelectionPopupModel? selectedDropDownValue,
    bool? trash,
    bool? trashone,
    bool? trashtwo,
    bool? trashthree,
    bool? trashfour,
    bool? trashfive,
    AddFinancialandservicesFourModel? addFinancialandservicesFourModelObj,
  }) {
    return AddFinancialandservicesFourState(
      balancehistoryController:
          balancehistoryController ?? this.balancehistoryController,
      balancehistoryController1:
          balancehistoryController1 ?? this.balancehistoryController1,
      balancehistoryController2:
          balancehistoryController2 ?? this.balancehistoryController2,
      balancehistoryController3:
          balancehistoryController3 ?? this.balancehistoryController3,
      balancehistoryController4:
          balancehistoryController4 ?? this.balancehistoryController4,
      balancehistoryController5:
          balancehistoryController5 ?? this.balancehistoryController5,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      trash: trash ?? this.trash,
      trashone: trashone ?? this.trashone,
      trashtwo: trashtwo ?? this.trashtwo,
      trashthree: trashthree ?? this.trashthree,
      trashfour: trashfour ?? this.trashfour,
      trashfive: trashfive ?? this.trashfive,
      addFinancialandservicesFourModelObj:
          addFinancialandservicesFourModelObj ??
              this.addFinancialandservicesFourModelObj,
    );
  }
}
