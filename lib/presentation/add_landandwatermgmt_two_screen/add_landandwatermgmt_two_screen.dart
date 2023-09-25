import 'bloc/add_landandwatermgmt_two_bloc.dart';
import 'models/add_landandwatermgmt_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

class AddLandandwatermgmtTwoScreen extends StatelessWidget {
  const AddLandandwatermgmtTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtTwoBloc>(
      create: (context) =>
          AddLandandwatermgmtTwoBloc(AddLandandwatermgmtTwoState(
        addLandandwatermgmtTwoModelObj: AddLandandwatermgmtTwoModel(),
      ))
            ..add(AddLandandwatermgmtTwoInitialEvent()),
      child: AddLandandwatermgmtTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          title: AppbarSubtitle4(
            text: "msg_land_and_water_management2".tr,
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
                    "msg_do_you_undertake2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddLandandwatermgmtTwoBloc,
                      AddLandandwatermgmtTwoState,
                      AddLandandwatermgmtTwoModel?>(
                    selector: (state) => state.addLandandwatermgmtTwoModelObj,
                    builder: (context, addLandandwatermgmtTwoModelObj) {
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
                            addLandandwatermgmtTwoModelObj?.dropdownItemList ??
                                [],
                        onChanged: (value) {
                          context
                              .read<AddLandandwatermgmtTwoBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        },
                      );
                    },
                  ),
                  Container(
                    width: 255.h,
                    margin: EdgeInsets.only(
                      top: 17.v,
                      right: 87.h,
                    ),
                    child: Text(
                      "msg_if_yes_what_type2".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "msg_add_undertaken_irrigation".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 9.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_type_and_name_of2".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  CustomElevatedButton(
                    text: "msg_add_irrigation_project".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 31.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  Container(
                    width: 244.h,
                    margin: EdgeInsets.only(
                      top: 17.v,
                      right: 98.h,
                    ),
                    child: Text(
                      "msg_for_irrigation_schemes".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "msg_add_implementing".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 7.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_total_area_under".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddLandandwatermgmtTwoBloc,
                      AddLandandwatermgmtTwoState, TextEditingController?>(
                    selector: (state) => state.areavalueoneController,
                    builder: (context, areavalueoneController) {
                      return CustomTextFormField(
                        controller: areavalueoneController,
                        hintText: "lbl_area".tr,
                        textInputAction: TextInputAction.done,
                      );
                    },
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "lbl_unit_of_area2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddLandandwatermgmtTwoBloc,
                      AddLandandwatermgmtTwoState,
                      AddLandandwatermgmtTwoModel?>(
                    selector: (state) => state.addLandandwatermgmtTwoModelObj,
                    builder: (context, addLandandwatermgmtTwoModelObj) {
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
                            addLandandwatermgmtTwoModelObj?.dropdownItemList1 ??
                                [],
                        onChanged: (value) {
                          context
                              .read<AddLandandwatermgmtTwoBloc>()
                              .add(ChangeDropDown1Event(value: value));
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
