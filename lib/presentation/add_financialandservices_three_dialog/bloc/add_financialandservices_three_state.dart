// ignore_for_file: must_be_immutable

part of 'add_financialandservices_three_bloc.dart';

/// Represents the state of AddFinancialandservicesThree in the application.
class AddFinancialandservicesThreeState extends Equatable {
  AddFinancialandservicesThreeState({
    this.trash = false,
    this.nonFarmTrading = false,
    this.trashone = false,
    this.trashtwo = false,
    this.remittancesvalu = false,
    this.pensionvalue = false,
    this.otherIncomeSour = false,
    this.cashTransfer = false,
    this.addFinancialandservicesThreeModelObj,
  });

  AddFinancialandservicesThreeModel? addFinancialandservicesThreeModelObj;

  bool trash;

  bool nonFarmTrading;

  bool trashone;

  bool trashtwo;

  bool remittancesvalu;

  bool pensionvalue;

  bool otherIncomeSour;

  bool cashTransfer;

  @override
  List<Object?> get props => [
        trash,
        nonFarmTrading,
        trashone,
        trashtwo,
        remittancesvalu,
        pensionvalue,
        otherIncomeSour,
        cashTransfer,
        addFinancialandservicesThreeModelObj,
      ];
  AddFinancialandservicesThreeState copyWith({
    bool? trash,
    bool? nonFarmTrading,
    bool? trashone,
    bool? trashtwo,
    bool? remittancesvalu,
    bool? pensionvalue,
    bool? otherIncomeSour,
    bool? cashTransfer,
    AddFinancialandservicesThreeModel? addFinancialandservicesThreeModelObj,
  }) {
    return AddFinancialandservicesThreeState(
      trash: trash ?? this.trash,
      nonFarmTrading: nonFarmTrading ?? this.nonFarmTrading,
      trashone: trashone ?? this.trashone,
      trashtwo: trashtwo ?? this.trashtwo,
      remittancesvalu: remittancesvalu ?? this.remittancesvalu,
      pensionvalue: pensionvalue ?? this.pensionvalue,
      otherIncomeSour: otherIncomeSour ?? this.otherIncomeSour,
      cashTransfer: cashTransfer ?? this.cashTransfer,
      addFinancialandservicesThreeModelObj:
          addFinancialandservicesThreeModelObj ??
              this.addFinancialandservicesThreeModelObj,
    );
  }
}
