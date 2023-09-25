import 'bloc/add_farmtechandassets_three_bloc.dart';
import 'models/add_farmtechandassets_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_floating_text_field.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class AddFarmtechandassetsThreeDialog extends StatelessWidget {
  const AddFarmtechandassetsThreeDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFarmtechandassetsThreeBloc>(
      create: (context) =>
          AddFarmtechandassetsThreeBloc(AddFarmtechandassetsThreeState(
        addFarmtechandassetsThreeModelObj: AddFarmtechandassetsThreeModel(),
      ))
            ..add(AddFarmtechandassetsThreeInitialEvent()),
      child: AddFarmtechandassetsThreeDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 3.h,
              top: 12.v,
            ),
            child: Text(
              "msg_add_farm_machinery".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddFarmtechandassetsThreeBloc,
              AddFarmtechandassetsThreeState, TextEditingController?>(
            selector: (state) => state.searchController,
            builder: (context, searchController) {
              return CustomSearchView(
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 26.v,
                  right: 5.h,
                ),
                controller: searchController,
                hintText: "lbl_search_asset".tr,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(15.h, 12.v, 9.h, 12.v),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgSearch,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 40.v,
                ),
                suffix: Padding(
                  padding: EdgeInsets.only(
                    right: 15.h,
                  ),
                  child: IconButton(
                    onPressed: () {
                      searchController!.clear();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 41.v,
            ),
            child: Text(
              "lbl_asset_type2".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddFarmtechandassetsThreeBloc,
              AddFarmtechandassetsThreeState, AddFarmtechandassetsThreeModel?>(
            selector: (state) => state.addFarmtechandassetsThreeModelObj,
            builder: (context, addFarmtechandassetsThreeModelObj) {
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
                items:
                    addFarmtechandassetsThreeModelObj?.dropdownItemList ?? [],
                onChanged: (value) {
                  context
                      .read<AddFarmtechandassetsThreeBloc>()
                      .add(ChangeDropDownEvent(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 21.v,
            ),
            child: Text(
              "lbl_asset2".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddFarmtechandassetsThreeBloc,
              AddFarmtechandassetsThreeState, AddFarmtechandassetsThreeModel?>(
            selector: (state) => state.addFarmtechandassetsThreeModelObj,
            builder: (context, addFarmtechandassetsThreeModelObj) {
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
                items:
                    addFarmtechandassetsThreeModelObj?.dropdownItemList1 ?? [],
                onChanged: (value) {
                  context
                      .read<AddFarmtechandassetsThreeBloc>()
                      .add(ChangeDropDown1Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 21.v,
            ),
            child: Text(
              "lbl_quantity2".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddFarmtechandassetsThreeBloc,
              AddFarmtechandassetsThreeState, AddFarmtechandassetsThreeModel?>(
            selector: (state) => state.addFarmtechandassetsThreeModelObj,
            builder: (context, addFarmtechandassetsThreeModelObj) {
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
                items:
                    addFarmtechandassetsThreeModelObj?.dropdownItemList2 ?? [],
                onChanged: (value) {
                  context
                      .read<AddFarmtechandassetsThreeBloc>()
                      .add(ChangeDropDown2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFarmtechandassetsThreeBloc,
              AddFarmtechandassetsThreeState, TextEditingController?>(
            selector: (state) => state.usableConditionController,
            builder: (context, usableConditionController) {
              return CustomFloatingTextField(
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 22.v,
                  right: 5.h,
                ),
                controller: usableConditionController,
                labelText: "msg_is_the_equipment".tr,
                labelStyle: CustomTextStyles.titleMediumBluegray40003,
                hintText: "msg_is_the_equipment".tr,
                hintStyle: CustomTextStyles.titleMediumBluegray40003,
                textInputAction: TextInputAction.done,
                suffix: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.h,
                    ),
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowdownPrimary,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 66.v,
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 21.v,
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
