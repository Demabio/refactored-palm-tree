import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/primary_farm_holding_bloc.dart';
import 'models/primary_farm_holding_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

import 'widgets/enterprises_widget.dart';

class PrimaryFarmHoldingScreen extends StatelessWidget {
  const PrimaryFarmHoldingScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PrimaryFarmHoldingBloc>(
        create: (context) => PrimaryFarmHoldingBloc(PrimaryFarmHoldingState(
            primaryFarmHoldingModelObj: PrimaryFarmHoldingModel()))
          ..add(PrimaryFarmHoldingInitialEvent()),
        child: PrimaryFarmHoldingScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<PrimaryFarmHoldingBloc, PrimaryFarmHoldingState>(
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
                title: AppbarSubtitle1(text: "Farm Holding".tr),
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
                        NavigatorService.popAndPushNamed(
                            AppRoutes.farmersIdentificationTwoScreen);
                      }),
                ],
                styleType: Style.bgFill),
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: ((2 / 411) * 100).w),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: DeviceExt((20 / 841) * 100).h,
                      right: DeviceExt((14 / 841) * 100).h,
                      bottom: ((5 / 411) * 100).w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          "lbl_farmer_info".tr,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontSize: Device.orientation == Orientation.portrait
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
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ]),
                      Padding(
                          padding: EdgeInsets.only(
                              left: DeviceExt((1 / 841) * 100).h,
                              top: ((7 / 411) * 100).w),
                          child: Text(
                            "msg_main_farm_enterprises".tr,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize:
                                  Device.orientation == Orientation.portrait
                                      ? DeviceExt(2).h
                                      : DeviceExt(2.5).w,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                        // height: 691.w,
                        margin: EdgeInsets.only(
                            left: DeviceExt((1 / 841) * 100).h,
                            top: ((22 / 411) * 100).w),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: DeviceExt((4 / 841) * 100).h,
                                    vertical: ((10 / 411) * 100).w),
                                decoration: AppDecoration.outlinePrimary1
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                          left: DeviceExt((3 / 841) * 100).h,
                                        ),
                                        child: Text(
                                          "msg_enumeration_geography".tr,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(2).h
                                                : DeviceExt(2.5).w,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: ((16 / 411) * 100).w,
                                            right:
                                                DeviceExt((1 / 841) * 100).h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "msg_village_unit_name".tr,
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
                                              ),
                                              Text(
                                                state.primaryFarmHoldingModelObj
                                                        ?.farm?.villageName ??
                                                    "N/A",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ])),
                                    SizedBox(height: ((16 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "msg_shopping_center".tr,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            state.primaryFarmHoldingModelObj
                                                    ?.farm?.shoppingCenter ??
                                                "N/A",
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
                                        ]),
                                    SizedBox(height: ((16 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "msg_descriptive_name".tr,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            state.primaryFarmHoldingModelObj
                                                    ?.farm?.farmName ??
                                                "N/A",
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
                                        ]),
                                    SizedBox(height: ((16 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: ((1 / 411) * 100).w),
                                              child: Text(
                                                "lbl_total_acreage".tr,
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
                                          Text(
                                            state.primaryFarmHoldingModelObj
                                                    ?.farm?.farmSize
                                                    .toString() ??
                                                "N/A",
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
                                        ]),
                                    SizedBox(height: ((28 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "lbl_area_unit".tr,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            state.primaryFarmHoldingModelObj
                                                    ?.area ??
                                                "N/A",
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
                                        ]),
                                    SizedBox(height: ((29 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width:
                                                  DeviceExt((156 / 841) * 100)
                                                      .h,
                                              child: Text(
                                                "msg_size_of_land_under".tr,
                                                maxLines: 10,
                                                overflow: TextOverflow.ellipsis,
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
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: ((18 / 411) * 100).w),
                                              child: Text(
                                                state.primaryFarmHoldingModelObj
                                                        ?.farm?.cropFarmSize
                                                        .toString() ??
                                                    "N/A",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                        ]),
                                    SizedBox(height: ((10 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width:
                                                  DeviceExt((156 / 841) * 100)
                                                      .h,
                                              child: Text(
                                                "msg_total_land_area".tr,
                                                maxLines: 10,
                                                overflow: TextOverflow.ellipsis,
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
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: ((16 / 411) * 100).w),
                                              child: Text(
                                                state.primaryFarmHoldingModelObj
                                                        ?.farm?.livestockFarmSize
                                                        .toString() ??
                                                    "N/A",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                        ]),
                                    SizedBox(height: ((14 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width:
                                                  DeviceExt((161 / 841) * 100)
                                                      .h,
                                              child: Text(
                                                "msg_size_of_land_leased".tr,
                                                maxLines: 10,
                                                overflow: TextOverflow.ellipsis,
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
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: ((18 / 411) * 100).w),
                                              child: Text(
                                                state.primaryFarmHoldingModelObj
                                                        ?.farm?.leasedFarmSize
                                                        .toString() ??
                                                    "N/A",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                        ]),
                                    SizedBox(height: ((10 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width:
                                                  DeviceExt((164 / 841) * 100)
                                                      .h,
                                              child: Text(
                                                "msg_size_of_land_lying".tr,
                                                maxLines: 10,
                                                overflow: TextOverflow.ellipsis,
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
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: ((16 / 411) * 100).w),
                                              child: Text(
                                                state.primaryFarmHoldingModelObj
                                                        ?.farm?.idleFarmSize
                                                        .toString() ??
                                                    "N/A",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                        ]),
                                    SizedBox(height: ((13 / 411) * 100).w),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: DeviceExt((2 / 841) * 100).h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "msg_crop_production".tr,
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
                                              ),
                                              Text(
                                                state.primaryFarmHoldingModelObj
                                                            ?.farm?.cropProd ??
                                                        false
                                                    ? "Yes"
                                                    : "No",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ])),
                                    SizedBox(height: ((13 / 411) * 100).w),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: DeviceExt((2 / 841) * 100).h,
                                            top: ((5 / 411) * 100).w),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "msg_livestock_production".tr,
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
                                              ),
                                              Text(
                                                state.primaryFarmHoldingModelObj
                                                            ?.farm?.livestockProd ??
                                                        false
                                                    ? "Yes"
                                                    : "No",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ])),
                                    SizedBox(height: ((13 / 411) * 100).w),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceExt((2 / 841) * 100).h,
                                          top: DeviceExt((15 / 841) * 100).w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "msg_aquaculture_production".tr,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            state.primaryFarmHoldingModelObj
                                                        ?.farm?.fishFarming ??
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
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: ((13 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "lbl_latitude".tr,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            state.primaryFarmHoldingModelObj
                                                    ?.farm?.x
                                                    .toString() ??
                                                "N/A",
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
                                        ]),
                                    SizedBox(height: ((30 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: ((1 / 411) * 100).w),
                                              child: Text(
                                                "lbl_longitude".tr,
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
                                          Text(
                                            state.primaryFarmHoldingModelObj
                                                    ?.farm?.y
                                                    .toString() ??
                                                "N/A",
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
                                        ]),
                                    SizedBox(height: ((28 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: ((1 / 411) * 100).w),
                                              child: Text(
                                                "lbl_accuracy".tr,
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
                                          Text(
                                            state.primaryFarmHoldingModelObj
                                                    ?.farm?.accuracyLevel
                                                    .toString() ??
                                                "N/A",
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
                                        ]),
                                    SizedBox(height: ((27 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width:
                                                  DeviceExt((136 / 841) * 100)
                                                      .h,
                                              child: Text(
                                                "msg_lr_no_certificate_lease"
                                                    .tr,
                                                maxLines: 10,
                                                overflow: TextOverflow.ellipsis,
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
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: ((19 / 411) * 100).w),
                                              child: Text(
                                                state.primaryFarmHoldingModelObj
                                                        ?.farm?.farmLrCert ??
                                                    "N/A",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                        ]),
                                    SizedBox(height: ((11 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width:
                                                  DeviceExt((147 / 841) * 100)
                                                      .h,
                                              child: Text(
                                                "msg_do_you_have_another".tr,
                                                maxLines: 10,
                                                overflow: TextOverflow.ellipsis,
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
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: ((15 / 411) * 100).w),
                                              child: Text(
                                                (state.primaryFarmHoldingModelObj?.farm
                                                            ?.otherFarmElsewhere ??
                                                        false)
                                                    ? "Yes"
                                                    : "No",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                        ]),
                                    SizedBox(height: ((15 / 411) * 100).w),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "msg_legal_status_of".tr,
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
                                          Expanded(
                                            child: Text(
                                              state.primaryFarmHoldingModelObj
                                                      ?.owner ??
                                                  "N/A",
                                              maxLines: 10,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                color: Colors.black,
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2).w,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ]),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: DeviceExt((34 / 841) * 100).h,
                                          top: ((29 / 411) * 100).w,
                                          bottom: ((15 / 411) * 100).w),
                                      child: Text(
                                        "msg_enterprises_on_this".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(2).h
                                              : DeviceExt(2).w,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    BlocSelector<
                                        PrimaryFarmHoldingBloc,
                                        PrimaryFarmHoldingState,
                                        PrimaryFarmHoldingModel?>(
                                      selector: (state) =>
                                          state.primaryFarmHoldingModelObj,
                                      builder: (context,
                                          primaryFarmHoldingTwoModelObj) {
                                        return Column(
                                          children: List<Widget>.generate(
                                            primaryFarmHoldingTwoModelObj
                                                    ?.enterprises.length ??
                                                0,
                                            (index) {
                                              EnterpriseModel model =
                                                  primaryFarmHoldingTwoModelObj
                                                              ?.enterprises[
                                                          index] ??
                                                      EnterpriseModel();

                                              return EnterprisesItemWidget(
                                                model,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ((20 / 411) * 100).w),
                      Visibility(
                        visible: state.done,
                        child: CustomElevatedButton(
                          height: Device.orientation == Orientation.portrait
                              ? DeviceExt(6).h
                              : 8.w,
                          width: DeviceExt((344 / 841) * 100).h,
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
                            if (state.next) {
                              NavigatorService.popAndPushNamed(
                                AppRoutes.addCropOneScreen,
                              );
                            } else if (state.next2) {
                              NavigatorService.popAndPushNamed(
                                AppRoutes.addRearedLivestockOneScreen,
                              );
                            } else if (state.prev) {
                              NavigatorService.popAndPushNamed(
                                AppRoutes.addAquacultureOneScreen,
                              );
                            } else {
                              NavigatorService.popAndPushNamed(
                                AppRoutes.addFarmtechandassetsOneScreen,
                              );
                            }
                          },
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      SizedBox(height: ((20 / 411) * 100).w),
                      CustomElevatedButton(
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
                        text: "Previous Section".tr,
                        onTap: () => NavigatorService.popAndPushNamed(
                          AppRoutes.farmersIdentificationScreen,
                        ),
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
      AppRoutes.primaryFarmHoldingOneScreen,
    );
  }
}
