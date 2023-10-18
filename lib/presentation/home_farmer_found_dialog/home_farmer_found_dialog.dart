import 'bloc/home_farmer_found_bloc.dart';
import 'models/home_farmer_found_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class HomeFarmerFoundDialog extends StatelessWidget {
  const HomeFarmerFoundDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeFarmerFoundBloc>(
      create: (context) => HomeFarmerFoundBloc(HomeFarmerFoundState(
        homeFarmerFoundModelObj: HomeFarmerFoundModel(),
      ))
        ..add(HomeFarmerFoundInitialEvent()),
      child: HomeFarmerFoundDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
        width: 330.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 6.v,
        ),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 30.v),
            Text(
              "Farmer Id Number: ${PrefUtils().getFarmerIdNo()}".tr,
              style: CustomTextStyles.bodyLargePrimary_2,
            ),
            SizedBox(height: 10.v),
            Text(
              PrefUtils().getFound()
                  ? "msg_farmer_already_exists".tr
                  : "Farmer Does Not Exist, Add Farmer?",
              style: CustomTextStyles.bodyMediumPoppinsBlack900,
            ),
            SizedBox(height: 51.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    text: "lbl_no".tr,
                    onTap: () => Navigator.pop(context),
                    margin: EdgeInsets.only(right: 4.h),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    text: "lbl_yes".tr,
                    onTap: () => navToRespectivePage(context),
                    margin: EdgeInsets.only(left: 4.h),
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  navToRespectivePage(BuildContext context) {
    if (PrefUtils().getFound()) {
      Navigator.pop(context);
      NavigatorService.popAndPushNamed(AppRoutes.farmerRegistrationScreen);
    } else {
      Navigator.pop(context);

      NavigatorService.popAndPushNamed(
          AppRoutes.farmersIdentificationTwoScreen);
    }
  }
}
