import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/custom_column_checkboxes.dart';

import 'bloc/add_financialandservices_eight_bloc.dart';
import 'models/add_financialandservices_eight_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddFinancialandservicesEightDialog extends StatelessWidget {
  const AddFinancialandservicesEightDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesEightBloc>(
      create: (context) =>
          AddFinancialandservicesEightBloc(AddFinancialandservicesEightState(
        addFinancialandservicesEightModelObj:
            AddFinancialandservicesEightModel(),
      ))
            ..add(AddFinancialandservicesEightInitialEvent()),
      child: AddFinancialandservicesEightDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 15.v),
      decoration: AppDecoration.fillWhiteA
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 3.h),
          child: Text(
            "Add Extension Mode".tr,
            style: CustomTextStyles.titleMediumSemiBold,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: BlocSelector<
                  AddFinancialandservicesEightBloc,
                  AddFinancialandservicesEightState,
                  AddFinancialandservicesEightModel?>(
                selector: (state) => state.addFinancialandservicesEightModelObj,
                builder: (context, addRearedLivestockDialogTwoModelObj) {
                  return Column(
                    children: List<Widget>.generate(
                      addRearedLivestockDialogTwoModelObj?.models.length ?? 0,
                      (index) {
                        CheckBoxList model = addRearedLivestockDialogTwoModelObj
                                ?.models[index] ??
                            CheckBoxList();

                        return CBListWidget(
                          model,
                          onSelect: (value) {
                            context
                                .read<AddFinancialandservicesEightBloc>()
                                .add(ChangeCheckbox(
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
            AddFinancialandservicesEightBloc,
            AddFinancialandservicesEightState,
            AddFinancialandservicesEightModel?>(
          selector: (state) => state.addFinancialandservicesEightModelObj,
          builder: (context, addRearedLivestockDialogOneModelObj) {
            return Padding(
              padding: EdgeInsets.fromLTRB(ResponsiveExtension(5).h, 44.v,
                  ResponsiveExtension(4).h, 16.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    width: ResponsiveExtension(95).h,
                    text: "lbl_reset".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () {
                      context
                          .read<AddFinancialandservicesEightBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: ResponsiveExtension(95).h,
                    text: "lbl_add".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () {
                      context.read<AddFinancialandservicesEightBloc>().add(
                          AddCBs(
                              models:
                                  addRearedLivestockDialogOneModelObj!.models));
                      Navigator.pop(context);
                    },
                  ),
                  CustomOutlinedButton(
                    width: ResponsiveExtension(95).h,
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
}
