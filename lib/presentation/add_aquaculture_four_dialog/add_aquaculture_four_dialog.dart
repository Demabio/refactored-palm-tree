import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import 'bloc/add_aquaculture_four_bloc.dart';
import 'models/add_aquaculture_four_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddAquacultureFourDialog extends StatelessWidget {
  AddAquacultureFourDialog({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureFourBloc>(
      create: (context) => AddAquacultureFourBloc(AddAquacultureFourState(
        addAquacultureFourModelObj: AddAquacultureFourModel(),
      ))
        ..add(AddAquacultureFourInitialEvent()),
      child: AddAquacultureFourDialog(),
    );
  }

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();
  FocusNode node6 = FocusNode();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Form(
      key: _formKey,
      child: Container(
        width: 344.h,
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 25.v,
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
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      }
                    },
                    val: addAquacultureFourModelObj?.selectedDropDownValue,
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
                    val: addAquacultureFourModelObj?.selectedDropDownValue1,
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      }
                    },
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
                  TextEditingController?>(
                selector: (state) => state.inp1,
                builder: (context, numbervalueoneController1) {
                  return CustomTextFormField(
                    autofocus: false,
                    focusNode: node1,
                    controller: numbervalueoneController1,
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    hintText: "lbl_number".tr,
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
                  left: 5.h,
                  top: 7.v,
                ),
                child: Text(
                  "msg_active_volume_m32".tr,
                  style: CustomTextStyles.labelMediumPrimary_1,
                ),
              ),
              BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
                  TextEditingController?>(
                selector: (state) => state.inp2,
                builder: (context, numbervalueoneController2) {
                  return CustomTextFormField(
                    focusNode: node2,
                    autofocus: false,
                    controller: numbervalueoneController2,
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    hintText: "lbl_number".tr,
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
                  left: 5.h,
                  top: 7.v,
                ),
                child: Text(
                  "msg_number_of_inactive".tr,
                  style: CustomTextStyles.labelMediumPrimary_1,
                ),
              ),
              BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
                  TextEditingController?>(
                selector: (state) => state.inp3,
                builder: (context, numbervalueoneController3) {
                  return CustomTextFormField(
                    focusNode: node3,
                    autofocus: false,
                    controller: numbervalueoneController3,
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    hintText: "lbl_number".tr,
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
                  left: 5.h,
                  top: 7.v,
                ),
                child: Text(
                  "msg_inactive_volume".tr,
                  style: CustomTextStyles.labelMediumPrimary_1,
                ),
              ),
              BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
                  TextEditingController?>(
                selector: (state) => state.inp4,
                builder: (context, numbervalueoneController4) {
                  return CustomTextFormField(
                    autofocus: false,
                    focusNode: node4,
                    controller: numbervalueoneController4,
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                    hintText: "lbl_number".tr,
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
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AddAquacultureFourBloc>().add(AddCBs(
                                createSuccessful: () {
                                  _success(context);
                                },
                                createFailed: () {
                                  _failed(context);
                                },
                              ));
                        }
                      },
                    ),
                    CustomOutlinedButton(
                      width: 95.h,
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
