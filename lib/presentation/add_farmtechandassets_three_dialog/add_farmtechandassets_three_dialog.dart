import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_three_dialog/models/chipvieway_item_model.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import 'bloc/add_farmtechandassets_three_bloc.dart';
import 'models/add_farmtechandassets_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';

import 'widgets/chipvieway_item_widget.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore_for_file: must_be_immutable
class AddFarmtechandassetsThreeDialog extends StatelessWidget {
  AddFarmtechandassetsThreeDialog({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  FocusNode node = FocusNode();
  FocusNode node2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Form(
      key: _formKey,
      child: Container(
        width: DeviceExt((344 / 841) * 100).h,
        padding: EdgeInsets.symmetric(
          horizontal: DeviceExt((11 / 841) * 100).h,
          vertical: DeviceExt((13 / 411) * 100).w,
        ),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder6,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: DeviceExt((3 / 841) * 100).h,
                  top: DeviceExt((12 / 411) * 100).w,
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
                    onChanged: (value) {
                      context
                          .read<AddFarmtechandassetsThreeBloc>()
                          .add(SearchEventFish(value: value));
                    },
                    focusNode: node2,
                    enabled: true,
                    autofocus: false,
                    margin: EdgeInsets.only(
                      left: DeviceExt((5 / 841) * 100).h,
                      top: DeviceExt((26 / 411) * 100).w,
                      right: DeviceExt((5 / 841) * 100).h,
                    ),
                    controller: searchController,
                    hintText: "lbl_search_asset".tr,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(
                          DeviceExt((15 / 841) * 100).h,
                          DeviceExt((12 / 411) * 100).w,
                          DeviceExt((9 / 841) * 100).h,
                          DeviceExt((12 / 411) * 100).w),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: DeviceExt((40 / 411) * 100).w,
                    ),
                    suffix: Padding(
                      padding: EdgeInsets.only(
                        right: DeviceExt((15 / 841) * 100).h,
                      ),
                      child: IconButton(
                        onPressed: () {
                          searchController!.clear();
                          context
                              .read<AddFarmtechandassetsThreeBloc>()
                              .add(ReturnCommonEvent());
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
              SizedBox(height: DeviceExt((20 / 411) * 100).w),
              Align(
                alignment: Alignment.center,
                child: BlocSelector<
                    AddFarmtechandassetsThreeBloc,
                    AddFarmtechandassetsThreeState,
                    AddFarmtechandassetsThreeModel?>(
                  selector: (state) => state.addFarmtechandassetsThreeModelObj,
                  builder: (context, addRearedLivestockOneModelObj) {
                    return Visibility(
                      visible: addRearedLivestockOneModelObj!.search,
                      child: Wrap(
                        runSpacing: DeviceExt((10 / 411) * 100).w,
                        spacing: DeviceExt((10 / 841) * 100).h,
                        children: List<Widget>.generate(
                          addRearedLivestockOneModelObj.searchResults.length,
                          (index) {
                            ChipviewayItemModel model =
                                addRearedLivestockOneModelObj
                                    .searchResults[index];

                            return ChipviewayItemWidget(
                              model,
                              onSelectedChipView: (value) {
                                context
                                    .read<AddFarmtechandassetsThreeBloc>()
                                    .add(UpdateChipViewEvent(
                                        index: index,
                                        isSelected: value,
                                        model: model));
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((41 / 411) * 100).w,
                ),
                child: Text(
                  "lbl_asset_type2".tr,
                  style: CustomTextStyles.labelMediumPrimary_1,
                ),
              ),
              BlocSelector<
                  AddFarmtechandassetsThreeBloc,
                  AddFarmtechandassetsThreeState,
                  AddFarmtechandassetsThreeModel?>(
                selector: (state) => state.addFarmtechandassetsThreeModelObj,
                builder: (context, addFarmtechandassetsThreeModelObj) {
                  return CustomDropDown(
                    icon: Container(
                      margin:
                          EdgeInsets.only(left: DeviceExt((30 / 841) * 100).h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          DeviceExt((10 / 841) * 100).h,
                        ),
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgArrowdownPrimary,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: DeviceExt((5 / 841) * 100).h),
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      } else {
                        return null;
                      }
                    },
                    val: addFarmtechandassetsThreeModelObj?.selectedCategory,
                    hintText: "lbl_select".tr,
                    items:
                        addFarmtechandassetsThreeModelObj?.dropdownItemList ??
                            [],
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((21 / 411) * 100).w,
                ),
                child: Text(
                  "lbl_asset2".tr,
                  style: CustomTextStyles.labelMediumPrimary_1,
                ),
              ),
              BlocSelector<
                  AddFarmtechandassetsThreeBloc,
                  AddFarmtechandassetsThreeState,
                  AddFarmtechandassetsThreeModel?>(
                selector: (state) => state.addFarmtechandassetsThreeModelObj,
                builder: (context, addFarmtechandassetsThreeModelObj) {
                  return CustomDropDown(
                    icon: Container(
                      margin:
                          EdgeInsets.only(left: DeviceExt((30 / 841) * 100).h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          DeviceExt((10 / 841) * 100).h,
                        ),
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgArrowdownPrimary,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: DeviceExt((5 / 841) * 100).h),
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      } else {
                        return null;
                      }
                    },
                    val: addFarmtechandassetsThreeModelObj?.selected,
                    hintText: "lbl_select".tr,
                    items:
                        addFarmtechandassetsThreeModelObj?.dropdownItemList1 ??
                            [],
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((21 / 411) * 100).w,
                ),
                child: Text(
                  "Quantity (*)".tr,
                  style: CustomTextStyles.labelMediumPrimary_1,
                ),
              ),
              BlocSelector<AddFarmtechandassetsThreeBloc,
                  AddFarmtechandassetsThreeState, TextEditingController?>(
                selector: (state) => state.usableConditionController,
                builder: (context, usableConditionController) {
                  return CustomTextFormField(
                    margin: EdgeInsets.only(
                      left: DeviceExt((5 / 841) * 100).h,
                      top: DeviceExt((22 / 411) * 100).w,
                      right: DeviceExt((5 / 841) * 100).h,
                    ),
                    controller: usableConditionController,
                    autofocus: false,
                    focusNode: node,
                    hintText: "Number".tr,
                    validator: (value) {
                      if (!isNumeric(
                        value,
                        isRequired: true,
                      )) {
                        return "Field is Required";
                      } else {
                        return null;
                      }
                    },
                    hintStyle: CustomTextStyles.titleMediumBluegray40003,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((21 / 411) * 100).w,
                ),
                child: Text(
                  "msg_is_the_equipment".tr,
                  style: CustomTextStyles.labelMediumPrimary_1,
                ),
              ),
              BlocSelector<
                  AddFarmtechandassetsThreeBloc,
                  AddFarmtechandassetsThreeState,
                  AddFarmtechandassetsThreeModel?>(
                selector: (state) => state.addFarmtechandassetsThreeModelObj,
                builder: (context, addFarmtechandassetsThreeModelObj) {
                  return CustomDropDown(
                    icon: Container(
                      margin:
                          EdgeInsets.only(left: DeviceExt((30 / 841) * 100).h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          DeviceExt((10 / 841) * 100).h,
                        ),
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgArrowdownPrimary,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: DeviceExt((5 / 841) * 100).h),
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      } else {
                        return null;
                      }
                    },
                    val: addFarmtechandassetsThreeModelObj
                        ?.selectedDropDownValue2,
                    hintText: "lbl_select".tr,
                    items:
                        addFarmtechandassetsThreeModelObj?.dropdownItemList2 ??
                            [],
                    onChanged: (value) {
                      context
                          .read<AddFarmtechandassetsThreeBloc>()
                          .add(ChangeDropDown2Event(value: value));
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((21 / 411) * 100).w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<AddFarmtechandassetsThreeBloc>()
                              .add(AddCBs(
                                createSuccessful: () {
                                  _success(context);
                                },
                                createFailed: () {
                                  _failed(context);
                                },
                              ));
                        }
                      },
                      width: DeviceExt((95 / 841) * 100).h,
                      text: "lbl_add".tr,
                      buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                      buttonTextStyle: CustomTextStyles.bodyLarge16,
                    ),
                    CustomOutlinedButton(
                      width: DeviceExt((95 / 841) * 100).h,
                      text: "lbl_close".tr,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _success(BuildContext context) {
    Navigator.pop(context);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }
}
