import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/custom_column_checkboxes.dart';

import 'bloc/add_farmtechandassets_five_bloc.dart';
import 'models/add_farmtechandassets_five_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore_for_file: must_be_immutable
class AddFarmtechandassetsFiveDialog extends StatelessWidget {
  AddFarmtechandassetsFiveDialog({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFarmtechandassetsFiveBloc>(
      create: (context) =>
          AddFarmtechandassetsFiveBloc(AddFarmtechandassetsFiveState(
        addFarmtechandassetsFiveModelObj: AddFarmtechandassetsFiveModel(),
      ))
            ..add(AddFarmtechandassetsFiveInitialEvent()),
      child: AddFarmtechandassetsFiveDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Form(
      key: _formKey,
      child: Container(
        width: DeviceExt((450 / 841) * 100).h,
        height: DeviceExt((650 / 841) * 100).h,
        padding: EdgeInsets.symmetric(
            horizontal: DeviceExt((13 / 841) * 100).h,
            vertical: DeviceExt((15 / 411) * 100).w),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: DeviceExt((3 / 841) * 100).h),
            child: Text(
              "Add LabourSource".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: BlocSelector<
                    AddFarmtechandassetsFiveBloc,
                    AddFarmtechandassetsFiveState,
                    AddFarmtechandassetsFiveModel?>(
                  selector: (state) => state.addFarmtechandassetsFiveModelObj,
                  builder: (context, addRearedLivestockDialogFiveModelObj) {
                    return Column(
                      children: List<Widget>.generate(
                        addRearedLivestockDialogFiveModelObj?.models.length ??
                            0,
                        (index) {
                          CheckBoxList model =
                              addRearedLivestockDialogFiveModelObj
                                      ?.models[index] ??
                                  CheckBoxList();

                          return CBListWidget(
                            model,
                            onSelect: (value) {
                              context.read<AddFarmtechandassetsFiveBloc>().add(
                                  ChangeCheckbox(
                                      value: index, selected: value));
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          BlocSelector<AddFarmtechandassetsFiveBloc,
              AddFarmtechandassetsFiveState, AddFarmtechandassetsFiveModel?>(
            selector: (state) => state.addFarmtechandassetsFiveModelObj,
            builder: (context, addRearedLivestockDialogOneModelObj) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    DeviceExt((5 / 841) * 100).h,
                    DeviceExt((44 / 411) * 100).w,
                    DeviceExt((4 / 841) * 100).h,
                    DeviceExt((16 / 411) * 100).w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      width: DeviceExt((95 / 841) * 100).h,
                      text: "lbl_reset".tr,
                      buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                      buttonTextStyle: CustomTextStyles.bodyLarge16,
                      onTap: () {
                        context
                            .read<AddFarmtechandassetsFiveBloc>()
                            .add(ResetCBs());
                      },
                    ),
                    CustomElevatedButton(
                      width: DeviceExt((95 / 841) * 100).h,
                      text: "lbl_add".tr,
                      buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                      buttonTextStyle: CustomTextStyles.bodyLarge16,
                      onTap: () {
                        context.read<AddFarmtechandassetsFiveBloc>().add(AddCBs(
                              models:
                                  addRearedLivestockDialogOneModelObj!.models,
                              createSuccessful: () {
                                _success(context);
                              },
                              createFailed: () {
                                _failed(context);
                              },
                            ));
                      },
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
              );
            },
          ),
        ]),
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
