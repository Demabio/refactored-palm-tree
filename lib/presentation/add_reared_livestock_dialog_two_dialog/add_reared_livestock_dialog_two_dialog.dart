import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/widgets/age_group_widget.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'bloc/add_reared_livestock_dialog_two_bloc.dart';
import 'models/add_reared_livestock_dialog_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AddRearedLivestockDialogTwoDialog extends StatelessWidget {
  AddRearedLivestockDialogTwoDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddRearedLivestockDialogTwoBloc>(
      create: (context) =>
          AddRearedLivestockDialogTwoBloc(AddRearedLivestockDialogTwoState(
        addRearedLivestockDialogTwoModelObj: AddRearedLivestockDialogTwoModel(),
      ))
            ..add(AddRearedLivestockDialogTwoInitialEvent()),
      child: AddRearedLivestockDialogTwoDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: ResponsiveExtension(344).h,
      height: DeviceExt(75).h,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveExtension(13).h,
        vertical: 16.v,
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
                  AddRearedLivestockDialogTwoBloc,
                  AddRearedLivestockDialogTwoState,
                  AddRearedLivestockDialogTwoModel?>(
                selector: (state) => state.addRearedLivestockDialogTwoModelObj,
                builder: (context, addRearedLivestockDialogTwoModelObj) {
                  return Column(
                    children: List<Widget>.generate(
                      addRearedLivestockDialogTwoModelObj
                              ?.ageGroupmModels.length ??
                          0,
                      (index) {
                        AgeGroupModel model =
                            addRearedLivestockDialogTwoModelObj
                                    ?.ageGroupmModels[index] ??
                                AgeGroupModel();

                        return AgeGroupItemWidget(
                          model,
                          onSelect: (value) {
                            context.read<AddRearedLivestockDialogTwoBloc>().add(
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
            AddRearedLivestockDialogTwoBloc,
            AddRearedLivestockDialogTwoState,
            AddRearedLivestockDialogTwoModel?>(
          selector: (state) => state.addRearedLivestockDialogTwoModelObj,
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
                          .read<AddRearedLivestockDialogTwoBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: ResponsiveExtension(95).h,
                    text: "lbl_add".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () {
                      context.read<AddRearedLivestockDialogTwoBloc>().add(
                          AddAGs(
                              models: addRearedLivestockDialogTwoModelObj!
                                  .ageGroupmModels));
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
