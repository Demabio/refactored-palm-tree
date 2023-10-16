import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:kiamis_app/presentation/side_menu_draweritem/side_menu_draweritem.dart';
import 'package:kiamis_app/routes/navigation_args.dart';

import 'bloc/farmer_registration_bloc.dart';
import 'models/farmer_registration_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'package:kiamis_app/presentation/save_draft_modal_dialog/save_draft_modal_dialog.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class FarmerRegistrationScreen extends StatelessWidget {
  FarmerRegistrationScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmerRegistrationBloc>(
      create: (context) => FarmerRegistrationBloc(
        FarmerRegistrationState(
          farmerRegistrationModelObj: FarmerRegistrationModel(),
        ),
      )..add(FarmerRegistrationInitialEvent()),
      child: FarmerRegistrationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: SideMenuDraweritem(),
        appBar: CustomAppBar(
          height: 47.v,
          leadingWidth: ResponsiveExtension(48).h,
          leading: AppbarImage(
            onTap: () {
              onTapMenuone(context);
            },
            svgPath: ImageConstant.imgMenu,
            margin: EdgeInsets.only(
              left: ResponsiveExtension(24).h,
              top: 8.v,
              bottom: 15.v,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle1(text: "msg_farmer_registration".tr),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          child: Padding(
            padding: EdgeInsets.only(
              left: ResponsiveExtension(22).h,
              right: ResponsiveExtension(10).h,
              bottom: 5.v,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocSelector<FarmerRegistrationBloc, FarmerRegistrationState,
                      FarmerRegistrationModel?>(
                    selector: (state) => state.farmerRegistrationModelObj,
                    builder: (context, farmerRegistrationModelObj) {
                      return _buildStepper(
                        StepperType.vertical,
                        context,
                        farmerRegistrationModelObj!,
                      );
                    },
                  ),
                  BlocSelector<FarmerRegistrationBloc, FarmerRegistrationState,
                          FarmerRegistrationModel?>(
                      selector: (state) => state.farmerRegistrationModelObj,
                      builder: (context, model) {
                        return Visibility(
                          visible: (model!.fi2 &&
                              model.fh2 &&
                              (model.ca2 || model.crop == StepState.disabled) &&
                              (model.ls2 || model.live == StepState.disabled) &&
                              (model.ff2 || model.fish == StepState.disabled) &&
                              model.at2 &&
                              model.lw2 &&
                              model.fs2),
                          child: CustomElevatedButton(
                            width: ResponsiveExtension(343).h,
                            text: "lbl_save".tr,
                            margin: EdgeInsets.only(bottom: 10.v),
                            leftIcon: Container(
                              margin: EdgeInsets.only(
                                  right: ResponsiveExtension(10).h),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgSaveWhiteA700,
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CupertinoStepper _buildStepper(
      StepperType type, BuildContext context, FarmerRegistrationModel model) {
    final canCancel = model.currentStep > 0;
    final canContinue = model.currentStep < 7;
    return CupertinoStepper(
      type: type,
      physics: ClampingScrollPhysics(),
      currentStep: model.currentStep,
      onStepTapped: (step) {
        context.read<FarmerRegistrationBloc>().add(OnSteppedEvent(value: step));
      },
      onStepCancel: canCancel
          ? () {
              context.read<FarmerRegistrationBloc>().add(StepDownEvent());
            }
          : null,
      onStepContinue: canContinue
          ? () {
              context.read<FarmerRegistrationBloc>().add(StepUpEvent());
            }
          : null,
      steps: [
        _buildStep(
          title: Text('Farmers Identification'),
          state: model.fid,
          addcallback: () {
            farmersIdentification(context);
          },
          editcallback: () => editfarmersIdentification(context),
          addoredit: model.fi,
        ),
        _buildStep(
          title: Text('Farm Holding'),
          state: model.fh2 ? StepState.complete : StepState.indexed,
          addcallback: () {
            primaryFarmHolding(context);
          },
          editcallback: () => editprimaryFarmHolding(context),
          addoredit: model.fh,
        ),
        _buildStep(
          title: Text('Crop Agriculture'),
          state: model.crop,
          addcallback: () {
            cropAgriculture(context);
          },
          editcallback: () => editcropAgriculture(context),
          addoredit: model.ca,
        ),
        _buildStep(
          title: Text('Livestock'),
          state: model.live,
          addcallback: () {
            onTapAdddetails(context);
          },
          editcallback: () => editTapAdddetails(context),
          addoredit: model.ls,
        ),
        _buildStep(
          title: Text('Aquaculture'),
          state: model.fish,
          addcallback: () {
            onTapAqua(context);
          },
          editcallback: () => editTapAqua(context),
          addoredit: model.ff,
        ),
        _buildStep(
          title: Text('Farm Technology and Assets'),
          state: model.at2 ? StepState.complete : StepState.indexed,
          addcallback: () {
            onFarmasset(context);
          },
          editcallback: () => editFarmasset(context),
          addoredit: model.at,
        ),
        _buildStep(
          title: Text('Land and Water Management'),
          state: model.lw2 ? StepState.complete : StepState.indexed,
          addcallback: () {
            onLandWater(context);
          },
          editcallback: () => editLandWater(context),
          addoredit: model.lw,
        ),
        _buildStep(
          title: Text('Financial and Services'),
          state: model.fs2 ? StepState.complete : StepState.indexed,
          addcallback: () {
            onFinance(context);
          },
          editcallback: () => editFinance(context),
          addoredit: model.fs,
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
    bool addoredit = false,
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
            if (!addoredit)
              CustomElevatedButton(
                text: "Add Details",
                margin: EdgeInsets.only(left: SizerExt(10).h),
                buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                buttonTextStyle: CustomTextStyles.bodyLarge16,
                onTap: () {
                  addcallback?.call();
                },
              ),
            if (addoredit) Spacer(),
            if (addoredit)
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

  farmersIdentification(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationTwoScreen,
        arguments: {
          NavigationArgs.farmerEdit: false,
        });
  }

  primaryFarmHolding(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.primaryFarmHoldingOneScreen,
        arguments: {
          NavigationArgs.farmerEdit: false,
        });
  }

  addFarmHolding(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.addFarmHoldingOneScreen,
        arguments: {
          NavigationArgs.farmerEdit: false,
        });
  }

  cropAgriculture(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.addCropOneScreen, arguments: {
      NavigationArgs.farmerEdit: false,
    });
  }

  onTapAdddetails(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.livestockOneTabContainerScreen,
        arguments: {
          NavigationArgs.farmerEdit: false,
        });
  }

  onTapAqua(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.addAquacultureOneScreen,
        arguments: {
          NavigationArgs.farmerEdit: false,
        });
  }

  onFarmasset(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.addFarmtechandassetsOneScreen,
        arguments: {
          NavigationArgs.farmerEdit: false,
        });
  }

  onLandWater(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.addLandandwatermgmtOneScreen,
        arguments: {
          NavigationArgs.farmerEdit: false,
        });
  }

  onFinance(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.addFinancialandservicesOneScreen,
        arguments: {
          NavigationArgs.farmerEdit: false,
        });
  }

//EDIT
  editfarmersIdentification(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen,
        arguments: {
          NavigationArgs.farmerEdit: true,
        });
  }

  editprimaryFarmHolding(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.primaryFarmHoldingScreen,
        arguments: {
          NavigationArgs.farmerEdit: true,
        });
  }

  editFarmHolding(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.addFarmHoldingScreen,
        arguments: {
          NavigationArgs.farmerEdit: true,
        });
  }

  editcropAgriculture(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.cropAgricultureScreen,
        arguments: {
          NavigationArgs.farmerEdit: true,
        });
  }

  editTapAdddetails(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.livestockOneTabContainerScreen,
        arguments: {
          NavigationArgs.farmerEdit: true,
        });
  }

  editTapAqua(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.aquacultureScreen, arguments: {
      NavigationArgs.farmerEdit: true,
    });
  }

  editFarmasset(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.farmtechandassetsScreen,
        arguments: {
          NavigationArgs.farmerEdit: true,
        });
  }

  editLandWater(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.landandwatermgmtScreen,
        arguments: {
          NavigationArgs.farmerEdit: true,
        });
  }

  editFinance(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.financialandservicesScreen,
        arguments: {
          NavigationArgs.farmerEdit: true,
        });
  }
  // onTapAdddetails(BuildContext context) {
  //   NavigatorService.popAndPushNamed(
  //     AppRoutes.livestockOneTabContainerScreen,
  //   );
  // }

  /// Navigates to the homeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the homeScreen.
  onTapSave(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.homeScreen,
    );
  }

  onTapMenuone(BuildContext context) {
    _scaffoldKey.currentState?.openDrawer();
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
