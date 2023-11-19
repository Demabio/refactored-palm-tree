import 'dart:async';

import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/dynamic_dialog_2.dart';

import 'bloc/otp_one_bloc.dart';
import 'models/otp_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_pin_code_text_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class OtpOneScreen extends StatefulWidget {
  OtpOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OtpOneBloc>(
        create: (context) =>
            OtpOneBloc(OtpOneState(otpOneModelObj: OtpOneModel()))
              ..add(OtpOneInitialEvent()),
        child: OtpOneScreen());
  }

  @override
  State<OtpOneScreen> createState() => _OtpOneScreenState();

  static closedialog(BuildContext context, String label, String body) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: DynamicDialogTwo.builder(context, label, body),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}

class _OtpOneScreenState extends State<OtpOneScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _secondsRemaining = 60;
  bool _isTimerRunning = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _isTimerRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _isTimerRunning = false;
          _timer.cancel();
        }
      });
    });
  }

  void resendOTP() {
    // TODO: Implement logic to resend OTP
    // For now, let's reset the timer to 60 seconds
    setState(() {
      _secondsRemaining = 60;
    });
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<OtpOneBloc, OtpOneState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    padding: Device.orientation == Orientation.portrait
                        ? EdgeInsets.only(
                            left: DeviceExt(3).h, right: DeviceExt(3).h)
                        : EdgeInsets.only(
                            left: DeviceExt(3).w, right: DeviceExt(3).w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgSort,
                            height: Device.orientation == Orientation.portrait
                                ? DeviceExt(5).h
                                : 5.w,
                            width: Device.orientation == Orientation.portrait
                                ? DeviceExt(5).h
                                : 5.w,
                            onTap: () {
                              onTapImgSortone(context);
                            }),
                        if (Device.orientation == Orientation.portrait)
                          Padding(
                              padding: Device.screenType == ScreenType.mobile
                                  ? EdgeInsets.only(left: 20.w)
                                  : EdgeInsets.only(left: 30.w),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgImage2,
                                    height: DeviceExt(8.4).h,
                                    width: DeviceExt(8.4).h),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceExt(0.2).h,
                                        top: 2.4.w,
                                        bottom: 2.7.w),
                                    child: Text("lbl_kiamis".tr,
                                        style: theme.textTheme.headlineLarge
                                            ?.copyWith(
                                                fontSize: DeviceExt(4).h)))
                              ])),
                        if (Device.orientation == Orientation.landscape)
                          Padding(
                              padding: Device.screenType == ScreenType.mobile
                                  ? EdgeInsets.only(left: DeviceExt(35).w)
                                  : EdgeInsets.only(left: DeviceExt(35).w),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgImage2,
                                    height: DeviceExt(8.4).w,
                                    width: DeviceExt(8.4).w),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: DeviceExt(0.2).w,
                                        top: DeviceExt(2.4).h,
                                        bottom: DeviceExt(2.7).h),
                                    child: Text("lbl_kiamis".tr,
                                        style: theme.textTheme.headlineLarge
                                            ?.copyWith(fontSize: 4.w)))
                              ])),
                        SizedBox(
                            height: Device.orientation == Orientation.portrait
                                ? DeviceExt(10).h
                                : DeviceExt(10).w),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "lbl_enter_otp".tr,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontSize:
                                  Device.orientation == Orientation.portrait
                                      ? DeviceExt(2.5).h
                                      : DeviceExt(3).w,
                            ),
                          ),
                        ),
                        SizedBox(height: 13.v),
                        Text(
                          "Code has been sent to ${state.phoneNumber}",
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontSize: Device.orientation == Orientation.portrait
                                ? DeviceExt(1.8).h
                                : DeviceExt(2).w,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                            height: Device.orientation == Orientation.portrait
                                ? DeviceExt(5).h
                                : DeviceExt(5).w),
                        BlocSelector<OtpOneBloc, OtpOneState,
                                TextEditingController?>(
                            selector: (state) => state.otpController,
                            builder: (context, otpController) {
                              return CustomPinCodeTextField(
                                  context: context,
                                  controller: otpController,
                                  textStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  hintStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  onChanged: (value) {
                                    otpController?.text = value;
                                  });
                            }),
                        SizedBox(
                            height: Device.orientation == Orientation.portrait
                                ? DeviceExt(5).h
                                : DeviceExt(5).w),
                        Align(
                            alignment: Alignment.center,
                            child: Text("Resend OTP in $_secondsRemaining".tr,
                                style: theme.textTheme.titleMedium)),
                        SizedBox(height: ResponsiveExtension(3).h),
                        CustomElevatedButton(
                            text: "lbl_continue".tr,
                            height: Device.orientation == Orientation.portrait
                                ? DeviceExt(6).h
                                : 8.w,
                            // width:
                            //     Device.orientation == Orientation.portrait
                            //         ? DeviceExt(50).h
                            //         : 50.w,
                            buttonTextStyle:
                                theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontSize:
                                  Device.orientation == Orientation.portrait
                                      ? DeviceExt(2).h
                                      : DeviceExt(2.5).w,
                            ),
                            margin: Device.orientation == Orientation.portrait
                                ? EdgeInsets.fromLTRB(DeviceExt(0.36).h, 6.w,
                                    DeviceExt(0.2).h, 1.2.w)
                                : EdgeInsets.fromLTRB(
                                    DeviceExt(0.36).w,
                                    DeviceExt(6).h,
                                    DeviceExt(0.2).w,
                                    DeviceExt(1.2).h),
                            onTap: () {
                              confirmOTP(context);
                            }),
                        SizedBox(height: ResponsiveExtension(5).h),
                        Visibility(
                          visible: !_isTimerRunning,
                          child: CustomElevatedButton(
                              text: "Resend OTP".tr,
                              height: Device.orientation == Orientation.portrait
                                  ? DeviceExt(6).h
                                  : 8.w,
                              // width:
                              //     Device.orientation == Orientation.portrait
                              //         ? DeviceExt(50).h
                              //         : 50.w,
                              buttonTextStyle:
                                  theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                              ),
                              margin: Device.orientation == Orientation.portrait
                                  ? EdgeInsets.fromLTRB(DeviceExt(0.36).h, 6.w,
                                      DeviceExt(0.2).h, 1.2.w)
                                  : EdgeInsets.fromLTRB(
                                      DeviceExt(0.36).w,
                                      DeviceExt(6).h,
                                      DeviceExt(0.2).w,
                                      DeviceExt(1.2).h),
                              onTap: () {
                                sendOTP(context);
                                resendOTP();
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              )));
    });
  }

  confirmOTP(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<OtpOneBloc>().add(
            CreateLoginEvent(
              onCreateLoginEventSuccess: () {
                onTapContinue(context);
              },
              onCreateLoginFailed: () {
                _onLoginUserServicePostEventError(context);
              },
              onCreateLoginEventError: () {
                OtpOneScreen.closedialog(context, "Server Error",
                    "Kindly contact the administrator");
              },
              timeout: () => OtpOneScreen.closedialog(
                  context,
                  "Internet Connection",
                  "Kindly check your internet connection"),
              onServiceUnavailable: () => OtpOneScreen.closedialog(context,
                  "Service Unavailable", "Kindly contact the administrator"),
              noInternet: () => OtpOneScreen.closedialog(
                  context,
                  "No Internet Connection",
                  "Kindly check your internet connection"),
            ),
          );
    }
  }

  sendOTP(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<OtpOneBloc>().add(
            ResendOTPEvent(
              onCreateLoginEventError: () {
                OtpOneScreen.closedialog(context, "Server Error",
                    "Kindly contact the administrator");
              },
              timeout: () => OtpOneScreen.closedialog(
                  context,
                  "Internet Connection",
                  "Kindly check your internet connection"),
              onServiceUnavailable: () => OtpOneScreen.closedialog(context,
                  "Service Unavailable", "Kindly contact the administrator"),
              noInternet: () => OtpOneScreen.closedialog(
                  context,
                  "No Internet Connection",
                  "Kindly check your internet connection"),
            ),
          );
    }
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapImgSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the homeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the homeScreen.
  onTapContinue(BuildContext context) {
    PrefUtils().getFP()
        ? NavigatorService.popAndPushNamed(
            AppRoutes.forgotPasswordScreen,
          )
        : NavigatorService.popAndPushNamed(
            AppRoutes.homeScreen,
          );
  }

  void _onLoginUserServicePostEventError(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                'Failed Verification',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: Device.orientation == Orientation.portrait
                      ? DeviceExt(2.5).h
                      : DeviceExt(3).w,
                ),
              ),
              content: Text(
                'Invalid OTP',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: Device.orientation == Orientation.portrait
                      ? DeviceExt(2.5).h
                      : DeviceExt(3).w,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              actions: [
                CustomElevatedButton(
                    text: "OK".tr,
                    height: Device.orientation == Orientation.portrait
                        ? DeviceExt(6).h
                        : 8.w,
                    // width:
                    //     Device.orientation == Orientation.portrait
                    //         ? DeviceExt(50).h
                    //         : 50.w,
                    buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(2).h
                          : DeviceExt(2.5).w,
                    ),
                    margin: Device.orientation == Orientation.portrait
                        ? EdgeInsets.fromLTRB(
                            DeviceExt(0.36).h, 6.w, DeviceExt(0.2).h, 1.2.w)
                        : EdgeInsets.fromLTRB(DeviceExt(0.36).w, DeviceExt(6).h,
                            DeviceExt(0.2).w, DeviceExt(1.2).h),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ));
  }
}
