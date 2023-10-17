import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/widgets/feeds_widget.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:sizer/sizer.dart';

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
                          .read<AddRearedLivestockDialogBeeBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: ResponsiveExtension(95).h,
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
