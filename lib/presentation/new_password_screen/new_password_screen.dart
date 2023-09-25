import 'bloc/new_password_bloc.dart';
import 'models/new_password_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<NewPasswordBloc>(
        create: (context) => NewPasswordBloc(
            NewPasswordState(newPasswordModelObj: NewPasswordModel()))
          ..add(NewPasswordInitialEvent()),
        child: NewPasswordScreen());
  }

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
                          SizedBox(height: 29.v),
                          Align(
                              alignment: Alignment.center,
                              child: Text("lbl_change_password".tr,
                                  style: theme.textTheme.headlineSmall)),
                          SizedBox(height: 12.v),
                          Text("msg_create_your_new".tr,
                              style: theme.textTheme.titleSmall),
                          SizedBox(height: 18.v),
                          BlocBuilder<NewPasswordBloc, NewPasswordState>(
                              builder: (context, state) {
                            return CustomTextFormField(
                                controller: state.newpasswordController,
                                hintText: "lbl_new_password".tr,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      context.read<NewPasswordBloc>().add(
                                          ChangePasswordVisibilityEvent(
                                              value: !state.isShowPassword));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 13.v, 20.h, 13.v),
                                        child: CustomImageView(
                                            svgPath: state.isShowPassword
                                                ? ImageConstant
                                                    .imgAntdesigneyeinvisiblefilled
                                                : ImageConstant
                                                    .imgAntdesigneyeinvisiblefilled))),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 50.v),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "Please enter valid password";
                                  }
                                  return null;
                                },
                                obscureText: state.isShowPassword,
                                contentPadding: EdgeInsets.only(
                                    left: 14.h, top: 13.v, bottom: 13.v));
                          }),
                          SizedBox(height: 16.v),
                          BlocBuilder<NewPasswordBloc, NewPasswordState>(
                              builder: (context, state) {
                            return CustomTextFormField(
                                controller: state.confirmpasswordController,
                                hintText: "msg_confirm_password".tr,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      context.read<NewPasswordBloc>().add(
                                          ChangePasswordVisibilityEvent1(
                                              value: !state.isShowPassword1));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 13.v, 20.h, 13.v),
                                        child: CustomImageView(
                                            svgPath: state.isShowPassword1
                                                ? ImageConstant
                                                    .imgAntdesigneyeinvisiblefilled
                                                : ImageConstant
                                                    .imgAntdesigneyeinvisiblefilled))),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 50.v),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "Please enter valid password";
                                  }
                                  return null;
                                },
                                obscureText: state.isShowPassword1,
                                contentPadding: EdgeInsets.only(
                                    left: 13.h, top: 13.v, bottom: 13.v));
                          }),
                          SizedBox(height: 40.v),
                          CustomElevatedButton(
                              text: "lbl_reset_password".tr,
                              onTap: () {
                                onTapResetpassword(context);
                              }),
                          SizedBox(height: 5.v)
                        ])))));
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the forgotPasswordScreen.
  onTapImgSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapResetpassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
