import 'bloc/otp_one_bloc.dart';
import 'models/otp_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_pin_code_text_field.dart';

// ignore: must_be_immutable
class OtpOneScreen extends StatelessWidget {
  OtpOneScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<OtpOneBloc>(
        create: (context) =>
            OtpOneBloc(OtpOneState(otpOneModelObj: OtpOneModel()))
              ..add(OtpOneInitialEvent()),
        child: OtpOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<OtpOneBloc, OtpOneState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 3.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgSort,
                              height: 44.adaptSize,
                              width: 44.adaptSize,
                              onTap: () {
                                onTapImgSortone(context);
                              }),
                          Padding(
                              padding: EdgeInsets.only(left: 66.h, top: 69.v),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgImage2,
                                    height: 70.adaptSize,
                                    width: 70.adaptSize),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 2.h, top: 10.v, bottom: 11.v),
                                    child: Text("lbl_kiamis".tr,
                                        style: theme.textTheme.headlineLarge))
                              ])),
                          SizedBox(height: 42.v),
                          Align(
                              alignment: Alignment.center,
                              child: Text("lbl_enter_otp".tr,
                                  style: theme.textTheme.headlineSmall)),
                          SizedBox(height: 13.v),
                          Text("Code has been sent to ${state.phoneNumber}",
                              style: CustomTextStyles.titleSmallMedium),
                          SizedBox(height: 21.v),
                          BlocSelector<OtpOneBloc, OtpOneState,
                                  TextEditingController?>(
                              selector: (state) => state.otpController,
                              builder: (context, otpController) {
                                return CustomPinCodeTextField(
                                    context: context,
                                    controller: otpController,
                                    onChanged: (value) {
                                      otpController?.text = value;
                                    });
                              }),
                          SizedBox(height: 20.v),
                          // Align(
                          //     alignment: Alignment.center,
                          //     child: Text("msg_resend_otp_in_55".tr,
                          //         style: theme.textTheme.titleMedium)),
                          // SizedBox(height: 21.v),
                          CustomElevatedButton(
                              text: "lbl_continue".tr,
                              onTap: () {
                                confirmOTP(context);
                              }),
                          SizedBox(height: 5.v)
                        ])),
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
              onCreateLoginEventError: () {
                _onLoginUserServicePostEventError(context);
              },
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
              title: const Text('Failed Verification'),
              content: const Text('Invalid OTP'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ));
  }
}
