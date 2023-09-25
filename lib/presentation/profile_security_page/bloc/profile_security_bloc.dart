import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/profile_security_page/models/profile_security_model.dart';
part 'profile_security_event.dart';
part 'profile_security_state.dart';

/// A bloc that manages the state of a ProfileSecurity according to the event that is dispatched to it.
class ProfileSecurityBloc
    extends Bloc<ProfileSecurityEvent, ProfileSecurityState> {
  ProfileSecurityBloc(ProfileSecurityState initialState) : super(initialState) {
    on<ProfileSecurityInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileSecurityInitialEvent event,
    Emitter<ProfileSecurityState> emit,
  ) async {
    emit(state.copyWith(
      passwordController: TextEditingController(),
      newpasswordController: TextEditingController(),
    ));
  }
}
