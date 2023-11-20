import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_three_dialog/widgets/techassets_widget.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/farmtechandassets_bloc.dart';
import 'models/farmtechandassets_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

class FarmtechandassetsScreen extends StatelessWidget {
  const FarmtechandassetsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmtechandassetsBloc>(
        create: (context) => FarmtechandassetsBloc(FarmtechandassetsState(
            farmtechandassetsModelObj: FarmtechandassetsModel()))
          ..add(FarmtechandassetsInitialEvent()),
        child: FarmtechandassetsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<FarmtechandassetsBloc, FarmtechandassetsState>(
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
                title: AppbarSubtitle4(text: "msg_farm_technology2".tr),
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
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((21 / 841) * 100).h),
                                child: Text(
                                  PrefUtils().getFarmerName(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ))
                          ])),
                      SizedBox(height: ((15 / 411) * 100).w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: DeviceExt((7 / 841) * 100).h,
                            vertical: ((11 / 411) * 100).w),
                        decoration: AppDecoration.outlinePrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((9 / 411) * 100).w),
                                child: Text(
                                  "msg_source_of_power".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            BlocSelector<
                                    FarmtechandassetsBloc,
                                    FarmtechandassetsState,
                                    List<CheckBoxList>?>(
                                selector: (state) => state.p,
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
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w,
                                    right: DeviceExt((7 / 841) * 100).h),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: ((1 / 411) * 100).w),
                                    child: Text(
                                      "lbl_labour_source2".tr,
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontSize: Device.orientation ==
                                                Orientation.portrait
                                            ? DeviceExt(1.8).h
                                            : DeviceExt(2).w,
                                      ),
                                    ))),
                            BlocSelector<
                                    FarmtechandassetsBloc,
                                    FarmtechandassetsState,
                                    List<CheckBoxList>?>(
                                selector: (state) => state.l,
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
                                padding:
                                    EdgeInsets.only(top: ((11 / 411) * 100).w),
                                child: Text(
                                  "msg_farmer_machinery".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            BlocSelector<
                                    FarmtechandassetsBloc,
                                    FarmtechandassetsState,
                                    List<CheckBoxList>?>(
                                selector: (state) => state.a,
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

                                          return TechtemWidget(
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
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((11 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "msg_who_owns_most_of".tr,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  DeviceExt((77 / 841) * 100).h,
                                              bottom: ((18 / 411) * 100).w),
                                          child: Text(
                                            state.farmStructure?.assetSource ??
                                                "Not Applied",
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              color: Colors.black,
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          ))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((2 / 841) * 100).h,
                                    top: ((8 / 411) * 100).w),
                                child: Text(
                                  "msg_which_farm_structures".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            BlocSelector<FarmtechandassetsBloc,
                                FarmtechandassetsState, List<CheckBoxList>?>(
                              selector: (state) => state.s,
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
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ((10 / 411) * 100).w),
                      Visibility(
                        visible: state.done,
                        child: CustomElevatedButton(
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
                          text: "Next Section".tr,
                          onTap: () {
                            NavigatorService.popAndPushNamed(
                              AppRoutes.addLandandwatermgmtOneScreen,
                            );
                          },
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      SizedBox(height: ((10 / 411) * 100).w),
                      CustomElevatedButton(
                        height: Device.orientation == Orientation.portrait
                            ? DeviceExt(6).h
                            : 8.w,
                        width: DeviceExt((343 / 841) * 100).h,
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
                        text: "Previous Section".tr,
                        onTap: () {
                          if (state.prev) {
                            NavigatorService.popAndPushNamed(
                              AppRoutes.addAquacultureOneScreen,
                            );
                          } else if (state.next) {
                            NavigatorService.popAndPushNamed(
                              AppRoutes.livestockOneTabContainerScreen,
                            );
                          } else if (state.prev) {
                            NavigatorService.popAndPushNamed(
                              AppRoutes.cropAgricultureScreen,
                            );
                          } else {
                            NavigatorService.popAndPushNamed(
                              AppRoutes.primaryFarmHoldingScreen,
                            );
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
      AppRoutes.addFarmtechandassetsOneScreen,
    );
  }
}
