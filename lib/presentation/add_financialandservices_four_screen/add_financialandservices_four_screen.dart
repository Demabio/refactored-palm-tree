import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

import 'bloc/add_financialandservices_four_bloc.dart';
import 'models/add_financialandservices_four_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:sizer/sizer.dart';

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
      width: ResponsiveExtension(344).h,
      height: SizerExt(75).h,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveExtension(13).h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: ResponsiveExtension(3).h),
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
                          .read<AddFinancialandservicesFourBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: ResponsiveExtension(95).h,
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

  _success(BuildContext context) {
    Navigator.pop(context);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }
}
