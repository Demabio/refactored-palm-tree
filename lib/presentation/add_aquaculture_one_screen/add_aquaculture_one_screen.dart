import 'bloc/add_aquaculture_one_bloc.dart';
import 'models/add_aquaculture_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class AddAquacultureOneScreen extends StatelessWidget {
  const AddAquacultureOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureOneBloc>(
      create: (context) => AddAquacultureOneBloc(AddAquacultureOneState(
        addAquacultureOneModelObj: AddAquacultureOneModel(),
      ))
        ..add(AddAquacultureOneInitialEvent()),
      child: AddAquacultureOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<AddAquacultureOneBloc, AddAquacultureOneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              leadingWidth: 60.h,
              leading: AppbarImage(
                svgPath: ImageConstant.imgSort,
                margin: EdgeInsets.only(
                  left: 16.h,
                  top: 3.v,
                  bottom: 11.v,
                ),
              ),
              centerTitle: true,
              title: AppbarSubtitle1(
                text: "lbl_aquaculture2".tr,
              ),
              styleType: Style.bgFill,
            ),
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 5.v),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    right: 16.h,
                    bottom: 5.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 69.h),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomIconButton(
                                        height: 31.v,
                                        width: 32.h,
                                        padding: EdgeInsets.all(8.h),
                                        child: CustomImageView(
                                          svgPath: ImageConstant.imgCheckmark,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 16.v,
                                          bottom: 13.v,
                                        ),
                                        child: SizedBox(
                                          width: 54.h,
                                          child: Divider(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6.v),
                                Text(
                                  "lbl_step_1".tr,
                                  style:
                                      CustomTextStyles.bodyLargeBluegray40003,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 16.v,
                                        bottom: 13.v,
                                      ),
                                      child: SizedBox(
                                        width: 54.h,
                                        child: Divider(),
                                      ),
                                    ),
                                    CustomIconButton(
                                      height: 31.v,
                                      width: 32.h,
                                      padding: EdgeInsets.all(8.h),
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgCheckmark,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.v),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "lbl_step_2".tr,
                                    style:
                                        CustomTextStyles.bodyLargeBluegray40003,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 22.v),
                      Text(
                        "msg_aquaculture_type2".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 18.v),
                      Text(
                        "msg_what_types_of_aquaculture2".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      CustomElevatedButton(
                        text: "msg_add_aquaculture".tr,
                        margin: EdgeInsets.only(
                          left: 82.h,
                          top: 65.v,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 17.v),
                      Text(
                        "msg_production_system3".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      CustomElevatedButton(
                        text: "msg_add_production_system".tr,
                        margin: EdgeInsets.only(
                          left: 82.h,
                          top: 106.v,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      Container(
                        width: 316.h,
                        margin: EdgeInsets.only(
                          top: 17.v,
                          right: 26.h,
                        ),
                        child: Text(
                          "msg_does_the_household2".tr,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      CustomElevatedButton(
                        text: "msg_add_aquatic_species".tr,
                        margin: EdgeInsets.only(
                          left: 82.h,
                          top: 41.v,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 18.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomOutlinedButton(
                              text: "lbl_back".tr,
                              margin: EdgeInsets.only(right: 1.h),
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL10,
                              buttonTextStyle:
                                  CustomTextStyles.bodyLargePrimary_1,
                            ),
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              text: "lbl_next".tr,
                              margin: EdgeInsets.only(left: 1.h),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.v),
                      CustomElevatedButton(
                        text: "lbl_save".tr,
                        leftIcon: Container(
                          margin: EdgeInsets.only(right: 10.h),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgSaveWhiteA700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
