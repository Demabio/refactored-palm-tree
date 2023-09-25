import 'bloc/recover_account_bloc.dart';
import 'models/recover_account_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RecoverAccountScreen extends StatelessWidget {
  RecoverAccountScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<RecoverAccountBloc>(
        create: (context) => RecoverAccountBloc(
            RecoverAccountState(recoverAccountModelObj: RecoverAccountModel()))
          ..add(RecoverAccountInitialEvent()),
        child: RecoverAccountScreen());
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
                          SizedBox(height: 43.v),
                          Align(
                              alignment: Alignment.center,
                              child: Text("lbl_recover_account".tr,
                                  style: theme.textTheme.headlineSmall)),
                          SizedBox(height: 15.v),
                          Text("msg_please_enter_your".tr,
                              style: theme.textTheme.titleSmall),
                          SizedBox(height: 52.v),
                          BlocSelector<RecoverAccountBloc, RecoverAccountState,
                                  TextEditingController?>(
                              selector: (state) => state.userNameController,
                              builder: (context, userNameController) {
                                return CustomTextFormField(
                                    controller: userNameController,
                                    hintText: "lbl_username".tr,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (!isText(value)) {
                                        return "Please enter valid text";
                                      }
                                      return null;
                                    });
                              }),
                          SizedBox(height: 40.v),
                          CustomElevatedButton(
                              text: "lbl_continue".tr,
                              onTap: () {
                                onTapContinue(context);
                              }),
                          SizedBox(height: 5.v)
                        ])))));
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapImgSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}