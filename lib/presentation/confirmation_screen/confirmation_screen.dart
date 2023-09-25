import 'bloc/confirmation_bloc.dart';
import 'models/confirmation_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ConfirmationBloc>(
      create: (context) => ConfirmationBloc(ConfirmationState(
        confirmationModelObj: ConfirmationModel(),
      ))
        ..add(ConfirmationInitialEvent()),
      child: ConfirmationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<ConfirmationBloc, ConfirmationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 85.h),
                    child: Text(
                      "lbl_confirmation".tr,
                      style: CustomTextStyles.titleMediumBlack900SemiBold18,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgIllustration,
                    height: 200.v,
                    width: 179.h,
                    margin: EdgeInsets.only(
                      top: 70.v,
                      right: 62.h,
                    ),
                  ),
                  SizedBox(height: 70.v),
                  CustomElevatedButton(
                    text: "lbl_back_home".tr,
                    buttonStyle: CustomButtonStyles.fillIndigoATL9,
                    buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
