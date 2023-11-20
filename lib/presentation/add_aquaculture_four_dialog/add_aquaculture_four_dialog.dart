import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

import 'bloc/add_aquaculture_four_bloc.dart';
import 'models/add_aquaculture_four_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
  FocusNode node7 = FocusNode();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Form(
      key: _formKey,
      child: Container(
        width: DeviceExt((450 / 841) * 100).h,
        height: DeviceExt((650 / 841) * 100).h,
        padding: EdgeInsets.symmetric(
          horizontal: DeviceExt((11 / 841) * 100).h,
          vertical: DeviceExt((25 / 411) * 100).w,
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
                padding: EdgeInsets.only(left: DeviceExt((3 / 841) * 100).h),
                child: Text(
                  "msg_add_production_system".tr,
                  style: CustomTextStyles.titleMediumSemiBold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((36 / 411) * 100).w,
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
                    hintText: "lbl_select".tr,
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      } else {
                        return null;
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
              BlocSelector<AddAquacultureFourBloc, AddAquacultureFourState,
                      AddAquacultureFourState>(
                  selector: (state) => state,
                  builder: (context, state) {
                    RegExp pattern = RegExp(r'\b(?:Other|other)\b');
                    bool isOther = pattern.hasMatch(state
                            .addAquacultureFourModelObj
                            ?.selectedDropDownValue
                            ?.title ??
                        "");
                    return Visibility(
                      visible: isOther,
                      child: Column(
                        children: [
                          Text(
                            "Specify Other".tr,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.labelMediumPrimary_1,
                          ),
                          CustomTextFormField(
                              margin: EdgeInsets.only(top: DeviceExt(3).h),
                              focusNode: node7,
                              controller: state.other,
                              autofocus: false,
                              hintText: "Other".tr,
                              textInputType: TextInputType.text,
                              validator: (value) {
                                if (isNotEmpty(value)) {
                                  return "Field is required.";
                                }
                                return null;
                              }),
                        ],
                      ),
                    );
                  }),
              Padding(
                padding: EdgeInsets.only(
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((7 / 411) * 100).w,
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
                    hintText: "lbl_select".tr,
                    val: addAquacultureFourModelObj?.selectedDropDownValue1,
                    validator: (value) {
                      if (value == null) {
                        return "Field is required";
                      } else {
                        return null;
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((7 / 411) * 100).w,
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
                    margin: EdgeInsets.symmetric(
                        horizontal: DeviceExt((5 / 841) * 100).h),
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((7 / 411) * 100).w,
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
                    margin: EdgeInsets.symmetric(
                        horizontal: DeviceExt((5 / 841) * 100).h),
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((7 / 411) * 100).w,
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
                    margin: EdgeInsets.symmetric(
                        horizontal: DeviceExt((5 / 841) * 100).h),
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((7 / 411) * 100).w,
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
                    margin: EdgeInsets.symmetric(
                        horizontal: DeviceExt((5 / 841) * 100).h),
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
                  left: DeviceExt((5 / 841) * 100).h,
                  top: DeviceExt((8 / 411) * 100).w,
                  bottom: DeviceExt((29 / 411) * 100).w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      width: DeviceExt((95 / 841) * 100).h,
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
