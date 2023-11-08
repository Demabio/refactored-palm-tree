import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/widgets/irrigation_widget.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'bloc/add_landandwatermgmt_six_bloc.dart';
import 'models/add_landandwatermgmt_six_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

class AddLandandwatermgmtSixScreen extends StatelessWidget {
  const AddLandandwatermgmtSixScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLandandwatermgmtSixBloc>(
      create: (context) =>
          AddLandandwatermgmtSixBloc(AddLandandwatermgmtSixState(
        addLandandwatermgmtSixModelObj: AddLandandwatermgmtSixModel(),
      ))
            ..add(AddLandandwatermgmtSixInitialEvent()),
      child: AddLandandwatermgmtSixScreen(),
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
        Expanded(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: BlocSelector<AddLandandwatermgmtSixBloc,
                  AddLandandwatermgmtSixState, AddLandandwatermgmtSixModel?>(
                selector: (state) => state.addLandandwatermgmtSixModelObj,
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
                            context.read<AddLandandwatermgmtSixBloc>().add(
                                ChangeAgeGroupCheckbox(
                                    value: index, selected: value));
                          },
                          onSelectCB: (p0) {
                            context
                                .read<AddLandandwatermgmtSixBloc>()
                                .add(ChangeDropDownEvent(
                                  id: index,
                                  value: p0,
                                ));
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
        BlocSelector<AddLandandwatermgmtSixBloc, AddLandandwatermgmtSixState,
            AddLandandwatermgmtSixModel?>(
          selector: (state) => state.addLandandwatermgmtSixModelObj,
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
                          .read<AddLandandwatermgmtSixBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: DeviceExt((95 / 841) * 100).h,
                    text: "lbl_add".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () {
                      context.read<AddLandandwatermgmtSixBloc>().add(AddCBs(
                          models: addRearedLivestockDialogTwoModelObj!
                              .ageGroupmModels));
                      Navigator.pop(context);
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
}
