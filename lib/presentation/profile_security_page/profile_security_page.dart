import 'bloc/profile_security_bloc.dart';
import 'models/profile_security_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfileSecurityPage extends StatefulWidget {
  const ProfileSecurityPage({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileSecurityPageState createState() => ProfileSecurityPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileSecurityBloc>(
      create: (context) => ProfileSecurityBloc(ProfileSecurityState(
        profileSecurityModelObj: ProfileSecurityModel(),
      ))
        ..add(ProfileSecurityInitialEvent()),
      child: ProfileSecurityPage(),
    );
  }
}

class ProfileSecurityPageState extends State<ProfileSecurityPage>
    with AutomaticKeepAliveClientMixin<ProfileSecurityPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 95.v,
                    right: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_change_password2".tr,
                        style: CustomTextStyles.bodyMedium_1,
                      ),
                      SizedBox(height: 23.v),
                      Text(
                        "msg_current_password".tr,
                        style: CustomTextStyles.bodyMediumGray90002_1,
                      ),
                      SizedBox(height: 14.v),
                      BlocSelector<ProfileSecurityBloc, ProfileSecurityState,
                          TextEditingController?>(
                        selector: (state) => state.passwordController,
                        builder: (context, passwordController) {
                          return CustomTextFormField(
                            controller: passwordController,
                            hintText: "lbl_password".tr,
                            hintStyle: CustomTextStyles.bodyMediumBluegray40001,
                            textInputType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "Please enter valid password";
                              }
                              return null;
                            },
                            obscureText: true,
                            borderDecoration: TextFormFieldStyleHelper.fillGray,
                            fillColor: appTheme.gray5004,
                          );
                        },
                      ),
                      SizedBox(height: 25.v),
                      Text(
                        "lbl_new_password2".tr,
                        style: CustomTextStyles.bodyMediumGray90002_1,
                      ),
                      SizedBox(height: 14.v),
                      BlocSelector<ProfileSecurityBloc, ProfileSecurityState,
                          TextEditingController?>(
                        selector: (state) => state.newpasswordController,
                        builder: (context, newpasswordController) {
                          return CustomTextFormField(
                            controller: newpasswordController,
                            hintText: "lbl_password".tr,
                            hintStyle: CustomTextStyles.bodyMediumBluegray40001,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "Please enter valid password";
                              }
                              return null;
                            },
                            obscureText: true,
                            borderDecoration: TextFormFieldStyleHelper.fillGray,
                            fillColor: appTheme.gray5004,
                          );
                        },
                      ),
                      SizedBox(height: 24.v),
                      CustomElevatedButton(
                        height: 48.v,
                        text: "lbl_update_password".tr,
                        buttonStyle: CustomButtonStyles.fillGrayTL8,
                        buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
                      ),
                    ],
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
