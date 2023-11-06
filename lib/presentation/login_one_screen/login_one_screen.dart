import 'bloc/login_one_bloc.dart';
import 'models/login_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginOneScreen extends StatelessWidget {
  LoginOneScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginOneBloc>(
      create: (context) => LoginOneBloc(LoginOneState(
        loginOneModelObj: LoginOneModel(),
      ))
        ..add(LoginOneInitialEvent()),
      child: LoginOneScreen(),
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
                SizedBox(height: 137.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.h,
                        right: 16.h,
                        bottom: 179.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 261.h,
                            margin: EdgeInsets.only(
                              left: 8.h,
                              right: 88.h,
                            ),
                            child: Text(
                              "msg_welcome_back_glad".tr,
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.headlineSmallLatoGray900
                                  .copyWith(
                                height: 1.46,
                              ),
                            ),
                          ),
                          SizedBox(height: 37.v),
                          BlocSelector<LoginOneBloc, LoginOneState,
                              TextEditingController?>(
                            selector: (state) => state.emailController,
                            builder: (context, emailController) {
                              return CustomTextFormField(
                                controller: emailController,
                                hintText: "msg_enter_your_email".tr,
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
                          SizedBox(height: 15.v),
                          BlocBuilder<LoginOneBloc, LoginOneState>(
                            builder: (context, state) {
                              return CustomTextFormField(
                                controller: state.passwordController,
                                hintText: "msg_enter_your_password".tr,
                                hintStyle:
                                    CustomTextStyles.bodyMediumBluegray40001,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                  onTap: () {
                                    context.read<LoginOneBloc>().add(
                                        ChangePasswordVisibilityEvent(
                                            value: !state.isShowPassword));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        12.h, 12.v, 23.h, 12.v),
                                    child: CustomImageView(
                                      svgPath: state.isShowPassword
                                          ? ImageConstant.imgEyeGray60003
                                          : ImageConstant.imgEyeGray60003,
                                    ),
                                  ),
                                ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 48.v,
                                ),
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
                                  left: 24.h,
                                  top: 15.v,
                                  bottom: 15.v,
                                ),
                                borderDecoration:
                                    TextFormFieldStyleHelper.fillGray,
                                fillColor: appTheme.gray5004,
                              );
                            },
                          ),
                          SizedBox(height: 24.v),
                          CustomElevatedButton(
                            height: 48.v,
                            text: "lbl_login2".tr,
                            buttonStyle: CustomButtonStyles.fillIndigoA,
                            buttonTextStyle:
                                CustomTextStyles.titleMediumLatoWhiteA700_1,
                          ),
                          SizedBox(height: 38.v),
                          Row(
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
                          SizedBox(height: 21.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomIconButton(
                                  height: 56.v,
                                  width: 168.h,
                                  margin: EdgeInsets.only(right: 11.h),
                                  padding: EdgeInsets.all(15.h),
                                  decoration: IconButtonStyleHelper.outlineGray,
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
                                  decoration: IconButtonStyleHelper.outlineGray,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgGoogleic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 43.v),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "msg_don_t_have_an_account2".tr,
                                    style: CustomTextStyles.bodyMedium14_1,
                                  ),
                                  TextSpan(
                                    text: "lbl_register_now".tr,
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
