import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/models/irrigationprojetmodel.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/widgets/irrigation_widget.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:sizer/sizer.dart';

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
                        IrrigationProjectModel model =
                            addRearedLivestockDialogTwoModelObj
                                    ?.ageGroupmModels[index] ??
                                IrrigationProjectModel();

                        return IrrigationProjectGroupItemWidget(
                          model,
                          onSelect: (value) {
                            context.read<AddLandandwatermgmtSixBloc>().add(
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
        BlocSelector<AddLandandwatermgmtSixBloc, AddLandandwatermgmtSixState,
            AddLandandwatermgmtSixModel?>(
          selector: (state) => state.addLandandwatermgmtSixModelObj,
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
                          .read<AddLandandwatermgmtSixBloc>()
                          .add(ResetCBs());
                    },
                  ),
                  CustomElevatedButton(
                    width: ResponsiveExtension(95).h,
                    text: "lbl_add".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () {
                      context.read<AddLandandwatermgmtSixBloc>().add(AddAGs(
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
