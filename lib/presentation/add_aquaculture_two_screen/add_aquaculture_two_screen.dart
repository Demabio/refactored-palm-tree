import 'bloc/add_aquaculture_two_bloc.dart';
import 'models/add_aquaculture_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class AddAquacultureTwoScreen extends StatelessWidget {
  const AddAquacultureTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureTwoBloc>(
      create: (context) => AddAquacultureTwoBloc(AddAquacultureTwoState(
        addAquacultureTwoModelObj: AddAquacultureTwoModel(),
      ))
        ..add(AddAquacultureTwoInitialEvent()),
      child: AddAquacultureTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

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
                                    decoration:
                                        IconButtonStyleHelper.fillPrimary,
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
                                      child: Divider(
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 6.v),
                            Text(
                              "lbl_step_1".tr,
                              style: CustomTextStyles.bodyLargeBluegray90001,
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
                                style: CustomTextStyles.bodyLargeBluegray40003,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45.v),
                  Text(
                    "msg_what_are_your_main3".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  CustomElevatedButton(
                    text: "lbl_add_main_inputs".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 106.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_do_you_utilize_fertilizers2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddAquacultureTwoBloc, AddAquacultureTwoState,
                      AddAquacultureTwoModel?>(
                    selector: (state) => state.addAquacultureTwoModelObj,
                    builder: (context, addAquacultureTwoModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addAquacultureTwoModelObj?.dropdownItemList ?? [],
                        onChanged: (value) {
                          context
                              .read<AddAquacultureTwoBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_which_is_your_production2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddAquacultureTwoBloc, AddAquacultureTwoState,
                      AddAquacultureTwoModel?>(
                    selector: (state) => state.addAquacultureTwoModelObj,
                    builder: (context, addAquacultureTwoModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addAquacultureTwoModelObj?.dropdownItemList1 ?? [],
                        onChanged: (value) {
                          context
                              .read<AddAquacultureTwoBloc>()
                              .add(ChangeDropDown1Event(value: value));
                        },
                      );
                    },
                  ),
                  Container(
                    width: 321.h,
                    margin: EdgeInsets.only(
                      top: 17.v,
                      right: 21.h,
                    ),
                    child: Text(
                      "msg_does_the_household2".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelMediumPrimary_1,
                    ),
                  ),
                  SizedBox(height: 4.v),
                  BlocSelector<AddAquacultureTwoBloc, AddAquacultureTwoState,
                      AddAquacultureTwoModel?>(
                    selector: (state) => state.addAquacultureTwoModelObj,
                    builder: (context, addAquacultureTwoModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addAquacultureTwoModelObj?.dropdownItemList2 ?? [],
                        onChanged: (value) {
                          context
                              .read<AddAquacultureTwoBloc>()
                              .add(ChangeDropDown2Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 18.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomOutlinedButton(
                          text: "lbl_back".tr,
                          margin: EdgeInsets.only(right: 1.h),
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                          buttonTextStyle: CustomTextStyles.bodyLargePrimary_1,
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
  }
}
