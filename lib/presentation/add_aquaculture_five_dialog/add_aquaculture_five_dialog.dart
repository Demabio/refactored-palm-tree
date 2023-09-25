import 'bloc/add_aquaculture_five_bloc.dart';
import 'models/add_aquaculture_five_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddAquacultureFiveDialog extends StatelessWidget {
  const AddAquacultureFiveDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureFiveBloc>(
      create: (context) => AddAquacultureFiveBloc(AddAquacultureFiveState(
        addAquacultureFiveModelObj: AddAquacultureFiveModel(),
      ))
        ..add(AddAquacultureFiveInitialEvent()),
      child: AddAquacultureFiveDialog(),
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
              top: 10.v,
            ),
            child: Text(
              "lbl_add_fish_reared".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddAquacultureFiveBloc, AddAquacultureFiveState,
              TextEditingController?>(
            selector: (state) => state.searchController,
            builder: (context, searchController) {
              return CustomSearchView(
                margin: EdgeInsets.only(
                  left: 5.h,
                  top: 9.v,
                  right: 5.h,
                ),
                controller: searchController,
                hintText: "lbl_search_fish".tr,
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
              top: 5.v,
            ),
            child: Text(
              "lbl_common_fish".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 12.v,
            ),
            child: Row(
              children: [
                CustomElevatedButton(
                  height: 43.v,
                  width: 95.h,
                  text: "lbl_catfish".tr,
                  buttonTextStyle: CustomTextStyles.bodyMediumPoppinsWhiteA700,
                ),
                CustomElevatedButton(
                  height: 43.v,
                  width: 95.h,
                  text: "lbl_tilapia".tr,
                  margin: EdgeInsets.only(left: 14.h),
                  buttonTextStyle: CustomTextStyles.bodyMediumPoppinsWhiteA700,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 13.v,
            ),
            child: Text(
              "msg_fish_category".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFiveBloc, AddAquacultureFiveState,
              AddAquacultureFiveModel?>(
            selector: (state) => state.addAquacultureFiveModelObj,
            builder: (context, addAquacultureFiveModelObj) {
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
                items: addAquacultureFiveModelObj?.dropdownItemList ?? [],
                onChanged: (value) {
                  context
                      .read<AddAquacultureFiveBloc>()
                      .add(ChangeDropDownEvent(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 13.v,
            ),
            child: Text(
              "lbl_fish_type2".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFiveBloc, AddAquacultureFiveState,
              AddAquacultureFiveModel?>(
            selector: (state) => state.addAquacultureFiveModelObj,
            builder: (context, addAquacultureFiveModelObj) {
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
                items: addAquacultureFiveModelObj?.dropdownItemList1 ?? [],
                onChanged: (value) {
                  context
                      .read<AddAquacultureFiveBloc>()
                      .add(ChangeDropDown1Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 13.v,
            ),
            child: Text(
              "msg_type_of_production".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFiveBloc, AddAquacultureFiveState,
              AddAquacultureFiveModel?>(
            selector: (state) => state.addAquacultureFiveModelObj,
            builder: (context, addAquacultureFiveModelObj) {
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
                items: addAquacultureFiveModelObj?.dropdownItemList2 ?? [],
                onChanged: (value) {
                  context
                      .read<AddAquacultureFiveBloc>()
                      .add(ChangeDropDown2Event(value: value));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 13.v,
            ),
            child: Text(
              "msg_estimated_number".tr,
              style: CustomTextStyles.labelMediumPrimary_1,
            ),
          ),
          BlocSelector<AddAquacultureFiveBloc, AddAquacultureFiveState,
              TextEditingController?>(
            selector: (state) => state.numbervalueoneController,
            builder: (context, numbervalueoneController) {
              return CustomTextFormField(
                controller: numbervalueoneController,
                margin: EdgeInsets.symmetric(horizontal: 5.h),
                hintText: "lbl_number".tr,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                validator: (value) {
                  if (!isNumeric(value)) {
                    return "Please enter valid number";
                  }
                  return null;
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 14.v,
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
