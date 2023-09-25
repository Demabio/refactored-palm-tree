// ignore_for_file: must_be_immutable

part of 'accounts_bloc.dart';

/// Represents the state of Accounts in the application.
class AccountsState extends Equatable {
  AccountsState({
    this.searchController,
    this.accountsModelObj,
  });

  TextEditingController? searchController;

  AccountsModel? accountsModelObj;

  @override
  List<Object?> get props => [
        searchController,
        accountsModelObj,
      ];
  AccountsState copyWith({
    TextEditingController? searchController,
    AccountsModel? accountsModelObj,
  }) {
    return AccountsState(
      searchController: searchController ?? this.searchController,
      accountsModelObj: accountsModelObj ?? this.accountsModelObj,
    );
  }
}
