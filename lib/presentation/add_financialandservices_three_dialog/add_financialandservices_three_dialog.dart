import 'bloc/add_financialandservices_three_bloc.dart';
import 'models/add_financialandservices_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddFinancialandservicesThreeDialog extends StatelessWidget {
  const AddFinancialandservicesThreeDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesThreeBloc>(
      create: (context) =>
          AddFinancialandservicesThreeBloc(AddFinancialandservicesThreeState(
        addFinancialandservicesThreeModelObj:
            AddFinancialandservicesThreeModel(),
      ))
            ..add(AddFinancialandservicesThreeInitialEvent()),
      child: AddFinancialandservicesThreeDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "lbl_income_source".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          BlocSelector<AddFinancialandservicesThreeBloc,
              AddFinancialandservicesThreeState, bool?>(
            selector: (state) => state.trash,
            builder: (context, trash) {
              return CustomCheckboxButton(
                text: "msg_sale_of_farming".tr,
                value: trash,
                margin: EdgeInsets.only(
                  left: 12.h,
                  top: 37.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesThreeBloc>()
                      .add(ChangeCheckBoxEvent(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesThreeBloc,
              AddFinancialandservicesThreeState, bool?>(
            selector: (state) => state.nonFarmTrading,
            builder: (context, nonFarmTrading) {
              return CustomCheckboxButton(
                text: "msg_non_farm_trading".tr,
                value: nonFarmTrading,
                margin: EdgeInsets.only(
                  left: 12.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesThreeBloc>()
                      .add(ChangeCheckBox1Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesThreeBloc,
              AddFinancialandservicesThreeState, bool?>(
            selector: (state) => state.trashone,
            builder: (context, trashone) {
              return CustomCheckboxButton(
                text: "msg_salary_from_employment".tr,
                value: trashone,
                margin: EdgeInsets.only(
                  left: 12.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesThreeBloc>()
                      .add(ChangeCheckBox2Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesThreeBloc,
              AddFinancialandservicesThreeState, bool?>(
            selector: (state) => state.trashtwo,
            builder: (context, trashtwo) {
              return CustomCheckboxButton(
                text: "msg_casual_labor_elsewhere".tr,
                value: trashtwo,
                margin: EdgeInsets.only(
                  left: 12.h,
                  top: 15.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesThreeBloc>()
                      .add(ChangeCheckBox3Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesThreeBloc,
              AddFinancialandservicesThreeState, bool?>(
            selector: (state) => state.remittancesvalu,
            builder: (context, remittancesvalu) {
              return CustomCheckboxButton(
                text: "lbl_remittances".tr,
                value: remittancesvalu,
                margin: EdgeInsets.only(
                  left: 12.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesThreeBloc>()
                      .add(ChangeCheckBox4Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesThreeBloc,
              AddFinancialandservicesThreeState, bool?>(
            selector: (state) => state.pensionvalue,
            builder: (context, pensionvalue) {
              return CustomCheckboxButton(
                text: "lbl_pension".tr,
                value: pensionvalue,
                margin: EdgeInsets.only(
                  left: 12.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesThreeBloc>()
                      .add(ChangeCheckBox5Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesThreeBloc,
              AddFinancialandservicesThreeState, bool?>(
            selector: (state) => state.otherIncomeSour,
            builder: (context, otherIncomeSour) {
              return CustomCheckboxButton(
                text: "msg_other_income_source".tr,
                value: otherIncomeSour,
                margin: EdgeInsets.only(
                  left: 12.h,
                  top: 17.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesThreeBloc>()
                      .add(ChangeCheckBox6Event(value: value));
                },
              );
            },
          ),
          BlocSelector<AddFinancialandservicesThreeBloc,
              AddFinancialandservicesThreeState, bool?>(
            selector: (state) => state.cashTransfer,
            builder: (context, cashTransfer) {
              return CustomCheckboxButton(
                text: "lbl_cash_transfer".tr,
                value: cashTransfer,
                margin: EdgeInsets.only(
                  left: 12.h,
                  top: 16.v,
                ),
                onChange: (value) {
                  context
                      .read<AddFinancialandservicesThreeBloc>()
                      .add(ChangeCheckBox7Event(value: value));
                },
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.h, 29.v, 7.h, 17.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.h,
                      vertical: 12.v,
                    ),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder6,
                    ),
                    child: Text(
                      "lbl_reset".tr,
                      style: CustomTextStyles.bodyLarge16,
                    ),
                  ),
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
          ),
        ],
      ),
    );
  }
}
