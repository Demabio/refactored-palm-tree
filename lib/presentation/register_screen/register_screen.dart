import 'bloc/register_bloc.dart';
import 'models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(RegisterState(
        registerModelObj: RegisterModel(),
      ))
        ..add(RegisterInitialEvent()),
      child: RegisterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: 390.h,
            child: Column(
              children: [
                SizedBox(height: 98.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15.h,
                        right: 15.h,
                        bottom: 138.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "msg_hello_register".tr,
                            style: CustomTextStyles.headlineSmallLatoGray900,
                          ),
                          BlocSelector<RegisterBloc, RegisterState,
                              TextEditingController?>(
                            selector: (state) => state.firstNameController,
                            builder: (context, firstNameController) {
                              return CustomTextFormField(
                                controller: firstNameController,
                                margin: EdgeInsets.only(
                                  left: 1.h,
                                  top: 40.v,
                                ),
                                hintText: "lbl_first_name".tr,
                                hintStyle:
                                    CustomTextStyles.bodyMediumBluegray40001,
                                validator: (value) {
                                  if (!isText(value)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                },
                                borderDecoration:
                                    TextFormFieldStyleHelper.fillGray,
                                fillColor: appTheme.gray5004,
                              );
                            },
                          ),
                          BlocSelector<RegisterBloc, RegisterState,
                              TextEditingController?>(
                            selector: (state) => state.lastNameController,
                            builder: (context, lastNameController) {
                              return CustomTextFormField(
                                controller: lastNameController,
                                margin: EdgeInsets.only(
                                  left: 1.h,
                                  top: 12.v,
                                ),
                                hintText: "lbl_last_name".tr,
                                hintStyle:
                                    CustomTextStyles.bodyMediumBluegray40001,
                                validator: (value) {
                                  if (!isText(value)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                },
                                borderDecoration:
                                    TextFormFieldStyleHelper.fillGray,
                                fillColor: appTheme.gray5004,
                              );
                            },
                          ),
                          BlocSelector<RegisterBloc, RegisterState,
                              TextEditingController?>(
                            selector: (state) => state.emailController,
                            builder: (context, emailController) {
                              return CustomTextFormField(
                                controller: emailController,
                                margin: EdgeInsets.only(
                                  left: 1.h,
                                  top: 12.v,
                                ),
                                hintText: "lbl_email2".tr,
                                hintStyle:
                                    CustomTextStyles.bodyMediumBluegray40001,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                },
                                borderDecoration:
                                    TextFormFieldStyleHelper.fillGray,
                                fillColor: appTheme.gray5004,
                              );
                            },
                          ),
                          BlocSelector<RegisterBloc, RegisterState,
                              TextEditingController?>(
                            selector: (state) => state.passwordController,
                            builder: (context, passwordController) {
                              return CustomTextFormField(
                                controller: passwordController,
                                margin: EdgeInsets.only(
                                  left: 1.h,
                                  top: 12.v,
                                ),
                                hintText: "lbl_password".tr,
                                hintStyle:
                                    CustomTextStyles.bodyMediumBluegray40001,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "Please enter valid password";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                borderDecoration:
                                    TextFormFieldStyleHelper.fillGray,
                                fillColor: appTheme.gray5004,
                              );
                            },
                          ),
                          CustomElevatedButton(
                            height: 48.v,
                            text: "lbl_register".tr,
                            margin: EdgeInsets.only(
                              left: 1.h,
                              top: 24.v,
                            ),
                            buttonStyle: CustomButtonStyles.fillIndigoA,
                            buttonTextStyle:
                                CustomTextStyles.titleMediumLatoWhiteA700_1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 1.h,
                              top: 38.v,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 7.v,
                                    bottom: 8.v,
                                  ),
                                  child: SizedBox(
                                    width: 112.h,
                                    child: Divider(
                                      color: appTheme.indigo50,
                                    ),
                                  ),
                                ),
                                Text(
                                  "lbl_or_login_with".tr,
                                  style: CustomTextStyles.bodyMediumGray60003,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 7.v,
                                    bottom: 8.v,
                                  ),
                                  child: SizedBox(
                                    width: 111.h,
                                    child: Divider(
                                      color: appTheme.indigo50,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 1.h,
                              top: 21.v,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomIconButton(
                                    height: 56.v,
                                    width: 168.h,
                                    margin: EdgeInsets.only(right: 11.h),
                                    padding: EdgeInsets.all(15.h),
                                    decoration:
                                        IconButtonStyleHelper.outlineGray,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgFacebookic,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CustomIconButton(
                                    height: 56.v,
                                    width: 168.h,
                                    margin: EdgeInsets.only(left: 11.h),
                                    padding: EdgeInsets.all(15.h),
                                    decoration:
                                        IconButtonStyleHelper.outlineGray,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgGoogleic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 43.v),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "msg_already_have_an2".tr,
                                    style: CustomTextStyles.bodyMedium14_1,
                                  ),
                                  TextSpan(
                                    text: " ",
                                  ),
                                  TextSpan(
                                    text: "lbl_login_now".tr,
                                    style: CustomTextStyles
                                        .titleSmallMontserratIndigoA200,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
