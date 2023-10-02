import 'package:cupertino_stepper/cupertino_stepper.dart';

import 'bloc/farmer_registration_bloc.dart';
import 'models/farmer_registration_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/presentation/save_draft_modal_dialog/save_draft_modal_dialog.dart';
import 'package:sizer/sizer.dart';

class FarmerRegistrationScreen extends StatefulWidget {
  const FarmerRegistrationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmerRegistrationBloc>(
        create: (context) => FarmerRegistrationBloc(FarmerRegistrationState(
            farmerRegistrationModelObj: FarmerRegistrationModel()))
          ..add(FarmerRegistrationInitialEvent()),
        child: FarmerRegistrationScreen());
  }

  @override
  State<FarmerRegistrationScreen> createState() =>
      _FarmerRegistrationScreenState();
}

class _FarmerRegistrationScreenState extends State<FarmerRegistrationScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<FarmerRegistrationBloc, FarmerRegistrationState>(
        builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
              height: 47.v,
              leadingWidth: ResponsiveExtension(48).h,
              leading: AppbarImage(
                  svgPath: ImageConstant.imgMenu,
                  margin: EdgeInsets.only(
                      left: ResponsiveExtension(24).h, top: 8.v, bottom: 15.v)),
              centerTitle: true,
              title: AppbarSubtitle1(text: "msg_farmer_registration".tr)),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: Padding(
              padding: EdgeInsets.only(
                  left: ResponsiveExtension(22).h,
                  right: ResponsiveExtension(10).h,
                  bottom: 5.v),
              child: _buildStepper(StepperType.vertical, context),
            ),
          ),
        ),
      );
    });
  }

  CupertinoStepper _buildStepper(StepperType type, BuildContext context) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 12;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        _buildStep(
          title: Text('Farmers Identification'),
          state: StepState.indexed,
          addcallback: () {
            onTapAdddetails(context);
          },
        ),
        _buildStep(
          title: Text('Primary Farm Holding'),
          state: StepState.indexed,
        ),
        _buildStep(
          title: Text('Add Other Farm Holdings'),
          state: StepState.indexed,
        ),
        _buildStep(
          title: Text('Crop Agriculture'),
          state: StepState.indexed,
        ),
        _buildStep(
          title: Text('Livestock'),
          state: StepState.indexed,
        ),
        _buildStep(
          title: Text('Aquaculture'),
          state: StepState.indexed,
        ),
        _buildStep(
          title: Text('Farm Technology and Assets'),
          state: StepState.indexed,
        ),
        _buildStep(
          title: Text('Land and Water Management'),
          state: StepState.indexed,
        ),
        _buildStep(
          title: Text('Financial and Services'),
          state: StepState.indexed,
        ),
        _buildStep(
          title: Text('Error'),
          state: StepState.error,
        ),
        _buildStep(
          title: Text('Disabled'),
          state: StepState.disabled,
        ),
        _buildStep(
          title: Text('Editing'),
          state: StepState.editing,
        ),
        _buildStep(
          title: Text('Completed'),
          state: StepState.complete,
        )
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
        maxWidth: 300,
        maxHeight: SizerExt(15).h,
        child: Column(
          children: [
            CustomElevatedButton(
              text: "Add Details",
              margin: EdgeInsets.only(left: SizerExt(10).h),
              buttonStyle: CustomButtonStyles.fillPrimaryTL6,
              buttonTextStyle: CustomTextStyles.bodyLarge16,
              onTap: () {
                addcallback?.call();
              },
            ),
            Spacer(),
            CustomElevatedButton(
              text: "Edit Details",
              margin: EdgeInsets.only(left: SizerExt(10).h),
              buttonStyle: CustomButtonStyles.fillPrimaryTL6,
              buttonTextStyle: CustomTextStyles.bodyLarge16,
              onTap: () {
                editcallback?.call();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the farmersIdentificationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationScreen.
  farmersIdentification(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingScreen.
  primaryFarmHolding(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.primaryFarmHoldingScreen,
    );
  }

  /// Navigates to the addFarmHoldingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addFarmHoldingScreen.
  addFarmHolding(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addFarmHoldingScreen,
    );
  }

  /// Navigates to the cropAgricultureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cropAgricultureScreen.
  cropAgriculture(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cropAgricultureScreen,
    );
  }

  /// Navigates to the livestockOneTabContainerScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the livestockOneTabContainerScreen.
  onTapAdddetails(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.livestockOneTabContainerScreen,
    );
  }

  /// Navigates to the homeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the homeScreen.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }

  /// Displays an [AlertDialog] with a custom content widget using the
  /// provided [BuildContext].
  ///
  /// The custom content widget is created by calling
  /// [SaveDraftModalDialog.builder] method.
  onTapDiscard(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: SaveDraftModalDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
