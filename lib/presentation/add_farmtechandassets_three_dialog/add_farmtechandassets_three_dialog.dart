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
        width: 344.h,
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 13.v,
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
                    onChanged: (value) {
                      context
                          .read<AddFarmtechandassetsThreeBloc>()
                          .add(SearchEventFish(value: value));
                    },
                    focusNode: node2,
                    enabled: true,
                    autofocus: false,
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
              SizedBox(height: 20.v),
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
                        runSpacing: 10.v,
                        spacing: 10.h,
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
                  left: 5.h,
                  top: 41.v,
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
                  left: 5.h,
                  top: 21.v,
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
                  left: 5.h,
                  top: 21.v,
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
                      left: 5.h,
                      top: 22.v,
                      right: 5.h,
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
                  left: 5.h,
                  top: 21.v,
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
                  left: 5.h,
                  top: 21.v,
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
                      width: 95.h,
                      text: "lbl_add".tr,
                      buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                      buttonTextStyle: CustomTextStyles.bodyLarge16,
                    ),
                    CustomOutlinedButton(
                      width: 95.h,
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
