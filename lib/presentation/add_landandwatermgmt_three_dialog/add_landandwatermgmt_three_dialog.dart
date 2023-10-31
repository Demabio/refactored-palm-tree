import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/custom_column_checkboxes.dart';

import 'bloc/add_landandwatermgmt_three_bloc.dart';
import 'models/add_landandwatermgmt_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddLandandwatermgmtThreeDialog extends StatelessWidget {
  const AddLandandwatermgmtThreeDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtThreeBloc>(
      create: (context) =>
          AddLandandwatermgmtThreeBloc(AddLandandwatermgmtThreeState(
        addLandandwatermgmtThreeModelObj: AddLandandwatermgmtThreeModel(),
      ))
            ..add(AddLandandwatermgmtThreeInitialEvent()),
      child: AddLandandwatermgmtThreeDialog(),
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
            "msg_add_land_practice".tr,
            style: CustomTextStyles.titleMediumSemiBold,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: BlocSelector<
                  AddLandandwatermgmtThreeBloc,
                  AddLandandwatermgmtThreeState,
                  AddLandandwatermgmtThreeModel?>(
                selector: (state) => state.addLandandwatermgmtThreeModelObj,
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
                            context.read<AddLandandwatermgmtThreeBloc>().add(
                                ChangeCheckbox(value: index, selected: value));
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
        BlocSelector<AddLandandwatermgmtThreeBloc,
            AddLandandwatermgmtThreeState, AddLandandwatermgmtThreeModel?>(
          selector: (state) => state.addLandandwatermgmtThreeModelObj,
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
                          .read<AddLandandwatermgmtThreeBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: ResponsiveExtension(95).h,
                    text: "lbl_add".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () {
                      context.read<AddLandandwatermgmtThreeBloc>().add(AddCBs(
                          models: addRearedLivestockDialogOneModelObj!.models));
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
