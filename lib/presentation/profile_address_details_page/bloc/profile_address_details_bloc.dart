import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/profile_address_details_page/models/profile_address_details_model.dart';
part 'profile_address_details_event.dart';
part 'profile_address_details_state.dart';

/// A bloc that manages the state of a ProfileAddressDetails according to the event that is dispatched to it.
class ProfileAddressDetailsBloc
    extends Bloc<ProfileAddressDetailsEvent, ProfileAddressDetailsState> {
  ProfileAddressDetailsBloc(ProfileAddressDetailsState initialState)
      : super(initialState) {
    on<ProfileAddressDetailsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileAddressDetailsInitialEvent event,
    Emitter<ProfileAddressDetailsState> emit,
  ) async {
    emit(state.copyWith(
      addressController: TextEditingController(),
      addressController1: TextEditingController(),
      cityController: TextEditingController(),
      enterpostalController: TextEditingController(),
      phoneNumberController: TextEditingController(),
    ));
  }
}
