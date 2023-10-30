import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/dynamic_dialog_2.dart';

import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 13.h, top: 116.v, right: 13.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 69.h),
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
                SizedBox(height: 8.v),
                Align(
                    alignment: Alignment.center,
                    child: Text("lbl_welcome_back".tr,
                        style: theme.textTheme.headlineSmall)),
                Padding(
                    padding: EdgeInsets.only(left: 3.h, top: 15.v),
                    child: Text("msg_login_to_your_account".tr,
                        style: CustomTextStyles.titleSmallMedium)),
                BlocSelector<LoginBloc, LoginState, TextEditingController?>(
                    selector: (state) => state.userNameController,
                    builder: (context, userNameController) {
                      return CustomTextFormField(
                          autofocus: false,
                          focusNode: _firstTextFieldFocus,
                          controller: userNameController,
                          margin:
                              EdgeInsets.only(left: 3.h, top: 26.v, right: 2.h),
                          hintText: "lbl_username".tr,
                          validator: (value) {
                            if (isNotEmpty(value)) {
                              return "Please enter valid text";
                            }
                            return null;
                          },
                          borderDecoration:
                              TextFormFieldStyleHelper.outlinePrimaryTL101,
                          fillColor: appTheme.indigo600.withOpacity(0.08));
                    }),
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  return CustomTextFormField(
                      autofocus: false,
                      controller: state.passwordController,
                      focusNode: _secondTextFieldFocus,
                      margin: EdgeInsets.only(left: 3.h, top: 16.v, right: 2.h),
                      hintText: "lbl_password".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      suffix: InkWell(
                          onTap: () {
                            context.read<LoginBloc>().add(
                                ChangePasswordVisibilityEvent(
                                    value: !state.isShowPassword));
                          },
                          child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(30.h, 13.v, 20.h, 13.v),
                              child: CustomImageView(
                                  svgPath: state.isShowPassword
                                      ? ImageConstant
                                          .imgAntdesigneyeinvisiblefilled
                                      : ImageConstant
                                          .imgAntdesigneyeinvisiblefilled))),
                      suffixConstraints: BoxConstraints(maxHeight: 50.v),
                      validator: (value) {
                        if (value == null || (isNotEmpty(value))) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                      obscureText: state.isShowPassword,
                      contentPadding:
                          EdgeInsets.only(left: 14.h, top: 13.v, bottom: 13.v),
                      borderDecoration:
                          TextFormFieldStyleHelper.outlinePrimaryTL101,
                      fillColor: appTheme.indigo600.withOpacity(0.08));
                }),
                Padding(
                    padding: EdgeInsets.only(left: 1.h, top: 28.v),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocSelector<LoginBloc, LoginState, bool?>(
                              selector: (state) => state.englishName,
                              builder: (context, englishName) {
                                return CustomCheckboxButton(
                                    text: "lbl_remember_me".tr,
                                    value: englishName,
                                    margin: EdgeInsets.only(bottom: 2.v),
                                    onChange: (value) {
                                      context.read<LoginBloc>().add(
                                          ChangeCheckBoxEvent(value: value));
                                    });
                              }),
                          Padding(
                              padding: EdgeInsets.only(top: 2.v),
                              child: Text("msg_forgot_password".tr,
                                  style: theme.textTheme.titleMedium))
                        ])),
                Padding(
                  padding: const EdgeInsets.all(28.0),
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
                                  style: CustomTextStyles
                                      .bodyMediumPoppinsBlack900
                                      .copyWith(
                                    height: 1.57,
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: 300.h,
                                  height: 50.v,
                                  child: LinearProgressIndicator(
                                    // borderRadius: BorderRadius.circular(10),

                                    semanticsLabel: "Progress",
                                    semanticsValue:
                                        state.percentagedone.toString(),
                                    value: state
                                        .linebarvalue, // The value should be between 0.0 and 1.0, where 0.0 is 0% and 1.0 is 100%.
                                    backgroundColor: Colors
                                        .grey, // Background color of the progress bar.
                                    valueColor: AlwaysStoppedAnimation<Color>(theme
                                        .colorScheme
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
                        child: CustomElevatedButton(
                            text: "lbl_log_in".tr,
                            margin: EdgeInsets.fromLTRB(3.h, 25.v, 2.h, 5.v),
                            onTap: () {
                              loginAPI(context);
                            }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Calls the https://prudmatvisionaries.com/gateway/UserService/login API and triggers a [CreateLoginEvent] event on the [LoginBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateLoginEvent] event on the [LoginBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  loginAPI(BuildContext context) {
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
      AppRoutes.otpOneScreen,
    );
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
              title: const Text('Failed Login'),
              content: Text(PrefUtils().getResponse()),
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
