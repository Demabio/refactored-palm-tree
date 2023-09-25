// ignore_for_file: must_be_immutable

part of 'add_financialandservices_seven_bloc.dart';

/// Represents the state of AddFinancialandservicesSeven in the application.
class AddFinancialandservicesSevenState extends Equatable {
  AddFinancialandservicesSevenState({
    this.nationalGovernm = false,
    this.countyGovernmen = false,
    this.ngovalue = false,
    this.privatevalue = false,
    this.othervalue = false,
    this.televisionvalue = false,
    this.relativesvalue = false,
    this.addFinancialandservicesSevenModelObj,
  });

  AddFinancialandservicesSevenModel? addFinancialandservicesSevenModelObj;

  bool nationalGovernm;

  bool countyGovernmen;

  bool ngovalue;

  bool privatevalue;

  bool othervalue;

  bool televisionvalue;

  bool relativesvalue;

  @override
  List<Object?> get props => [
        nationalGovernm,
        countyGovernmen,
        ngovalue,
        privatevalue,
        othervalue,
        televisionvalue,
        relativesvalue,
        addFinancialandservicesSevenModelObj,
      ];
  AddFinancialandservicesSevenState copyWith({
    bool? nationalGovernm,
    bool? countyGovernmen,
    bool? ngovalue,
    bool? privatevalue,
    bool? othervalue,
    bool? televisionvalue,
    bool? relativesvalue,
    AddFinancialandservicesSevenModel? addFinancialandservicesSevenModelObj,
  }) {
    return AddFinancialandservicesSevenState(
      nationalGovernm: nationalGovernm ?? this.nationalGovernm,
      countyGovernmen: countyGovernmen ?? this.countyGovernmen,
      ngovalue: ngovalue ?? this.ngovalue,
      privatevalue: privatevalue ?? this.privatevalue,
      othervalue: othervalue ?? this.othervalue,
      televisionvalue: televisionvalue ?? this.televisionvalue,
      relativesvalue: relativesvalue ?? this.relativesvalue,
      addFinancialandservicesSevenModelObj:
          addFinancialandservicesSevenModelObj ??
              this.addFinancialandservicesSevenModelObj,
    );
  }
}
