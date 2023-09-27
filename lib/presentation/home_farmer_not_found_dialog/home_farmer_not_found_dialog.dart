import 'bloc/home_farmer_not_found_bloc.dart';
import 'models/home_farmer_not_found_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class HomeFarmerNotFoundDialog extends StatelessWidget {
  const HomeFarmerNotFoundDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeFarmerNotFoundBloc>(
      create: (context) => HomeFarmerNotFoundBloc(HomeFarmerNotFoundState(
        homeFarmerNotFoundModelObj: HomeFarmerNotFoundModel(),
      ))
        ..add(HomeFarmerNotFoundInitialEvent()),
      child: HomeFarmerNotFoundDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<HomeFarmerNotFoundBloc, HomeFarmerNotFoundState>(
        builder: (context, state) {
      return Container(
        width: 330.h,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20.v),
            Text(
              "msg_farmer_id_xxxxxxxx".tr,
              style: CustomTextStyles.bodyLargePrimary_2,
            ),
            SizedBox(height: 9.v),
            SizedBox(
              width: 161.h,
              child: Text(
                "msg_farmer_does_not".tr,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumPoppinsBlack900.copyWith(
                  height: 1.57,
                ),
              ),
            ),
            SizedBox(
              width: 161.h,
              child: Text(
                "Count ${state.count}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumPoppinsBlack900.copyWith(
                  height: 1.57,
                ),
              ),
            ),
            SizedBox(height: 21.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    text: "lbl_no".tr,
                    margin: EdgeInsets.only(right: 4.h),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    text: "lbl_yes".tr,
                    margin: EdgeInsets.only(left: 4.h),
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () => onTapadd(context, state),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  onTapadd(BuildContext context, HomeFarmerNotFoundState state) {
    context.read<HomeFarmerNotFoundBloc>().add(FetchGetOrdersEvent());
    print(state.count);
  }
}
