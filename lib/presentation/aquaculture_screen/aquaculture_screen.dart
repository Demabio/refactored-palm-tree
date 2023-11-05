import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/widgets/fish_widget.dart';
import 'package:kiamis_app/presentation/add_aquaculture_four_dialog/widgets/ProdSys_widget.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_aquaculture_three_dialog/widgets/aqua_types_widget.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/aquaculture_bloc.dart';
import 'models/aquaculture_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AquacultureScreen extends StatelessWidget {
  const AquacultureScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AquacultureBloc>(
        create: (context) => AquacultureBloc(
            AquacultureState(aquacultureModelObj: AquacultureModel()))
          ..add(AquacultureInitialEvent()),
        child: AquacultureScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<AquacultureBloc, AquacultureState>(
        builder: (context, state) {
      return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
                height: Device.orientation == Orientation.portrait
                    ? 15.w
                    : DeviceExt(15).h,
                leadingWidth: DeviceExt((60 / 841) * 100).h,
                leading: CustomImageView(
                    svgPath: ImageConstant.imgSort,
                    height: Device.orientation == Orientation.portrait
                        ? DeviceExt(5).h
                        : 5.w,
                    width: Device.orientation == Orientation.portrait
                        ? DeviceExt(5).h
                        : 5.w,
                    onTap: () {
                      onTapSortone(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_aquaculture".tr),
                actions: [
                  CustomImageView(
                      svgPath: ImageConstant.imgFrame33,
                      height: Device.orientation == Orientation.portrait
                          ? DeviceExt(5).h
                          : 5.w,
                      width: Device.orientation == Orientation.portrait
                          ? DeviceExt(5).h
                          : 5.w,
                      onTap: () {
                        onTapImage(context);
                      }),
                ],
                styleType: Style.bgFill),
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: ((2 / 411) * 100).w),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: DeviceExt((15 / 841) * 100).h,
                      right: DeviceExt((15 / 841) * 100).h,
                      bottom: ((5 / 411) * 100).w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: DeviceExt((4 / 841) * 100).h),
                          child: Row(children: [
                            Text(
                              "lbl_farmer_info".tr,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((21 / 841) * 100).h),
                                child: Text(
                                  PrefUtils().getFarmerName(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.black,
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ])),
                      SizedBox(height: ((15 / 411) * 100).w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: DeviceExt((5 / 841) * 100).h,
                            vertical: ((20 / 411) * 100).w),
                        decoration: AppDecoration.outlinePrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h),
                                child: Text(
                                  "msg_aquaculture_type".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            BlocSelector<AquacultureBloc, AquacultureState,
                                    List<CheckBoxList>?>(
                                selector: (state) => state.aquatypes,
                                builder: (context, list) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: ((15 / 411) * 100).w,
                                      right: DeviceExt((16 / 841) * 100).h,
                                    ),
                                    child: Column(
                                      children: List<Widget>.generate(
                                        list?.length ?? 0,
                                        (index) {
                                          CheckBoxList model = list![index];

                                          return AquaTypeItemWidget(
                                            model,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: ((4 / 411) * 100).w),
                                child: Text(
                                  "msg_production_system2".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            BlocSelector<AquacultureBloc, AquacultureState,
                                    List<CheckBoxList>?>(
                                selector: (state) => state.prodsyss,
                                builder: (context, list) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: ((15 / 411) * 100).w,
                                    ),
                                    child: Column(
                                      children: List<Widget>.generate(
                                        list?.length ?? 0,
                                        (index) {
                                          CheckBoxList model = list![index];

                                          return ProdSysItemWidget(
                                            model,
                                            view: false,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            Container(
                                width: DeviceExt((313 / 841) * 100).h,
                                margin: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((3 / 411) * 100).w,
                                    right: DeviceExt((16 / 841) * 100).h),
                                child: Text(
                                  "msg_does_the_household".tr,
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            BlocSelector<AquacultureBloc, AquacultureState,
                                    List<CheckBoxList>?>(
                                selector: (state) => state.fish,
                                builder: (context, list) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: ((15 / 411) * 100).w,
                                      right: DeviceExt((16 / 841) * 100).h,
                                    ),
                                    child: Column(
                                      children: List<Widget>.generate(
                                        list?.length ?? 0,
                                        (index) {
                                          CheckBoxList model = list![index];

                                          return FishtemWidget(
                                            model,
                                            view: false,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((3 / 411) * 100).w),
                                child: Text(
                                  "msg_what_are_your_main2".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            BlocSelector<AquacultureBloc, AquacultureState,
                                    List<CheckBoxList>?>(
                                selector: (state) => state.inputs,
                                builder: (context, list) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: ((15 / 411) * 100).w,
                                      right: DeviceExt((16 / 841) * 100).h,
                                    ),
                                    child: Column(
                                      children: List<Widget>.generate(
                                        list?.length ?? 0,
                                        (index) {
                                          CheckBoxList model = list![index];

                                          return InputsWidget(
                                            model,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((4 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_utilize_fertilizers".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        state.farmerFishProductionLevel
                                                    ?.fertilizerInPonds ??
                                                false
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ])),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                      left: DeviceExt((4 / 841) * 100).h,
                                      top: ((17 / 411) * 100).w,
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: ((1 / 411) * 100).w),
                                              child: Text(
                                                "msg_which_is_your_production"
                                                    .tr,
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          Spacer(),
                                          Text(
                                            state.level ?? "N/A",
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )
                                        ]))),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: DeviceExt((4 / 841) * 100).h,
                                  top: ((17 / 411) * 100).w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: DeviceExt((197 / 841) * 100).h,
                                      child: Text(
                                        "msg_have_you_benefited".tr,
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: ((18 / 411) * 100).w),
                                    child: Text(
                                      state.farmerFishProductionLevel
                                                  ?.espBenefit ==
                                              1
                                          ? "Yes"
                                          : "No",
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Device.orientation ==
                                                Orientation.portrait
                                            ? DeviceExt(1.8).h
                                            : DeviceExt(2).w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ((20 / 411) * 100).w),
                      Visibility(
                        visible: state.done,
                        child: CustomElevatedButton(
                          text: "Next Section".tr,
                          height: Device.orientation == Orientation.portrait
                              ? DeviceExt(6).h
                              : 8.w,
                          width: DeviceExt((343 / 841) * 100).h,
                          buttonTextStyle:
                              theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontSize: Device.orientation == Orientation.portrait
                                ? DeviceExt(2).h
                                : DeviceExt(2.5).w,
                          ),
                          margin: Device.orientation == Orientation.portrait
                              ? EdgeInsets.fromLTRB(DeviceExt(0.36).h, 6.w,
                                  DeviceExt(0.2).h, 1.2.w)
                              : EdgeInsets.fromLTRB(
                                  DeviceExt(0.36).w,
                                  DeviceExt(6).h,
                                  DeviceExt(0.2).w,
                                  DeviceExt(1.2).h),
                          onTap: () => NavigatorService.popAndPushNamed(
                              AppRoutes.addFarmtechandassetsOneScreen),
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      SizedBox(height: ((11 / 411) * 100).w),
                      CustomElevatedButton(
                        text: "Previous Section".tr,
                        height: Device.orientation == Orientation.portrait
                            ? DeviceExt(6).h
                            : 8.w,
                        width: DeviceExt((344 / 841) * 100).h,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        margin: Device.orientation == Orientation.portrait
                            ? EdgeInsets.fromLTRB(
                                DeviceExt(0.36).h, 6.w, DeviceExt(0.2).h, 1.2.w)
                            : EdgeInsets.fromLTRB(
                                DeviceExt(0.36).w,
                                DeviceExt(6).h,
                                DeviceExt(0.2).w,
                                DeviceExt(1.2).h),
                        onTap: () {
                          if (state.prev) {
                            NavigatorService.popAndPushNamed(
                                AppRoutes.cropAgricultureScreen);
                          } else {
                            NavigatorService.popAndPushNamed(
                                AppRoutes.livestockOneTabContainerScreen);
                          }
                        },
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  /// Navigates to the farmerRegistrationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmerRegistrationScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmerRegistrationScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingOneScreen.
  onTapImage(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addAquacultureOneScreen,
    );
  }
}
