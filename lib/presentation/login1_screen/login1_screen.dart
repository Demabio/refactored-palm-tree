import 'bloc/login1_bloc.dart';
import 'models/login1_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class Login1Screen extends StatelessWidget {
  Login1Screen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<Login1Bloc>(
      create: (context) => Login1Bloc(Login1State(
        login1ModelObj: Login1Model(),
      ))
        ..add(Login1InitialEvent()),
      child: Login1Screen(),
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
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 13.h,
              top: 63.v,
              right: 13.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 68.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage2,
                        height: 70.adaptSize,
                        width: 70.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 2.h,
                          top: 10.v,
                          bottom: 11.v,
                        ),
                        child: Text(
                          "lbl_kiamis".tr,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 62.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "lbl_welcome_back".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 2.h,
                    top: 15.v,
                  ),
                  child: Text(
                    "msg_login_to_your_account".tr,
                    style: CustomTextStyles.titleSmallMedium,
                  ),
                ),
                BlocSelector<Login1Bloc, Login1State, TextEditingController?>(
                  selector: (state) => state.userNameController,
                  builder: (context, userNameController) {
                    return CustomTextFormField(
                      controller: userNameController,
                      margin: EdgeInsets.only(
                        left: 2.h,
                        top: 26.v,
                      ),
                      hintText: "lbl_username".tr,
                      validator: (value) {
                        if (!isText(value)) {
                          return "Please enter valid text";
                        }
                        return null;
                      },
                      borderDecoration:
                          TextFormFieldStyleHelper.outlinePrimaryTL101,
                      fillColor: appTheme.indigo600.withOpacity(0.08),
                    );
                  },
                ),
                BlocBuilder<Login1Bloc, Login1State>(
                  builder: (context, state) {
                    return CustomTextFormField(
                      controller: state.passwordController,
                      margin: EdgeInsets.only(
                        left: 2.h,
                        top: 16.v,
                      ),
                      hintText: "lbl_password".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      suffix: InkWell(
                        onTap: () {
                          context.read<Login1Bloc>().add(
                              ChangePasswordVisibilityEvent(
                                  value: !state.isShowPassword));
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 13.v, 20.h, 13.v),
                          child: CustomImageView(
                            svgPath: state.isShowPassword
                                ? ImageConstant.imgAntdesigneyeinvisiblefilled
                                : ImageConstant.imgAntdesigneyeinvisiblefilled,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 50.v,
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                      obscureText: state.isShowPassword,
                      contentPadding: EdgeInsets.only(
                        left: 14.h,
                        top: 13.v,
                        bottom: 13.v,
                      ),
                      borderDecoration:
                          TextFormFieldStyleHelper.outlinePrimaryTL101,
                      fillColor: appTheme.indigo600.withOpacity(0.08),
                    );
                  },
                ),
                SizedBox(height: 28.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocSelector<Login1Bloc, Login1State, bool?>(
                      selector: (state) => state.englishName,
                      builder: (context, englishName) {
                        return CustomCheckboxButton(
                          text: "lbl_remember_me".tr,
                          value: englishName,
                          margin: EdgeInsets.only(bottom: 2.v),
                          onChange: (value) {
                            context
                                .read<Login1Bloc>()
                                .add(ChangeCheckBoxEvent(value: value));
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        "msg_forgot_password".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                CustomElevatedButton(
                  text: "lbl_log_in".tr,
                  margin: EdgeInsets.only(
                    left: 2.h,
                    top: 25.v,
                    bottom: 5.v,
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
