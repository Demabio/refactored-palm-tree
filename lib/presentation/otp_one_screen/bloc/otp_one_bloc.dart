import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/otp_one_screen/models/otp_one_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'otp_one_event.dart';
part 'otp_one_state.dart';

/// A bloc that manages the state of a OtpOne according to the event that is dispatched to it.
class OtpOneBloc extends Bloc<OtpOneEvent, OtpOneState> with CodeAutoFill {
  OtpOneBloc(OtpOneState initialState) : super(initialState) {
    on<OtpOneInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
    on<OtpDeconstruction>(_processOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<OtpOneState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  _onInitialize(
    OtpOneInitialEvent event,
    Emitter<OtpOneState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
    add(OtpDeconstruction());
  }

  _processOTP(
    OtpDeconstruction event,
    Emitter<OtpOneState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    print(claims.payload);
    print(claims.payload['mobilephone']);
    print(claims.payload['IDNo']);
    print(claims.payload['Username']);
    String phone = claims.payload['mobilephone'];

    final updateState = state.copyWith(phoneNumber: phone);
    emit(updateState);
  }
}
