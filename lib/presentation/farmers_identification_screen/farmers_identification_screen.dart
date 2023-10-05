import 'bloc/farmers_identification_bloc.dart';
import 'models/farmers_identification_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

class FarmersIdentificationScreen extends StatelessWidget {
  const FarmersIdentificationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmersIdentificationBloc>(
        create: (context) => FarmersIdentificationBloc(
            FarmersIdentificationState(
                farmersIdentificationModelObj: FarmersIdentificationModel()))
          ..add(FarmersIdentificationInitialEvent()),
        child: FarmersIdentificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<FarmersIdentificationBloc, FarmersIdentificationState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: CustomAppBar(
                  leadingWidth: 60.h,
                  leading: AppbarImage(
                      svgPath: ImageConstant.imgSort,
                      margin:
                          EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                      onTap: () {
                        onTapSortone(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "msg_farmers_identification".tr),
                  actions: [
                    AppbarImage1(
                        onTap: () {
                          NavigatorService.pushNamed(
                              AppRoutes.farmersIdentificationOneScreen);
                        },
                        svgPath: ImageConstant.imgFrame33,
                        margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v))
                  ],
                  styleType: Style.bgFill),
              body: SizedBox(
                  width: mediaQueryData.size.width,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 9.v),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.h, right: 15.h, bottom: 5.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 3.h),
                                    child: Row(children: [
                                      Text("lbl_farmer_info".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary),
                                      Padding(
                                          padding: EdgeInsets.only(left: 21.h),
                                          child: Text(
                                              "msg_farmer_felix_faro".tr,
                                              style:
                                                  theme.textTheme.labelMedium))
                                    ])),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.h, top: 12.v),
                                    child: Text("msg_enumeration_geography".tr,
                                        style: CustomTextStyles
                                            .titleMediumSemiBold)),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 8.v, right: 6.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.h, vertical: 23.v),
                                    decoration: AppDecoration.outlinePrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 1.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 1.v),
                                                        child: Text(
                                                            "lbl_division".tr,
                                                            style: CustomTextStyles
                                                                .labelMediumPrimary)),
                                                    Text("lbl_chesegon".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 13.v, right: 1.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                            "lbl_constituency"
                                                                .tr,
                                                            style: CustomTextStyles
                                                                .labelMediumPrimary)),
                                                    Text("lbl_kacheliba".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 13.v, right: 1.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_location".tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_emboasis".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 14.v, right: 1.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_sub_location".tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_emboasis".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.v, right: 1.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_village_unit_name"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_village_unit".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 13.v, right: 1.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_enumerator_area"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_1234567891234".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          SizedBox(height: 16.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("msg_shopping_center".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_shopping_center".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ])
                                        ])),
                                SizedBox(height: 9.v),
                                Text("msg_individual_farmer".tr,
                                    style:
                                        CustomTextStyles.titleMediumSemiBold),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 10.v, right: 3.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.h, vertical: 7.v),
                                    decoration: AppDecoration.outlinePrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_farmer_name".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("msg_farmer_felix_faro".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 17.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "msg_national_id_number".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_34598721".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 17.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 1.v),
                                                    child: Text("lbl_email".tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary)),
                                                Text("msg_ffelixf_gmail_com".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 16.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_year_of_birth".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_1990".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 18.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_postal_address".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_1111".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 18.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_postal_code".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_1001".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 17.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_mobile_number".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_0724087222".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 17.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_marital_status".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_yes".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 18.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_sex".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_male".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 17.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_hh_size".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_30".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 18.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "msg_agriculture_formal".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary),
                                                Text("lbl_yes".tr,
                                                    style: theme
                                                        .textTheme.labelMedium)
                                              ]),
                                          SizedBox(height: 16.v),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 16.v),
                                                    child: Text(
                                                        "msg_formal_education"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary)),
                                                Container(
                                                    width: 200.h,
                                                    margin: EdgeInsets.only(
                                                        left: 24.h),
                                                    child: Text(
                                                        "msg_post_graduate_degree"
                                                            .tr,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: theme.textTheme
                                                            .labelMedium))
                                              ]),
                                          SizedBox(height: 3.v)
                                        ])),
                                SizedBox(height: 11.v),
                                Text("msg_respondent_details".tr,
                                    style:
                                        CustomTextStyles.titleMediumSemiBold),
                                SizedBox(height: 8.v),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 9.h, vertical: 23.v),
                                    decoration: AppDecoration.outlinePrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                            "msg_is_farmer_respondent"
                                                                .tr,
                                                            style: CustomTextStyles
                                                                .labelMediumPrimary)),
                                                    Text("lbl_no".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 1.h, top: 13.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                            "msg_respondent_relationship"
                                                                .tr,
                                                            style: CustomTextStyles
                                                                .labelMediumPrimary)),
                                                    Text("lbl_n_a".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ]))
                                        ])),
                                SizedBox(height: 11.v),
                                Text("msg_enumeration_geography".tr,
                                    style:
                                        CustomTextStyles.titleMediumSemiBold),
                                SizedBox(height: 5.v),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.h, vertical: 19.v),
                                    decoration: AppDecoration.outlinePrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 2.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_crop_production"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_yes".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 13.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_livestock_production"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_yes".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 2.h, top: 15.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_aquaculture_production"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_no".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ]))
                                        ]))
                              ]))))));
    });
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
