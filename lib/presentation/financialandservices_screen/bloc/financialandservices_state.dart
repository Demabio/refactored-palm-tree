// ignore_for_file: must_be_immutable

part of 'financialandservices_bloc.dart';

/// Represents the state of Financialandservices in the application.
class FinancialandservicesState extends Equatable {
  FinancialandservicesState({this.financialandservicesModelObj});

  FinancialandservicesModel? financialandservicesModelObj;

  @override
  List<Object?> get props => [
        financialandservicesModelObj,
      ];
  FinancialandservicesState copyWith(
      {FinancialandservicesModel? financialandservicesModelObj}) {
    return FinancialandservicesState(
      financialandservicesModelObj:
          financialandservicesModelObj ?? this.financialandservicesModelObj,
    );
  }
}
