import 'bloc/new_password_bloc.dart';
import 'models/new_password_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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

  FocusNode _firstTextFieldFocus = FocusNode();
  FocusNode _secondTextFieldFocus = FocusNode();
  FocusNode _thirdTextFieldFocus = FocusNode();
  FocusNode _fourthTextFieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
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
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(5).h
                                        : 5.w,
                                width:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(5).h
                                        : 5.w,
                                onTap: () {
                                  onTapImgSortone(context);
                                }),
                            if (Device.orientation == Orientation.portrait)
                              Padding(
                                  padding:
                                      Device.screenType == ScreenType.mobile
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
                                  padding: Device.screenType ==
                                          ScreenType.mobile
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
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? 2.w
                                        : DeviceExt(2).h),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "lbl_change_password".tr,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontSize:
                                      Device.orientation == Orientation.portrait
                                          ? DeviceExt(2.5).h
                                          : DeviceExt(3).w,
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? 2.w
                                        : DeviceExt(2).h),
                            Text(
                              "msg_create_your_new".tr,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? 2.w
                                        : DeviceExt(2).h),
                            BlocBuilder<NewPasswordBloc, NewPasswordState>(
                                builder: (context, state) {
                              return CustomTextFormField(
                                  controller: state.username,
                                  hintText: "Username".tr,
                                  autofocus: false,
                                  focusNode: _fourthTextFieldFocus,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text,
                                  margin:
                                      Device.orientation == Orientation.portrait
                                          ? EdgeInsets.only(
                                              left: DeviceExt(0.36).h,
                                              top: 6.3.w,
                                              right: DeviceExt(0.2).h)
                                          : EdgeInsets.only(
                                              left: DeviceExt(0.36).w,
                                              top: DeviceExt(6.3).h,
                                              right: DeviceExt(0.2).w),
                                  textStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,color: Colors.black
                                  ),
                                  hintStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  suffix: Container(
                                    height: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(3.5).h
                                        : 3.5.w,
                                    width: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(3.5).h
                                        : 3.5.w,
                                    margin: Device.orientation ==
                                            Orientation.portrait
                                        ? EdgeInsets.fromLTRB(DeviceExt(3.6).h,
                                            3.w, DeviceExt(2).h, 3.w)
                                        : EdgeInsets.fromLTRB(
                                            DeviceExt(3.6).w,
                                            DeviceExt(3).h,
                                            DeviceExt(2).w,
                                            DeviceExt(3).h),
                                  ),
                                  validator: (value) {
                                    if (value == null || (isNotEmpty(value))) {
                                      return "Please enter valid password";
                                    }
                                    return null;
                                  },
                                  // contentPadding: EdgeInsets.only(
                                  //     left: 13.h, top: 13.v, bottom: 13.v),
                                  borderDecoration: TextFormFieldStyleHelper
                                      .outlinePrimaryTL101,
                                  fillColor:
                                      appTheme.indigo600.withOpacity(0.08));
                            }),
                            SizedBox(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? 2.w
                                        : DeviceExt(2).h),
                            BlocBuilder<NewPasswordBloc, NewPasswordState>(
                                builder: (context, state) {
                              return CustomTextFormField(
                                  controller: state.temporaryPassword,
                                  hintText: "Temporary Password".tr,
                                  autofocus: false,
                                  focusNode: _firstTextFieldFocus,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.visiblePassword,
                                  margin:
                                      Device.orientation == Orientation.portrait
                                          ? EdgeInsets.only(
                                              left: DeviceExt(0.36).h,
                                              top: 6.3.w,
                                              right: DeviceExt(0.2).h)
                                          : EdgeInsets.only(
                                              left: DeviceExt(0.36).w,
                                              top: DeviceExt(6.3).h,
                                              right: DeviceExt(0.2).w),
                                  textStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,color: Colors.black
                                  ),
                                  hintStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  suffix: InkWell(
                                    onTap: () {
                                      context.read<NewPasswordBloc>().add(
                                          ChangePasswordVisibilityEvent2(
                                              value: !state.isShowPassword2));
                                    },
                                    child: Container(
                                      height: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(3.5).h
                                          : 3.5.w,
                                      width: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(3.5).h
                                          : 3.5.w,
                                      margin: Device.orientation ==
                                              Orientation.portrait
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
                                      child: CustomImageView(
                                        svgPath: state.isShowPassword2
                                            ? ImageConstant
                                                .imgAntdesigneyeinvisiblefilled
                                            : ImageConstant
                                                .imgAntdesigneyeinvisiblefilled,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || (isNotEmpty(value))) {
                                      return "Please enter valid password";
                                    }
                                    return null;
                                  },
                                  obscureText: state.isShowPassword2,
                                  // contentPadding: EdgeInsets.only(
                                  //     left: 13.h, top: 13.v, bottom: 13.v),
                                  borderDecoration: TextFormFieldStyleHelper
                                      .outlinePrimaryTL101,
                                  fillColor:
                                      appTheme.indigo600.withOpacity(0.08));
                            }),
                            SizedBox(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? 2.w
                                        : DeviceExt(2).h),
                            BlocBuilder<NewPasswordBloc, NewPasswordState>(
                                builder: (context, state) {
                              return CustomTextFormField(
                                  controller: state.newpasswordController,
                                  hintText: "lbl_new_password".tr,
                                  autofocus: false,
                                  focusNode: _secondTextFieldFocus,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.visiblePassword,
                                  margin:
                                      Device.orientation == Orientation.portrait
                                          ? EdgeInsets.only(
                                              left: DeviceExt(0.36).h,
                                              top: 6.3.w,
                                              right: DeviceExt(0.2).h)
                                          : EdgeInsets.only(
                                              left: DeviceExt(0.36).w,
                                              top: DeviceExt(6.3).h,
                                              right: DeviceExt(0.2).w),
                                  textStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,color: Colors.black
                                  ),
                                  hintStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  suffix: InkWell(
                                    onTap: () {
                                      context.read<NewPasswordBloc>().add(
                                          ChangePasswordVisibilityEvent(
                                              value: !state.isShowPassword));
                                    },
                                    child: Container(
                                      height: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(3.5).h
                                          : 3.5.w,
                                      width: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(3.5).h
                                          : 3.5.w,
                                      margin: Device.orientation ==
                                              Orientation.portrait
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
                                      child: CustomImageView(
                                        svgPath: state.isShowPassword
                                            ? ImageConstant
                                                .imgAntdesigneyeinvisiblefilled
                                            : ImageConstant
                                                .imgAntdesigneyeinvisiblefilled,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidPassword(value,
                                            isRequired: true))) {
                                      return "Please enter valid password";
                                    } else if (!matchPasswords(
                                        state.confirmpasswordController!.text,
                                        state.newpasswordController!.text)) {
                                      return "Passwords do not match";
                                    } else
                                      return null;
                                  },
                                  obscureText: state.isShowPassword,
                                  borderDecoration: TextFormFieldStyleHelper
                                      .outlinePrimaryTL101,
                                  fillColor:
                                      appTheme.indigo600.withOpacity(0.08));
                            }),
                            SizedBox(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? 2.w
                                        : DeviceExt(2).h),
                            BlocBuilder<NewPasswordBloc, NewPasswordState>(
                                builder: (context, state) {
                              return CustomTextFormField(
                                  controller: state.confirmpasswordController,
                                  autofocus: false,
                                  hintText: "msg_confirm_password".tr,
                                  focusNode: _thirdTextFieldFocus,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  margin:
                                      Device.orientation == Orientation.portrait
                                          ? EdgeInsets.only(
                                              left: DeviceExt(0.36).h,
                                              top: 6.3.w,
                                              right: DeviceExt(0.2).h)
                                          : EdgeInsets.only(
                                              left: DeviceExt(0.36).w,
                                              top: DeviceExt(6.3).h,
                                              right: DeviceExt(0.2).w),
                                  textStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,color: Colors.black
                                  ),
                                  hintStyle:
                                      theme.textTheme.titleSmall?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  suffix: InkWell(
                                    onTap: () {
                                      context.read<NewPasswordBloc>().add(
                                          ChangePasswordVisibilityEvent1(
                                              value: !state.isShowPassword1));
                                    },
                                    child: Container(
                                      height: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(3.5).h
                                          : 3.5.w,
                                      width: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(3.5).h
                                          : 3.5.w,
                                      margin: Device.orientation ==
                                              Orientation.portrait
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
                                      child: CustomImageView(
                                        svgPath: state.isShowPassword1
                                            ? ImageConstant
                                                .imgAntdesigneyeinvisiblefilled
                                            : ImageConstant
                                                .imgAntdesigneyeinvisiblefilled,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidPassword(value,
                                            isRequired: true))) {
                                      return "Please enter valid password";
                                    } else if (!matchPasswords(
                                        state.confirmpasswordController!.text,
                                        state.newpasswordController!.text)) {
                                      return "Passwords do not match";
                                    } else
                                      return null;
                                  },
                                  obscureText: state.isShowPassword1,
                                  borderDecoration: TextFormFieldStyleHelper
                                      .outlinePrimaryTL101,
                                  fillColor:
                                      appTheme.indigo600.withOpacity(0.08));
                            }),
                            SizedBox(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? 2.w
                                        : DeviceExt(2).h),
                            CustomElevatedButton(
                                text: "lbl_reset_password".tr,
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
                                  forgotPass(context);
                                }),
                            SizedBox(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? 2.w
                                        : DeviceExt(2).h),
                          ])),
                ))));
  }

  forgotPass(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<NewPasswordBloc>().add(
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

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the forgotPasswordScreen.
  onTapImgSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.loginScreen,
    );
  }

  onTapContinue(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.loginScreen,
    );
  }

  void _onLoginUserServicePostEventError(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Request Failed'),
              content: const Text(
                  'Something went wrong, kindly confirm youve entered the temporary password you received correctly'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ));
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
