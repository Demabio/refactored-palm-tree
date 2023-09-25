import 'bloc/add_financialandservices_two_bloc.dart';
import 'models/add_financialandservices_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class AddFinancialandservicesTwoScreen extends StatelessWidget {
  const AddFinancialandservicesTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesTwoBloc>(
      create: (context) =>
          AddFinancialandservicesTwoBloc(AddFinancialandservicesTwoState(
        addFinancialandservicesTwoModelObj: AddFinancialandservicesTwoModel(),
      ))
            ..add(AddFinancialandservicesTwoInitialEvent()),
      child: AddFinancialandservicesTwoScreen(),
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
          title: AppbarSubtitle4(
            text: "msg_financial_and_services2".tr,
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
                    "msg_do_you_insure_your5".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddFinancialandservicesTwoBloc,
                      AddFinancialandservicesTwoState,
                      AddFinancialandservicesTwoModel?>(
                    selector: (state) =>
                        state.addFinancialandservicesTwoModelObj,
                    builder: (context, addFinancialandservicesTwoModelObj) {
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
                        items: addFinancialandservicesTwoModelObj
                                ?.dropdownItemList ??
                            [],
                        onChanged: (value) {
                          context
                              .read<AddFinancialandservicesTwoBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_do_you_insure_your6".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddFinancialandservicesTwoBloc,
                      AddFinancialandservicesTwoState,
                      AddFinancialandservicesTwoModel?>(
                    selector: (state) =>
                        state.addFinancialandservicesTwoModelObj,
                    builder: (context, addFinancialandservicesTwoModelObj) {
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
                        items: addFinancialandservicesTwoModelObj
                                ?.dropdownItemList1 ??
                            [],
                        onChanged: (value) {
                          context
                              .read<AddFinancialandservicesTwoBloc>()
                              .add(ChangeDropDown1Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_do_you_keep_written2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddFinancialandservicesTwoBloc,
                      AddFinancialandservicesTwoState,
                      AddFinancialandservicesTwoModel?>(
                    selector: (state) =>
                        state.addFinancialandservicesTwoModelObj,
                    builder: (context, addFinancialandservicesTwoModelObj) {
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
                        items: addFinancialandservicesTwoModelObj
                                ?.dropdownItemList2 ??
                            [],
                        onChanged: (value) {
                          context
                              .read<AddFinancialandservicesTwoBloc>()
                              .add(ChangeDropDown2Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_do_you_insure_your7".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddFinancialandservicesTwoBloc,
                      AddFinancialandservicesTwoState,
                      AddFinancialandservicesTwoModel?>(
                    selector: (state) =>
                        state.addFinancialandservicesTwoModelObj,
                    builder: (context, addFinancialandservicesTwoModelObj) {
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
                        items: addFinancialandservicesTwoModelObj
                                ?.dropdownItemList3 ??
                            [],
                        onChanged: (value) {
                          context
                              .read<AddFinancialandservicesTwoBloc>()
                              .add(ChangeDropDown3Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_do_you_insure_your8".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddFinancialandservicesTwoBloc,
                      AddFinancialandservicesTwoState,
                      AddFinancialandservicesTwoModel?>(
                    selector: (state) =>
                        state.addFinancialandservicesTwoModelObj,
                    builder: (context, addFinancialandservicesTwoModelObj) {
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
                        items: addFinancialandservicesTwoModelObj
                                ?.dropdownItemList4 ??
                            [],
                        onChanged: (value) {
                          context
                              .read<AddFinancialandservicesTwoBloc>()
                              .add(ChangeDropDown4Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 18.v),
                  Text(
                    "msg_agricultural_info".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Container(
                    width: 255.h,
                    margin: EdgeInsets.only(
                      top: 16.v,
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
                    "msg_soil_seeds_and".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_extension_access".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddFinancialandservicesTwoBloc,
                      AddFinancialandservicesTwoState,
                      AddFinancialandservicesTwoModel?>(
                    selector: (state) =>
                        state.addFinancialandservicesTwoModelObj,
                    builder: (context, addFinancialandservicesTwoModelObj) {
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
                        items: addFinancialandservicesTwoModelObj
                                ?.dropdownItemList5 ??
                            [],
                        onChanged: (value) {
                          context
                              .read<AddFinancialandservicesTwoBloc>()
                              .add(ChangeDropDown5Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 18.v),
                  Text(
                    "msg_if_yes_from_where".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  CustomElevatedButton(
                    text: "msg_add_extension_access".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 30.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  Container(
                    width: 309.h,
                    margin: EdgeInsets.only(
                      top: 17.v,
                      right: 33.h,
                    ),
                    child: Text(
                      "msg_what_is_the_mode2".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "lbl_add_mode".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 8.v,
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
