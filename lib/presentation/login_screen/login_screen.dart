import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/dynamic_dialog_2.dart';
import 'package:kiamis_app/presentation/update_db/updatedb_dialog.dart';

import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(
            LoginInitialEvent(),
          ),
        child: LoginScreen());
  }

  void init() {
    // Initialization code here
  }

  FocusNode _firstTextFieldFocus = FocusNode();
  FocusNode _secondTextFieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double screenHeightPercentage =
        (DeviceExt(8.3).h / mediaQueryData.size.height) * 100;
    print(
        "percent: $screenHeightPercentage , height: ${mediaQueryData.size.height}, Width: ${mediaQueryData.size.width}");
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
                      left: DeviceExt(3).h, top: 28.w, right: DeviceExt(3).h)
                  : EdgeInsets.only(
                      left: DeviceExt(3).w,
                      top: DeviceExt(28).h,
                      right: DeviceExt(3).w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                      ?.copyWith(fontSize: DeviceExt(4).h)))
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
                          ? 2.w
                          : DeviceExt(2).h),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "lbl_welcome_back".tr,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2.5).h
                              : DeviceExt(3).w,
                        ),
                      )),
                  Padding(
                    padding:
                        EdgeInsets.only(left: DeviceExt(0.36).h, top: 3.6.w),
                    child: Text("msg_login_to_your_account".tr,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(1.8).h
                              : DeviceExt(2).w,
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  BlocSelector<LoginBloc, LoginState, TextEditingController?>(
                      selector: (state) => state.userNameController,
                      builder: (context, userNameController) {
                        return CustomTextFormField(
                            autofocus: false,
                            focusNode: _firstTextFieldFocus,
                            controller: userNameController,
                            margin: Device.orientation == Orientation.portrait
                                ? EdgeInsets.only(
                                    left: DeviceExt(0.36).h,
                                    top: 6.3.w,
                                    right: DeviceExt(0.2).h)
                                : EdgeInsets.only(
                                    left: DeviceExt(0.36).w,
                                    top: DeviceExt(6.3).h,
                                    right: DeviceExt(0.2).w),
                            hintText: "lbl_username".tr,
                            textStyle: theme.textTheme.titleSmall?.copyWith(
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            hintStyle: theme.textTheme.titleSmall?.copyWith(
                              fontSize:
                                  Device.orientation == Orientation.portrait
                                      ? DeviceExt(1.8).h
                                      : DeviceExt(2).w,
                              fontWeight: FontWeight.normal,
                            ),
                            validator: (value) {
                              if (isNotEmpty(value)) {
                                return "Please enter valid text";
                              }
                              return null;
                            },
                            suffix: InkWell(
                                onTap: () {},
                                child: Container(
                                  height:
                                      Device.orientation == Orientation.portrait
                                          ? DeviceExt(3.5).h
                                          : 3.5.w,
                                  width:
                                      Device.orientation == Orientation.portrait
                                          ? DeviceExt(3.5).h
                                          : 3.5.w,
                                  margin:
                                      Device.orientation == Orientation.portrait
                                          ? EdgeInsets.fromLTRB(
                                              DeviceExt(3.6).h,
                                              3.w,
                                              DeviceExt(2).h,
                                              3.w)
                                          : EdgeInsets.fromLTRB(
                                              DeviceExt(3.6).w,
                                              DeviceExt(3).h,
                                              DeviceExt(2).w,
                                              DeviceExt(3).h),
                                )),
                            borderDecoration:
                                TextFormFieldStyleHelper.outlinePrimaryTL101,
                            fillColor: appTheme.indigo600.withOpacity(0.08));
                      }),
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                    return CustomTextFormField(
                      autofocus: false,
                      controller: state.passwordController,
                      focusNode: _secondTextFieldFocus,
                      margin: Device.orientation == Orientation.portrait
                          ? EdgeInsets.only(
                              left: DeviceExt(0.36).h,
                              top: 6.3.w,
                              right: DeviceExt(0.2).h)
                          : EdgeInsets.only(
                              left: DeviceExt(0.36).w,
                              top: DeviceExt(6.3).h,
                              right: DeviceExt(0.2).w),
                      hintText: "lbl_password".tr,
                      textStyle: theme.textTheme.titleSmall?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(1.8).h
                              : DeviceExt(2).w,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      hintStyle: theme.textTheme.titleSmall?.copyWith(
                        fontSize: Device.orientation == Orientation.portrait
                            ? DeviceExt(1.8).h
                            : DeviceExt(2).w,
                        fontWeight: FontWeight.normal,
                      ),
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      suffix: InkWell(
                          onTap: () {
                            context.read<LoginBloc>().add(
                                ChangePasswordVisibilityEvent(
                                    value: !state.isShowPassword));
                          },
                          child: Container(
                              height: Device.orientation == Orientation.portrait
                                  ? DeviceExt(3.5).h
                                  : 3.5.w,
                              width: Device.orientation == Orientation.portrait
                                  ? DeviceExt(3.5).h
                                  : 3.5.w,
                              margin: Device.orientation == Orientation.portrait
                                  ? EdgeInsets.fromLTRB(DeviceExt(3.6).h, 3.w,
                                      DeviceExt(2).h, 3.w)
                                  : EdgeInsets.fromLTRB(
                                      DeviceExt(3.6).w,
                                      DeviceExt(3).h,
                                      DeviceExt(2).w,
                                      DeviceExt(3).h),
                              child: CustomImageView(
                                  svgPath: state.isShowPassword
                                      ? ImageConstant
                                          .imgAntdesigneyeinvisiblefilled
                                      : ImageConstant
                                          .imgAntdesigneyeinvisiblefilled))),
                      validator: (value) {
                        if (value == null || (isNotEmpty(value))) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                      obscureText: state.isShowPassword,
                      // contentPadding: EdgeInsets.only(
                      //     left: DeviceExt(1.7).h, top: 3.w, bottom: 3.w),
                      borderDecoration:
                          TextFormFieldStyleHelper.outlinePrimaryTL101,
                      fillColor: appTheme.indigo600.withOpacity(0.08),
                    );
                  }),
                  Padding(
                      padding: Device.orientation == Orientation.portrait
                          ? EdgeInsets.only(left: DeviceExt(0.12).h, top: 7.w)
                          : EdgeInsets.only(
                              left: DeviceExt(0.12).w, top: DeviceExt(7).h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocSelector<LoginBloc, LoginState, bool?>(
                                selector: (state) => state.englishName,
                                builder: (context, englishName) {
                                  return CustomCheckboxButton(
                                      text: "lbl_remember_me".tr,
                                      textStyle:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontSize: Device.orientation ==
                                                Orientation.portrait
                                            ? DeviceExt(1.8).h
                                            : DeviceExt(2).w,
                                      ),
                                      value: englishName,
                                      margin: EdgeInsets.only(bottom: 0.5.w),
                                      onChange: (value) {
                                        context.read<LoginBloc>().add(
                                            ChangeCheckBoxEvent(value: value));
                                      });
                                }),
                            Padding(
                              padding: EdgeInsets.only(top: 0.5.w),
                              child: InkWell(
                                onTap: () => changePassword(context),
                                child: Text(
                                  "msg_forgot_password".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                ),
                              ),
                            )
                          ])),
                  Padding(
                    padding: Device.orientation == Orientation.portrait
                        ? EdgeInsets.all(7.w)
                        : EdgeInsets.all(DeviceExt(7).h),
                    child: BlocSelector<LoginBloc, LoginState, LoginState>(
                        selector: (state) => state,
                        builder: (context, state) {
                          return Visibility(
                            visible: state.success,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "Downloading: ${state.percentagedone}% Done",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: Colors.black,
                                      fontSize: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(1.8).h
                                          : DeviceExt(2).w,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(36).h
                                        : 36.w,
                                    height: Device.orientation ==
                                            Orientation.portrait
                                        ? 12.w
                                        : DeviceExt(12).h,
                                    child: LinearProgressIndicator(
                                      // borderRadius: BorderRadius.circular(10),

                                      semanticsLabel: "Progress",
                                      semanticsValue:
                                          state.percentagedone.toString(),
                                      value: state
                                          .linebarvalue, // The value should be between 0.0 and 1.0, where 0.0 is 0% and 1.0 is 100%.
                                      backgroundColor: Colors
                                          .grey, // Background color of the progress bar.
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          theme.colorScheme
                                              .primary), // Color of the progress bar.
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  BlocSelector<LoginBloc, LoginState, bool>(
                    selector: (state) => state.success,
                    builder: (context, success) {
                      return Visibility(
                          visible: !success,
                          child: Center(
                            child: CustomElevatedButton(
                                text: "lbl_log_in".tr,
                                height: Device.orientation ==
                                        Orientation.portrait
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
                                margin:
                                    Device.orientation == Orientation.portrait
                                        ? EdgeInsets.fromLTRB(DeviceExt(0.36).h,
                                            6.w, DeviceExt(0.2).h, 1.2.w)
                                        : EdgeInsets.fromLTRB(
                                            DeviceExt(0.36).w,
                                            DeviceExt(6).h,
                                            DeviceExt(0.2).w,
                                            DeviceExt(1.2).h),
                                onTap: () {
                                  loginAPI(context);
                                }),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  changePassword(BuildContext context) async {
    String label = "Contact Adminisrator";
    String body =
        "Contact the administrator to process your request and a Temporary Password will be sent to allow you to change your password";
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

    NavigatorService.popAndPushNamed(
      AppRoutes.newPasswordScreen,
    );
  }

  onForgotPass(BuildContext context) {
    context.read<LoginBloc>().add(
          SendOTPEvent(
            onCreateLoginEventSuccess: () {
              onFP(context);
            },
            onCreateLoginEventError: () {
              _otp(context);
            },
          ),
        );
  }

  onFP(BuildContext context) {
    PrefUtils().setFP(true);

    NavigatorService.popAndPushNamed(
      AppRoutes.otpOneScreen,
    );
  }

  void _otp(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Request Failed'),
              content:
                  const Text('Something went wrong, contact administrator'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ));
  }

  /// Calls the https://prudmatvisionaries.com/gateway/UserService/login API and triggers a [CreateLoginEvent] event on the [LoginBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateLoginEvent] event on the [LoginBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  loginAPI(BuildContext context) {
    PrefUtils().setFP(false);

    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            CreateLoginEvent(
              onCreateLoginEventSuccess: () {
                _onLoginUserServicePostEventSuccess(context);
              },
              onCreateLoginEventError: () {
                _onLoginUserServicePostEventError(context);
              },
              onFalse: () => downloadDialog(context, "Old App Version Detected",
                  "Your current version of KIAMIS is outdated. Please update to the latest version for a better experience. Please Allow KIAMIS to auto-download. Thanks"),
            ),
          );
    }
  }

  /// Navigates to the otpOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the otpOneScreen.
  void _onLoginUserServicePostEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );

    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: UpdateDBDialog.builder(
                context,
              ),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  static downloadDialog(BuildContext context, String label, String body) async {
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

    context.read<LoginBloc>().add(VersionCheckEvent(
          onTrue: () => closedialog(context, "Successful Update",
              "The update has been successfully downloaded and installed."),
          onFalse: () => closedialog(context, "App Permissions",
              "Kindly Allow App to install packages."),
          onError: () => closedialog(context, "Update Error",
              "Failed to download and install the update."),
        ));
  }

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

  /// Displays an alert dialog when the action is triggered.
  /// The dialog box contains a title and a message with the `Invalid Credentials`
  void _onLoginUserServicePostEventError(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                'Failed Login',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: Device.orientation == Orientation.portrait
                      ? DeviceExt(2.5).h
                      : DeviceExt(3).w,
                ),
              ),
              content: Text(
                "Invalid Credentials",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: Device.orientation == Orientation.portrait
                      ? DeviceExt(2.5).h
                      : DeviceExt(3).w,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: CustomElevatedButton(
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
                          : EdgeInsets.fromLTRB(
                              DeviceExt(0.36).w,
                              DeviceExt(6).h,
                              DeviceExt(0.2).w,
                              DeviceExt(1.2).h),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ));
  }
}
