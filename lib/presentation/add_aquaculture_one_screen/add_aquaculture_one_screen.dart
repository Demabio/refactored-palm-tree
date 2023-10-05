import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/add_aquaculture_five_dialog.dart';
import 'package:kiamis_app/presentation/add_aquaculture_four_dialog/add_aquaculture_four_dialog.dart';
import 'package:kiamis_app/presentation/add_aquaculture_three_dialog/add_aquaculture_three_dialog.dart';

import 'bloc/add_aquaculture_one_bloc.dart';
import 'models/add_aquaculture_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class AddAquacultureOneScreen extends StatelessWidget {
  const AddAquacultureOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureOneBloc>(
      create: (context) => AddAquacultureOneBloc(AddAquacultureOneState(
        addAquacultureOneModelObj: AddAquacultureOneModel(),
      ))
        ..add(AddAquacultureOneInitialEvent()),
      child: AddAquacultureOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<AddAquacultureOneBloc, AddAquacultureOneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              leadingWidth: 60.h,
              leading: AppbarImage(
                svgPath: ImageConstant.imgSort,
                margin: EdgeInsets.only(
                  left: 16.h,
                  top: 3.v,
                  bottom: 11.v,
                ),
              ),
              centerTitle: true,
              title: AppbarSubtitle1(
                text: "lbl_aquaculture2".tr,
              ),
              styleType: Style.bgFill,
            ),
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 5.v),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    right: 16.h,
                    bottom: 5.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocSelector<AddAquacultureOneBloc,
                              AddAquacultureOneState, AddAquacultureOneModel?>(
                          selector: (state) => state.addAquacultureOneModelObj,
                          builder:
                              ((context, farmersIdentificationOneModelObj) {
                            return SizedBox(
                              height: 150.v,
                              width: double.infinity,
                              child: _buildStepper(StepperType.horizontal,
                                  context, farmersIdentificationOneModelObj),
                            );
                          })),
                      Text(
                        "msg_aquaculture_type2".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 18.v),
                      Text(
                        "msg_what_types_of_aquaculture2".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      CustomElevatedButton(
                        text: "msg_add_aquaculture".tr,
                        onTap: () {
                          addAquaculturetype(context);
                        },
                        margin: EdgeInsets.only(
                          left: 82.h,
                          top: 65.v,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 17.v),
                      Text(
                        "msg_production_system3".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                      CustomElevatedButton(
                        text: "msg_add_production_system".tr,
                        onTap: () {
                          addProductionType(context);
                        },
                        margin: EdgeInsets.only(
                          left: 82.h,
                          top: 106.v,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      Container(
                        width: 316.h,
                        margin: EdgeInsets.only(
                          top: 17.v,
                          right: 26.h,
                        ),
                        child: Text(
                          "msg_does_the_household2".tr,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      CustomElevatedButton(
                        text: "msg_add_aquatic_species".tr,
                        margin: EdgeInsets.only(
                          left: 82.h,
                          top: 41.v,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 18.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomOutlinedButton(
                              text: "lbl_back".tr,
                              margin: EdgeInsets.only(right: 1.h),
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL10,
                              buttonTextStyle:
                                  CustomTextStyles.bodyLargePrimary_1,
                            ),
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              text: "lbl_next".tr,
                              margin: EdgeInsets.only(left: 1.h),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.v),
                      CustomElevatedButton(
                        text: "lbl_save".tr,
                        leftIcon: Container(
                          margin: EdgeInsets.only(right: 10.h),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgSaveWhiteA700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  CupertinoStepper _buildStepper(StepperType type, BuildContext context,
      AddAquacultureOneModel? primaryFarmHoldingOneModel) {
    final canCancel = primaryFarmHoldingOneModel!.stepped > 0;
    final canContinue = primaryFarmHoldingOneModel.stepped < 3;
    return CupertinoStepper(
      type: type,
      currentStep: primaryFarmHoldingOneModel.stepped,
      onStepTapped: (step) {
        //Best place to save and get scope identity and store in pref
        //Validation checks

        // context
        //     .read<FarmersIdentificationFourBloc>()
        //     .add(OnSteppedEvent(value: step));

        //chosen
        onTapNextC(context, step);
      },
      onStepCancel: canCancel
          ? () {
              // context
              //     .read<FarmersIdentificationFourBloc>()
              //     .add(StepDownEvent());
              //Chosen
              onTapNextC(context, primaryFarmHoldingOneModel.stepped - 1);
            }
          : null,
      onStepContinue: canContinue
          ? () {
              //   context.read<FarmersIdentificationFourBloc>().add(StepUpEvent());
              //Chosen
              onTapNextC(context, primaryFarmHoldingOneModel.stepped + 1);
            }
          : null,
      steps: [
        _buildStep(
          title: Text('1'),
          state: primaryFarmHoldingOneModel.page1!,
          addcallback: () {},
        ),
        _buildStep(
          title: Text('2'),
          state: primaryFarmHoldingOneModel.page2!,
        ),
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
    VoidCallback? addcallback,
    VoidCallback? editcallback,
  }) {
    return Step(
      title: title,
      // subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
          maxWidth: double.infinity,
          maxHeight: 1,
          child: SizedBox(
            height: 1,
            width: 1,
          )),
    );
  }

  onTapNextC(BuildContext context, int step) {
    if (step == 0) {
      NavigatorService.popAndPushNamed(
        AppRoutes.addAquacultureOneScreen,
      );
      // } else if (step == 1) {
      //   NavigatorService.popAndPushNamed(
      //     AppRoutes.primaryFarmHoldingTwoScreen,
      //   );
      // } else if (step == 2) {
      //   NavigatorService.popAndPushNamed(
      //     AppRoutes.farmersIdentificationThreeScreen,
      //   );
    } else {
      NavigatorService.popAndPushNamed(
        AppRoutes.addAquacultureTwoScreen,
      );
    }
  }

  addAquaculturespecies(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddAquacultureFiveDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  addAquaculturetype(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddAquacultureThreeDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  addProductionType(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: AddAquacultureFourDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
