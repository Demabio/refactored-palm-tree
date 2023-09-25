import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userbalance_item_model.dart';
import 'package:kiamis_app/presentation/accounts_screen/models/accounts_model.dart';
part 'accounts_event.dart';
part 'accounts_state.dart';

/// A bloc that manages the state of a Accounts according to the event that is dispatched to it.
class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc(AccountsState initialState) : super(initialState) {
    on<AccountsInitialEvent>(_onInitialize);
  }

  List<UserbalanceItemModel> fillUserbalanceItemList() {
    return List.generate(4, (index) => UserbalanceItemModel());
  }

  _onInitialize(
    AccountsInitialEvent event,
    Emitter<AccountsState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        accountsModelObj: state.accountsModelObj?.copyWith(
      userbalanceItemList: fillUserbalanceItemList(),
    )));
  }
}
