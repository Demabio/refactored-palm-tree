// ignore_for_file: must_be_immutable

part of 'otp_one_bloc.dart';

/// Represents the state of OtpOne in the application.
class OtpOneState extends Equatable {
  OtpOneState({
    this.otpController,
    this.otpOneModelObj,
    this.phoneNumber,
  });

  TextEditingController? otpController;

  OtpOneModel? otpOneModelObj;

  String? phoneNumber;

  @override
  List<Object?> get props => [
        otpController,
        otpOneModelObj,
        phoneNumber,
      ];
  OtpOneState copyWith(
      {TextEditingController? otpController,
      OtpOneModel? otpOneModelObj,
      String? phoneNumber}) {
    return OtpOneState(
      otpController: otpController ?? this.otpController,
      otpOneModelObj: otpOneModelObj ?? this.otpOneModelObj,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
