// ignore_for_file: must_be_immutable

part of 'transfer_amount_bloc.dart';

/// Represents the state of TransferAmount in the application.
class TransferAmountState extends Equatable {
  TransferAmountState({this.transferAmountModelObj});

  TransferAmountModel? transferAmountModelObj;

  @override
  List<Object?> get props => [
        transferAmountModelObj,
      ];
  TransferAmountState copyWith({TransferAmountModel? transferAmountModelObj}) {
    return TransferAmountState(
      transferAmountModelObj:
          transferAmountModelObj ?? this.transferAmountModelObj,
    );
  }
}
