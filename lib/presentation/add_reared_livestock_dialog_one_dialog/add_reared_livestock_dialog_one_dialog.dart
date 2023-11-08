import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/widgets/feeds_widget.dart';

import 'bloc/add_reared_livestock_dialog_one_bloc.dart';
import 'models/add_reared_livestock_dialog_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AddRearedLivestockDialogOneDialog extends StatelessWidget {
  const AddRearedLivestockDialogOneDialog({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AddRearedLivestockDialogOneBloc>(
        create: (context) => AddRearedLivestockDialogOneBloc(
            AddRearedLivestockDialogOneState(
                addRearedLivestockDialogOneModelObj:
                    AddRearedLivestockDialogOneModel()))
          ..add(AddRearedLivestockDialogOneInitialEvent()),
        child: AddRearedLivestockDialogOneDialog());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
      width: DeviceExt((450 / 841) * 100).h,
      height: DeviceExt((450 / 841) * 100).h,
      padding: EdgeInsets.symmetric(
          horizontal: DeviceExt((13 / 841) * 100).h,
          vertical: DeviceExt((15 / 411) * 100).w),
      decoration: AppDecoration.fillWhiteA
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
      child: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: BlocSelector<
                  AddRearedLivestockDialogOneBloc,
                  AddRearedLivestockDialogOneState,
                  AddRearedLivestockDialogOneModel?>(
                selector: (state) => state.addRearedLivestockDialogOneModelObj,
                builder: (context, addRearedLivestockDialogTwoModelObj) {
                  return Column(
                    children: List<Widget>.generate(
                      addRearedLivestockDialogTwoModelObj?.models.length ?? 0,
                      (index) {
                        FeedsModel model = addRearedLivestockDialogTwoModelObj
                                ?.models[index] ??
                            FeedsModel();

                        return FeedsItemWidget(
                          model,
                          onSelect: (value) {
                            context.read<AddRearedLivestockDialogOneBloc>().add(
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
        BlocSelector<
            AddRearedLivestockDialogOneBloc,
            AddRearedLivestockDialogOneState,
            AddRearedLivestockDialogOneModel?>(
          selector: (state) => state.addRearedLivestockDialogOneModelObj,
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
                          .read<AddRearedLivestockDialogOneBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: DeviceExt((95 / 841) * 100).h,
                    text: "lbl_add".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () {
                      context.read<AddRearedLivestockDialogOneBloc>().add(
                          AddCBs(
                              models:
                                  addRearedLivestockDialogOneModelObj!.models));
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

  /// Navigates to the addRearedLivestockTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addRearedLivestockTwoScreen.
  onTapAdd(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addRearedLivestockTwoScreen,
    );
  }

  /// Navigates to the addRearedLivestockOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addRearedLivestockOneScreen.
  onTapClose(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addRearedLivestockOneScreen,
    );
  }
}
