import 'dart:async';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kiamis_app/data/repository/repository.dart';
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
    on<CreateLoginEvent>(_confirmOTP);
    on<ResendOTPEvent>(_sendOTP);
  }
  final _repository = Repository();

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

    String enumeratormobile = claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobilephone'];

    final updateState = state.copyWith(phoneNumber: enumeratormobile);
    emit(updateState);
  }

  FutureOr<void> _confirmOTP(
    CreateLoginEvent event,
    Emitter<OtpOneState> emit,
  ) async {
    await _repository.confirmOTP(
      headers: {
        //'RiderID': PrefUtils().getRiderID().toString(),
        'Content-type': 'application/json',
      },
      requestData: {
        'Username': PrefUtils().getUsernameOTP(),
        'OTP': state.otpController!.text,
      },
    ).then((value) async {
      if (value.statusCode == 200) {
        DateTime now = DateTime.now();

// Set the time to tomorrow at 6 am
        DateTime tomorrow6AM =
            DateTime(now.year, now.month, now.day + 1, 6, 0, 0);

// Format the DateTime to a string
        String formattedTomorrow6AM =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(tomorrow6AM);

// Set the formatted string to your PrefUtils
        PrefUtils().setTomorrow(formattedTomorrow6AM);
        event.onCreateLoginEventSuccess?.call();
      } else if (value.statusCode == 401) {
        event.onCreateLoginFailed?.call();
      } else if (value.statusCode == 408) {
        event.timeout?.call();
      } else if (value.statusCode == 503 || value.statusCode == 502) {
        event.onServiceUnavailable?.call();
      } else if (value.statusCode == 000) {
        event.noInternet?.call();
      } else {
        event.onCreateLoginEventError?.call();
      }
    }).onError((error, stackTrace) {
      event.onCreateLoginEventError?.call();
    });
  }

  FutureOr<void> _sendOTP(
    ResendOTPEvent event,
    Emitter<OtpOneState> emit,
  ) async {
    await _repository.sendotp(
      headers: {
        //'RiderID': PrefUtils().getRiderID().toString(),
        'Content-type': 'application/json',
      },
      requestData: {
        'Username': PrefUtils().getUsernameOTP(),
      },
    ).then((value) async {
      if (value.statusCode == 200) {
        return;
      } else if (value.statusCode == 401) {
        event.onCreateLoginFailed?.call();
      } else if (value.statusCode == 408) {
        event.timeout?.call();
      } else if (value.statusCode == 503 || value.statusCode == 502) {
        event.onServiceUnavailable?.call();
      } else if (value.statusCode == 000) {
        event.noInternet?.call();
      } else {
        event.onCreateLoginEventError?.call();
      }
    }).onError((error, stackTrace) {
      event.onCreateLoginEventError?.call();
    });
  }
}
