// ignore_for_file: must_be_immutable

part of 'add_financialandservices_six_bloc.dart';

/// Represents the state of AddFinancialandservicesSix in the application.
class AddFinancialandservicesSixState extends Equatable {
  AddFinancialandservicesSixState({
    this.publicGathering = false,
    this.radiovalue = false,
    this.trash = false,
    this.internetvalue = false,
    this.extensionMeetin = false,
    this.addFinancialandservicesSixModelObj,
  });

  AddFinancialandservicesSixModel? addFinancialandservicesSixModelObj;

  bool publicGathering;

  bool radiovalue;

  bool trash;

  bool internetvalue;

  bool extensionMeetin;

  @override
  List<Object?> get props => [
        publicGathering,
        radiovalue,
        trash,
        internetvalue,
        extensionMeetin,
        addFinancialandservicesSixModelObj,
      ];
  AddFinancialandservicesSixState copyWith({
    bool? publicGathering,
    bool? radiovalue,
    bool? trash,
    bool? internetvalue,
    bool? extensionMeetin,
    AddFinancialandservicesSixModel? addFinancialandservicesSixModelObj,
  }) {
    return AddFinancialandservicesSixState(
      publicGathering: publicGathering ?? this.publicGathering,
      radiovalue: radiovalue ?? this.radiovalue,
      trash: trash ?? this.trash,
      internetvalue: internetvalue ?? this.internetvalue,
      extensionMeetin: extensionMeetin ?? this.extensionMeetin,
      addFinancialandservicesSixModelObj: addFinancialandservicesSixModelObj ??
          this.addFinancialandservicesSixModelObj,
    );
  }
}
