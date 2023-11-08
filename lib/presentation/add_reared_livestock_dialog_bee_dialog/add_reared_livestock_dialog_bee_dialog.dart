import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/widgets/feeds_widget.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'bloc/add_reared_livestock_dialog_bee_bloc.dart';
import 'models/add_reared_livestock_dialog_bee_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AddRearedLivestockDialogBeeDialog extends StatelessWidget {
  AddRearedLivestockDialogBeeDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddRearedLivestockDialogBeeBloc>(
      create: (context) =>
          AddRearedLivestockDialogBeeBloc(AddRearedLivestockDialogBeeState(
        addRearedLivestockDialogTwoModelObj: AddRearedLivestockDialogBeeModel(),
      ))
            ..add(AddRearedLivestockDialogBeeInitialEvent()),
      child: AddRearedLivestockDialogBeeDialog(),
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
              child: BlocSelector<
                  AddRearedLivestockDialogBeeBloc,
                  AddRearedLivestockDialogBeeState,
                  AddRearedLivestockDialogBeeModel?>(
                selector: (state) => state.addRearedLivestockDialogTwoModelObj,
                builder: (context, addRearedLivestockDialogTwoModelObj) {
                  return Column(
                    children: List<Widget>.generate(
                      addRearedLivestockDialogTwoModelObj
                              ?.ageGroupmModels.length ??
                          0,
                      (index) {
                        FeedsModel model = addRearedLivestockDialogTwoModelObj
                                ?.ageGroupmModels[index] ??
                            FeedsModel();

                        return FeedsItemWidget(
                          model,
                          onSelect: (value) {
                            context.read<AddRearedLivestockDialogBeeBloc>().add(
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
            AddRearedLivestockDialogBeeBloc,
            AddRearedLivestockDialogBeeState,
            AddRearedLivestockDialogBeeModel?>(
          selector: (state) => state.addRearedLivestockDialogTwoModelObj,
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
                          .read<AddRearedLivestockDialogBeeBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: DeviceExt((95 / 841) * 100).h,
                    text: "lbl_add".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () {
                      context.read<AddRearedLivestockDialogBeeBloc>().add(
                          AddAGs(
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
