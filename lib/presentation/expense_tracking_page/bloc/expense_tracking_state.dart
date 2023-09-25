// ignore_for_file: must_be_immutable

part of 'expense_tracking_bloc.dart';

/// Represents the state of ExpenseTracking in the application.
class ExpenseTrackingState extends Equatable {
  ExpenseTrackingState({this.expenseTrackingModelObj});

  ExpenseTrackingModel? expenseTrackingModelObj;

  @override
  List<Object?> get props => [
        expenseTrackingModelObj,
      ];
  ExpenseTrackingState copyWith(
      {ExpenseTrackingModel? expenseTrackingModelObj}) {
    return ExpenseTrackingState(
      expenseTrackingModelObj:
          expenseTrackingModelObj ?? this.expenseTrackingModelObj,
    );
  }
}
