import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/models/chipvieway_item_model.dart';
import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/widgets/chipvieway_item_widget.dart';

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
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore_for_file: must_be_immutable
class AddAquacultureFiveDialog extends StatelessWidget {
  AddAquacultureFiveDialog({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureFiveBloc>(
      create: (context) => AddAquacultureFiveBloc(AddAquacultureFiveState(
        addAquacultureFiveModelObj: AddAquacultureFiveModel(),
      ))
        ..add(AddAquacultureFiveInitialEvent()),
      child: AddAquacultureFiveDialog(),
    );
  }

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();
  FocusNode node6 = FocusNode();
  FocusNode _firstTextFieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Form(
      key: _formKey,
      child: Container(
        width: DeviceExt((450 / 841) * 100).h,
        height: DeviceExt((450 / 841) * 100).h,
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
                  top: DeviceExt((10 / 411) * 100).w,
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
                    enabled: true,
                    onChanged: (value) {
                      context
                          .read<AddAquacultureFiveBloc>()
                          .add(SearchEventFish(value: value));
                    },
                    margin: EdgeInsets.only(
                      left: DeviceExt((5 / 841) * 100).h,
                      top: DeviceExt((9 / 411) * 100).w,
                      right: DeviceExt((5 / 841) * 100).h,
                    ),
                    controller: searchController,
                    focusNode: _firstTextFieldFocus,
                    autofocus: false,
                    hintText: "lbl_search_fish".tr,
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
                              .read<AddAquacultureFiveBloc>()
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
                child: BlocSelector<AddAquacultureFiveBloc,
                    AddAquacultureFiveState, AddAquacultureFiveModel?>(
                  selector: (state) => state.addAquacultureFiveModelObj,
                  builder: (context, addRearedLivestockOneModelObj) {
                    return !addRearedLivestockOneModelObj!.search
                        ? Wrap(
                            runSpacing: DeviceExt((10 / 411) * 100).w,
                            spacing: DeviceExt((10 / 841) * 100).h,
                            children: List<Widget>.generate(
                              addRearedLivestockOneModelObj.commons.length,
                              (index) {
                                ChipviewayItemModel model =
                                    addRearedLivestockOneModelObj
                                        .commons[index];

                                return ChipviewayItemWidget(
                                  model,
                                  onSelectedChipView: (value) {
                                    context.read<AddAquacultureFiveBloc>().add(
                                        UpdateChipViewEvent(
                                            index: index,
                                            isSelected: value,
                                            model: model));
                                  },
                                );
                              },
                            ),
                          )
                        : Wrap(
                            runSpacing: DeviceExt((10 / 411) * 100).w,
                            spacing: DeviceExt((10 / 841) * 100).h,
                            children: List<Widget>.generate(
                              addRearedLivestockOneModelObj
                                  .searchResults.length,
                              (index) {
                                ChipviewayItemModel model =
                                    addRearedLivestockOneModelObj
                                        .searchResults[index];

                                return ChipviewayItemWidget(
                                  model,
                                  onSelectedChipView: (value) {
                                    _firstTextFieldFocus.unfocus();
                                    context.read<AddAquacultureFiveBloc>().add(
                                        UpdateChipViewEvent(
                                            index: index,
                                            isSelected: value,
                                            model: model));
                                  },
                                );
                              },
                            ),
                          );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((13 / 411) * 100).w,
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
                    val: addAquacultureFiveModelObj?.selectedCategory,
                    hintText: "lbl_select".tr,
                    items: addAquacultureFiveModelObj!.dropdownItemList.isEmpty
                        ? []
                        : addAquacultureFiveModelObj.dropdownItemList,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((13 / 411) * 100).w,
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
                    val: addAquacultureFiveModelObj?.selectedFish,
                    hintText: "lbl_select".tr,
                    items: addAquacultureFiveModelObj!.dropdownItemList1.isEmpty
                        ? []
                        : addAquacultureFiveModelObj.dropdownItemList1,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((13 / 411) * 100).w,
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
                    val: addAquacultureFiveModelObj?.selectedDropDownValue2,
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((13 / 411) * 100).w,
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
                    margin: EdgeInsets.symmetric(
                        horizontal: DeviceExt((5 / 841) * 100).h),
                    hintText: "lbl_number".tr,
                    autofocus: false,
                    focusNode: node1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (!isNumeric(value, isRequired: true)) {
                        return "Please enter valid number";
                      }
                      return null;
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((14 / 411) * 100).w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      width: DeviceExt((95 / 841) * 100).h,
                      text: "lbl_add".tr,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AddAquacultureFiveBloc>().add(AddCBs(
                                createSuccessful: () {
                                  _success(context);
                                },
                                createFailed: () {
                                  _failed(context);
                                },
                              ));
                        }
                      },
                      buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                      buttonTextStyle: CustomTextStyles.bodyLarge16,
                    ),
                    CustomOutlinedButton(
                      width: DeviceExt((95 / 841) * 100).h,
                      text: "lbl_close".tr,
                      onTap: () => Navigator.pop(context),
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
