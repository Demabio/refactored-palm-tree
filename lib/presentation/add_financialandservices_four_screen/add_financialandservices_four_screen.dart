import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

import 'bloc/add_financialandservices_four_bloc.dart';
import 'models/add_financialandservices_four_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'widgets/irrigation_widget.dart';

class AddFinancialandservicesFourScreen extends StatelessWidget {
  AddFinancialandservicesFourScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesFourBloc>(
      create: (context) =>
          AddFinancialandservicesFourBloc(AddFinancialandservicesFourState(
        addFinancialandservicesFourModelObj: AddFinancialandservicesFourModel(),
      ))
            ..add(AddFinancialandservicesFourInitialEvent()),
      child: AddFinancialandservicesFourScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: DeviceExt((450 / 841) * 100).h,
      height: DeviceExt((450 / 841) * 100).h,
      padding: EdgeInsets.symmetric(
        horizontal: DeviceExt((13 / 841) * 100).h,
        vertical: DeviceExt((16 / 411) * 100).w,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: DeviceExt((3 / 841) * 100).h),
          child: Text(
            "Add Cooperative Group".tr,
            style: CustomTextStyles.titleMediumSemiBold,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: BlocSelector<
                  AddFinancialandservicesFourBloc,
                  AddFinancialandservicesFourState,
                  AddFinancialandservicesFourModel?>(
                selector: (state) => state.addFinancialandservicesFourModelObj,
                builder: (context, addRearedLivestockDialogTwoModelObj) {
                  return Column(
                    children: List<Widget>.generate(
                      addRearedLivestockDialogTwoModelObj
                              ?.ageGroupmModels.length ??
                          0,
                      (index) {
                        CheckBoxList model = addRearedLivestockDialogTwoModelObj
                                ?.ageGroupmModels[index] ??
                            CheckBoxList();

                        return IrrigationProjectGroupItemWidget(
                          model,
                          onSelect: (value) {
                            context.read<AddFinancialandservicesFourBloc>().add(
                                ChangeAgeGroupCheckbox(
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
        BlocSelector<
            AddFinancialandservicesFourBloc,
            AddFinancialandservicesFourState,
            AddFinancialandservicesFourModel?>(
          selector: (state) => state.addFinancialandservicesFourModelObj,
          builder: (context, addRearedLivestockDialogTwoModelObj) {
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
                          .read<AddFinancialandservicesFourBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: DeviceExt((95 / 841) * 100).h,
                    text: "lbl_add".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () {
                      context
                          .read<AddFinancialandservicesFourBloc>()
                          .add(AddCBs(
                            models: addRearedLivestockDialogTwoModelObj!
                                .ageGroupmModels,
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
