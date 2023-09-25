// ignore_for_file: must_be_immutable

part of 'add_financialandservices_five_bloc.dart';

/// Represents the state of AddFinancialandservicesFive in the application.
class AddFinancialandservicesFiveState extends Equatable {
  AddFinancialandservicesFiveState({
    this.balancehistoryController,
    this.balancehistoryController1,
    this.farmerorganizatController,
    this.selectedDropDownValue,
    this.commercialBank = false,
    this.businessPartner = false,
    this.otherMoneyLende = false,
    this.trashtwo = false,
    this.selfSalaryOrSav = false,
    this.coorperativesva = false,
    this.trashthree = false,
    this.trashfour = false,
    this.trashfive = false,
    this.trashsix = false,
    this.farmerOrganizat = false,
    this.addFinancialandservicesFiveModelObj,
  });

  TextEditingController? balancehistoryController;

  TextEditingController? balancehistoryController1;

  TextEditingController? farmerorganizatController;

  SelectionPopupModel? selectedDropDownValue;

  AddFinancialandservicesFiveModel? addFinancialandservicesFiveModelObj;

  bool commercialBank;

  bool businessPartner;

  bool otherMoneyLende;

  bool trashtwo;

  bool selfSalaryOrSav;

  bool coorperativesva;

  bool trashthree;

  bool trashfour;

  bool trashfive;

  bool trashsix;

  bool farmerOrganizat;

  @override
  List<Object?> get props => [
        balancehistoryController,
        balancehistoryController1,
        farmerorganizatController,
        selectedDropDownValue,
        commercialBank,
        businessPartner,
        otherMoneyLende,
        trashtwo,
        selfSalaryOrSav,
        coorperativesva,
        trashthree,
        trashfour,
        trashfive,
        trashsix,
        farmerOrganizat,
        addFinancialandservicesFiveModelObj,
      ];
  AddFinancialandservicesFiveState copyWith({
    TextEditingController? balancehistoryController,
    TextEditingController? balancehistoryController1,
    TextEditingController? farmerorganizatController,
    SelectionPopupModel? selectedDropDownValue,
    bool? commercialBank,
    bool? businessPartner,
    bool? otherMoneyLende,
    bool? trashtwo,
    bool? selfSalaryOrSav,
    bool? coorperativesva,
    bool? trashthree,
    bool? trashfour,
    bool? trashfive,
    bool? trashsix,
    bool? farmerOrganizat,
    AddFinancialandservicesFiveModel? addFinancialandservicesFiveModelObj,
  }) {
    return AddFinancialandservicesFiveState(
      balancehistoryController:
          balancehistoryController ?? this.balancehistoryController,
      balancehistoryController1:
          balancehistoryController1 ?? this.balancehistoryController1,
      farmerorganizatController:
          farmerorganizatController ?? this.farmerorganizatController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      commercialBank: commercialBank ?? this.commercialBank,
      businessPartner: businessPartner ?? this.businessPartner,
      otherMoneyLende: otherMoneyLende ?? this.otherMoneyLende,
      trashtwo: trashtwo ?? this.trashtwo,
      selfSalaryOrSav: selfSalaryOrSav ?? this.selfSalaryOrSav,
      coorperativesva: coorperativesva ?? this.coorperativesva,
      trashthree: trashthree ?? this.trashthree,
      trashfour: trashfour ?? this.trashfour,
      trashfive: trashfive ?? this.trashfive,
      trashsix: trashsix ?? this.trashsix,
      farmerOrganizat: farmerOrganizat ?? this.farmerOrganizat,
      addFinancialandservicesFiveModelObj:
          addFinancialandservicesFiveModelObj ??
              this.addFinancialandservicesFiveModelObj,
    );
  }
}
