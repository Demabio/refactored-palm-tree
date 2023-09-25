import 'bloc/add_aquaculture_four_bloc.dart';
import 'models/add_aquaculture_four_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddAquacultureFourDialog extends StatelessWidget {
  const AddAquacultureFourDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureFourBloc>(
      create: (context) => AddAquacultureFourBloc(AddAquacultureFourState(
        addAquacultureFourModelObj: AddAquacultureFourModel(),
      ))
        ..add(AddAquacultureFourInitialEvent()),
      child: AddAquacultureFourDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 25.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: Text(
              "msg_add_production_system".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 36.v,
            ),
            child: Text(
              "msg_production_system4".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
              AddAquacultureFourModel?>(
            selector: (state) => state.addAquacultureFourModelObj,
            builder: (context, addAquacultureFourModelObj) {
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
                margin: EdgeInsets.symmetric(horizontal: 5.h),
                hintText: "lbl_select".tr,
                items: addAquacultureFourModelObj?.dropdownItemList ?? [],
                onChanged: (value) {
                  context
                      .read<AddAquacultureFourBloc>()
                      .add(ChangeDropDownEvent(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 7.v,
            ),
            child: Text(
              "msg_unit_of_measure".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
              AddAquacultureFourModel?>(
            selector: (state) => state.addAquacultureFourModelObj,
            builder: (context, addAquacultureFourModelObj) {
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
                margin: EdgeInsets.symmetric(horizontal: 5.h),
                hintText: "lbl_select".tr,
                items: addAquacultureFourModelObj?.dropdownItemList1 ?? [],
                onChanged: (value) {
                  context
                      .read<AddAquacultureFourBloc>()
                      .add(ChangeDropDown1Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 7.v,
            ),
            child: Text(
              "msg_number_of_active".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
              AddAquacultureFourModel?>(
            selector: (state) => state.addAquacultureFourModelObj,
            builder: (context, addAquacultureFourModelObj) {
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
                margin: EdgeInsets.symmetric(horizontal: 5.h),
                hintText: "lbl_select".tr,
                items: addAquacultureFourModelObj?.dropdownItemList2 ?? [],
                onChanged: (value) {
                  context
                      .read<AddAquacultureFourBloc>()
                      .add(ChangeDropDown2Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 7.v,
            ),
            child: Text(
              "msg_active_volume_m32".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
              AddAquacultureFourModel?>(
            selector: (state) => state.addAquacultureFourModelObj,
            builder: (context, addAquacultureFourModelObj) {
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
                margin: EdgeInsets.symmetric(horizontal: 5.h),
                hintText: "lbl_select".tr,
                items: addAquacultureFourModelObj?.dropdownItemList3 ?? [],
                onChanged: (value) {
                  context
                      .read<AddAquacultureFourBloc>()
                      .add(ChangeDropDown3Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 7.v,
            ),
            child: Text(
              "msg_number_of_inactive".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
              AddAquacultureFourModel?>(
            selector: (state) => state.addAquacultureFourModelObj,
            builder: (context, addAquacultureFourModelObj) {
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
                margin: EdgeInsets.symmetric(horizontal: 5.h),
                hintText: "lbl_select".tr,
                items: addAquacultureFourModelObj?.dropdownItemList4 ?? [],
                onChanged: (value) {
                  context
                      .read<AddAquacultureFourBloc>()
                      .add(ChangeDropDown4Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 7.v,
            ),
            child: Text(
              "msg_inactive_volume".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
              AddAquacultureFourModel?>(
            selector: (state) => state.addAquacultureFourModelObj,
            builder: (context, addAquacultureFourModelObj) {
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
                margin: EdgeInsets.symmetric(horizontal: 5.h),
                hintText: "lbl_select".tr,
                items: addAquacultureFourModelObj?.dropdownItemList5 ?? [],
                onChanged: (value) {
                  context
                      .read<AddAquacultureFourBloc>()
                      .add(ChangeDropDown5Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 8.v,
              bottom: 29.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  width: 95.h,
                  text: "lbl_add".tr,
                  buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                  buttonTextStyle: CustomTextStyles.bodyLarge16,
                ),
                CustomOutlinedButton(
                  width: 95.h,
                  text: "lbl_close".tr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
