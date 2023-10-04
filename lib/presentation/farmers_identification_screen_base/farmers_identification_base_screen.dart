import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:kiamis_app/presentation/farmers_identification_four_screen/farmers_identification_four_screen.dart';
import 'package:kiamis_app/presentation/farmers_identification_one_screen/farmers_identification_one_screen.dart';
import 'package:kiamis_app/presentation/farmers_identification_three_screen/farmers_identification_three_screen.dart';
import 'package:kiamis_app/presentation/farmers_identification_two_screen/farmers_identification_two_screen.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/farmers_identification_base_bloc.dart';
import 'models/farmers_identification_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class FarmersIdentificationScreenBase extends StatefulWidget {
  FarmersIdentificationScreenBase({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmersIdentificationBaseBloc>(
        create: (context) => FarmersIdentificationBaseBloc(
            FarmersIdentificationBaseState(
                farmersIdentificationModelObj:
                    FarmersIdentificationBaseModel()))
          ..add(FarmersIdentificationBaseInitialEvent()),
        child: FarmersIdentificationScreenBase());
  }

  @override
  State<FarmersIdentificationScreenBase> createState() =>
      _FarmersIdentificationScreenBaseState();
}

class _FarmersIdentificationScreenBaseState
    extends State<FarmersIdentificationScreenBase> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<FarmersIdentificationBaseBloc,
        FarmersIdentificationBaseState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
              leadingWidth: ResponsiveExtension(60).h,
              leading: AppbarImage(
                  svgPath: ImageConstant.imgSort,
                  margin: EdgeInsets.only(
                      left: ResponsiveExtension(16).h, top: 3.v, bottom: 11.v),
                  onTap: () {
                    onTapSortone(context);
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "lbl_livestock".tr),
              actions: [
                AppbarImage(
                    svgPath: ImageConstant.imgSort,
                    margin: EdgeInsets.only(
                        left: ResponsiveExtension(16).h,
                        top: 3.v,
                        bottom: 11.v),
                    onTap: () {
                      onTapSortone(context);
                    }),
              ],
              styleType: Style.bgFill),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 4.v),
              child: Column(
                children: [
                  SizedBox(
                    height: 959.v,
                    width: double.infinity,
                    child: _buildStepper(StepperType.horizontal, context),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  CupertinoStepper _buildStepper(StepperType type, BuildContext context) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        _buildStep(
            title: Text('1'),
            state: StepState.indexed,
            addcallback: () {},
            screen: FarmersIdentificationOneScreen.builder(
              context,
            )),
        _buildStep(
            title: Text('2'),
            state: StepState.indexed,
            screen: FarmersIdentificationTwoScreen.builder(
              context,
            )),
        _buildStep(
            title: Text('3'),
            state: StepState.indexed,
            screen: FarmersIdentificationThreeScreen.builder(
              context,
            )),
        _buildStep(
            title: Text('4'),
            state: StepState.indexed,
            screen: FarmersIdentificationFourScreen.builder(
              context,
            )),
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
    VoidCallback? addcallback,
    VoidCallback? editcallback,
    required Widget screen,
  }) {
    return Step(
      title: title,
      // subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
          maxWidth: double.infinity, maxHeight: SizerExt(70).h, child: screen),
    );
  }

  /// Navigates to the farmerRegistrationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmerRegistrationScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmerRegistrationScreen,
    );
  }
}
