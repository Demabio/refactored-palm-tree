// ignore_for_file: must_call_super

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/livestock_two_bloc.dart';
import 'models/livestock_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class LivestockTwoPage extends StatefulWidget {
  const LivestockTwoPage({Key? key})
      : super(
          key: key,
        );

  @override
  LivestockTwoPageState createState() => LivestockTwoPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<LivestockTwoBloc>(
      create: (context) => LivestockTwoBloc(LivestockTwoState(
        livestockTwoModelObj: LivestockTwoModel(),
      ))
        ..add(LivestockTwoInitialEvent()),
      child: LivestockTwoPage(),
    );
  }
}

class LivestockTwoPageState extends State<LivestockTwoPage>
    with AutomaticKeepAliveClientMixin<LivestockTwoPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<LivestockTwoBloc, LivestockTwoState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: DeviceExt((16 / 841) * 100).h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: DeviceExt((5 / 841) * 100).h),
                            child: Row(
                              children: [
                                Text(
                                  "lbl_farmer_info".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: DeviceExt((21 / 841) * 100).h),
                                  child: Text(
                                    PrefUtils()
                                        .getFarmerName(), // "msg_farmer_felix_faro".tr,
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: Colors.black,
                                      fontSize: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(2).h
                                          : DeviceExt(2.5).w,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: ((17 / 411) * 100).w,
                              right: DeviceExt((15 / 841) * 100).h,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: DeviceExt((8 / 841) * 100).h,
                              vertical: ((29 / 411) * 100).w,
                            ),
                            decoration: AppDecoration.outlinePrimary1.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: DeviceExt((2 / 841) * 100).h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Area Unit".tr,
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
                                        state.livestockTwoModelObj!.area,
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: DeviceExt((2 / 841) * 100).h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_utilize_fodder".tr,
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
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.fertilizerForFodder ??
                                                false)
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: ((20 / 411) * 100).w,
                                    right: DeviceExt((2 / 841) * 100).h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_utilize_fertilizer".tr,
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
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.fodderSeeds ??
                                                false)
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
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: DeviceExt((293 / 841) * 100).h,
                                  margin: EdgeInsets.only(
                                    top: ((15 / 411) * 100).w,
                                    right: DeviceExt((35 / 841) * 100).h,
                                  ),
                                  child: Text(
                                    "msg_which_assisted_reproductive".tr,
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontSize: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(2).h
                                          : DeviceExt(2.5).w,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: ((9 / 411) * 100).w,
                                    right: DeviceExt((3 / 841) * 100).h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_artificial_insemination".tr,
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
                                        (state.livestockTwoModelObj!
                                                    .livestockins?.aiUse ==
                                                1)
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: ((14 / 411) * 100).w,
                                    right: DeviceExt((3 / 841) * 100).h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "lbl_animal_hormones".tr,
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
                                        state.livestockTwoModelObj!.livestockins
                                                    ?.hormoneUse ==
                                                1
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: ((15 / 411) * 100).w,
                                    right: DeviceExt((3 / 841) * 100).h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "lbl_embryo_transfer".tr,
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
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.embryoTransfer ??
                                                false)
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
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: DeviceExt((293 / 841) * 100).h,
                                  margin: EdgeInsets.only(
                                    top: ((15 / 411) * 100).w,
                                    right: DeviceExt((35 / 841) * 100).h,
                                  ),
                                  child: Text(
                                    "msg_which_assisted_reproductive".tr,
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontSize: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(2).h
                                          : DeviceExt(2.5).w,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: ((9 / 411) * 100).w,
                                    right: DeviceExt((3 / 841) * 100).h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_routine_vaccination".tr,
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
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.routineVaccination ??
                                                false)
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: ((9 / 411) * 100).w,
                                    right: DeviceExt((3 / 841) * 100).h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Curative Measures".tr,
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
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.curativeMeasures ??
                                                false)
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
                                      ),
                                    ],
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
                        text: "Next Section".tr,
                        onTap: () {
                          if (state.next) {
                            NavigatorService.popAndPushNamed(
                                AppRoutes.addAquacultureOneScreen);
                          } else {
                            NavigatorService.popAndPushNamed(
                                AppRoutes.addFarmtechandassetsOneScreen);
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
                      onTap: () {
                        if (state.prev) {
                          NavigatorService.popAndPushNamed(
                              AppRoutes.cropAgricultureScreen);
                        } else {
                          NavigatorService.popAndPushNamed(
                              AppRoutes.farmerRegistrationScreen);
                        }
                      },
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
