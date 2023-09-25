import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/profile_my_item_model.dart';
import 'package:kiamis_app/presentation/profile_my_orders_page/models/profile_my_orders_model.dart';
part 'profile_my_orders_event.dart';
part 'profile_my_orders_state.dart';

/// A bloc that manages the state of a ProfileMyOrders according to the event that is dispatched to it.
class ProfileMyOrdersBloc
    extends Bloc<ProfileMyOrdersEvent, ProfileMyOrdersState> {
  ProfileMyOrdersBloc(ProfileMyOrdersState initialState) : super(initialState) {
    on<ProfileMyOrdersInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileMyOrdersInitialEvent event,
    Emitter<ProfileMyOrdersState> emit,
  ) async {
    emit(state.copyWith(
        profileMyOrdersModelObj: state.profileMyOrdersModelObj?.copyWith(
      profileMyItemList: fillProfileMyItemList(),
    )));
  }

  List<ProfileMyItemModel> fillProfileMyItemList() {
    return List.generate(2, (index) => ProfileMyItemModel());
  }
}
