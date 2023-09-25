// ignore_for_file: must_be_immutable

part of 'expense_tracking_tab_container_bloc.dart';

/// Represents the state of ExpenseTrackingTabContainer in the application.
class ExpenseTrackingTabContainerState extends Equatable {
  ExpenseTrackingTabContainerState({this.expenseTrackingTabContainerModelObj});

  ExpenseTrackingTabContainerModel? expenseTrackingTabContainerModelObj;

  @override
  List<Object?> get props => [
        expenseTrackingTabContainerModelObj,
      ];
  ExpenseTrackingTabContainerState copyWith(
      {ExpenseTrackingTabContainerModel? expenseTrackingTabContainerModelObj}) {
    return ExpenseTrackingTabContainerState(
      expenseTrackingTabContainerModelObj:
          expenseTrackingTabContainerModelObj ??
              this.expenseTrackingTabContainerModelObj,
    );
  }
}
