// ignore_for_file: must_call_super

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
                      padding: EdgeInsets.only(left: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgRectangle9,
                            onTap: () => Navigator.pop(context),
                            height: 50.v,
                            width: 343.h,
                            margin: EdgeInsets.only(left: 16.h),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Row(
                              children: [
                                Text(
                                  "lbl_farmer_info".tr,
                                  style: CustomTextStyles.labelMediumPrimary,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 21.h),
                                  child: Text(
                                    PrefUtils()
                                        .getFarmerName(), // "msg_farmer_felix_faro".tr,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 17.v,
                              right: 15.h,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.h,
                              vertical: 29.v,
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
                                  padding: EdgeInsets.only(right: 2.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_utilize_fodder".tr,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                      Text(
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.fertilizerForFodder ??
                                                false)
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.v,
                                    right: 2.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_utilize_fertilizer".tr,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                      Text(
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.fodderSeeds ??
                                                false)
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 293.h,
                                  margin: EdgeInsets.only(
                                    top: 15.v,
                                    right: 35.h,
                                  ),
                                  child: Text(
                                    "msg_which_assisted_reproductive".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTextStyles.labelLargePrimaryBold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 9.v,
                                    right: 3.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_artificial_insemination".tr,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                      Text(
                                        (state.livestockTwoModelObj!
                                                    .livestockins?.aiUse ==
                                                1)
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 14.v,
                                    right: 3.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "lbl_animal_hormones".tr,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                      Text(
                                        state.livestockTwoModelObj!.livestockins
                                                    ?.hormoneUse ==
                                                1
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.v,
                                    right: 3.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "lbl_embryo_transfer".tr,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                      Text(
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.embryoTransfer ??
                                                false)
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 293.h,
                                  margin: EdgeInsets.only(
                                    top: 15.v,
                                    right: 35.h,
                                  ),
                                  child: Text(
                                    "msg_which_assisted_reproductive".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTextStyles.labelLargePrimaryBold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 9.v,
                                    right: 3.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_routine_vaccination".tr,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                      Text(
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.routineVaccination ??
                                                false)
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 9.v,
                                    right: 3.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Curative Measures".tr,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                      Text(
                                        (state
                                                    .livestockTwoModelObj!
                                                    .livestockins
                                                    ?.curativeMeasures ??
                                                false)
                                            ? "Yes"
                                            : "No",
                                        style: theme.textTheme.labelMedium,
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
                    SizedBox(height: 20.v),
                    Visibility(
                      visible: state.done,
                      child: CustomElevatedButton(
                        width: ResponsiveExtension(343).h,
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
                    SizedBox(height: 20.v),
                    CustomElevatedButton(
                      width: ResponsiveExtension(343).h,
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
                      margin: EdgeInsets.only(bottom: 10.v),
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
