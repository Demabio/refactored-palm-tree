import 'bloc/livestock_one_bloc.dart';
import 'models/livestock_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class LivestockOnePage extends StatefulWidget {
  const LivestockOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  LivestockOnePageState createState() => LivestockOnePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<LivestockOneBloc>(
      create: (context) => LivestockOneBloc(LivestockOneState(
        livestockOneModelObj: LivestockOneModel(),
      ))
        ..add(LivestockOneInitialEvent()),
      child: LivestockOnePage(),
    );
  }
}

class LivestockOnePageState extends State<LivestockOnePage>
    with AutomaticKeepAliveClientMixin<LivestockOnePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<LivestockOneBloc, LivestockOneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15.h,
                        top: 11.v,
                        right: 15.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "lbl_farmer_info".tr,
                                style: CustomTextStyles.labelMediumPrimary,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 21.h),
                                child: Text(
                                  "msg_farmer_felix_faro".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 13.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.h,
                              vertical: 12.v,
                            ),
                            decoration: AppDecoration.outlinePrimary.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 17.v,
                                    right: 5.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "lbl_livestock2".tr,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                      Text(
                                        "lbl_merino".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.v),
                                Text(
                                  "msg_livestock_age_groups".tr,
                                  style: CustomTextStyles.labelMediumPrimary,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 13.v,
                                    right: 15.h,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "lbl_1_2_years".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Spacer(),
                                      Text(
                                        "lbl_males_30".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 49.h),
                                        child: Text(
                                          "lbl_female_35".tr,
                                          style: theme.textTheme.labelMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.v,
                                    right: 16.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_less_than_3_weeks".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Text(
                                        "lbl_males_34".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Text(
                                        "lbl_female_56".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 14.v),
                                Text(
                                  "msg_main_livestock_feed".tr,
                                  style: CustomTextStyles.labelMediumPrimary,
                                ),
                                SizedBox(height: 16.v),
                                Text(
                                  "lbl_natural_pasture".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                SizedBox(height: 8.v),
                                Text(
                                  "lbl_own_grown_hay".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                SizedBox(height: 13.v),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 112.h,
                                      child: Text(
                                        "msg_farming_production".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 8.v,
                                        bottom: 9.v,
                                      ),
                                      child: Text(
                                        "lbl_free_range".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.v),
                                CustomImageView(
                                  svgPath: ImageConstant.imgFrame10164,
                                  height: 39.v,
                                  width: 324.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 23.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.h,
                              vertical: 17.v,
                            ),
                            decoration: AppDecoration.outlinePrimary.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 12.v),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.v),
                                      child: Text(
                                        "lbl_livestock2".tr,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                    ),
                                    Text(
                                      "msg_chicken_indigenous".tr,
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.v),
                                Text(
                                  "msg_livestock_age_groups".tr,
                                  style: CustomTextStyles.labelMediumPrimary,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 13.v,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "lbl_1_2_years".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Spacer(
                                        flex: 58,
                                      ),
                                      Text(
                                        "lbl_males_30".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Spacer(
                                        flex: 42,
                                      ),
                                      Text(
                                        "lbl_female_35".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 10.v,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "msg_less_than_3_weeks".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 38.h),
                                        child: Text(
                                          "lbl_males_34".tr,
                                          style: theme.textTheme.labelMedium,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "lbl_female_56".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 10.v,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "lbl_6_12_months".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Spacer(
                                        flex: 52,
                                      ),
                                      Text(
                                        "lbl_males_34".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Spacer(
                                        flex: 47,
                                      ),
                                      Text(
                                        "lbl_female_56".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 10.v,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "lbl_2_6_months".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Spacer(
                                        flex: 53,
                                      ),
                                      Text(
                                        "lbl_males_34".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Spacer(
                                        flex: 46,
                                      ),
                                      Text(
                                        "lbl_female_56".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 7.v),
                                Text(
                                  "msg_main_livestock_feed".tr,
                                  style: CustomTextStyles.labelMediumPrimary,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 16.v,
                                  ),
                                  child: Text(
                                    "lbl_natural_pasture".tr,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 8.v,
                                  ),
                                  child: Text(
                                    "lbl_own_grown_hay".tr,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 6.v,
                                  ),
                                  child: Text(
                                    "lbl_mineral_salts".tr,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 8.v,
                                  ),
                                  child: Text(
                                    "msg_purchased_fodder".tr,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.h,
                                    top: 9.v,
                                  ),
                                  child: Text(
                                    "lbl_calf_pellets".tr,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                                SizedBox(height: 14.v),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 112.h,
                                      child: Text(
                                        "msg_farming_production".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            CustomTextStyles.labelMediumPrimary,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 17.v),
                                      child: Text(
                                        "msg_deep_litter_system".tr,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 29.v),
                                CustomImageView(
                                  svgPath: ImageConstant.imgFrame10164,
                                  height: 39.v,
                                  width: 324.h,
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
            ),
          ),
        );
      },
    );
  }
}
