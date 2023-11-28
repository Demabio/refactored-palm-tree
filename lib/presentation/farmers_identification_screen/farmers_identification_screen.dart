import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/farmers_identification_bloc.dart';
import 'models/farmers_identification_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class FarmersIdentificationScreen extends StatelessWidget {
  FarmersIdentificationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmersIdentificationBloc>(
        create: (context) => FarmersIdentificationBloc(
            FarmersIdentificationState(
                farmersIdentificationModelObj: FarmersIdentificationModel()))
          ..add(FarmersIdentificationInitialEvent()),
        child: FarmersIdentificationScreen());
  }

  RegExp pattern = RegExp(r'\b(?:Other|other)\b');
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<FarmersIdentificationBloc, FarmersIdentificationState>(
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
                  title: AppbarSubtitle1(text: "msg_farmers_identification".tr),
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
                  padding: EdgeInsets.only(top: ((9 / 411) * 100).w),
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
                                left: DeviceExt((3 / 841) * 100).h),
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
                                    state.farmersIdentificationModelObj?.farmer
                                            ?.farmerName ??
                                        "Not Applied",
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: Colors.black,
                                      fontSize: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(2).h
                                          : DeviceExt(2.5).w,
                                    ),
                                  ))
                            ])),
                        SizedBox(height: ((17 / 411) * 100).w),
                        Text(
                          "msg_individual_farmer".tr,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontSize: Device.orientation == Orientation.portrait
                                ? DeviceExt(2).h
                                : DeviceExt(2.5).w,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: ((10 / 411) * 100).w,
                                right: DeviceExt((3 / 841) * 100).h),
                            padding: EdgeInsets.symmetric(
                                horizontal: DeviceExt((6 / 841) * 100).h,
                                vertical: ((7 / 411) * 100).w),
                            decoration: AppDecoration.outlinePrimary.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "lbl_farmer_name".tr,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ),
                                        Text(
                                          state.farmersIdentificationModelObj
                                                  ?.farmer?.farmerName ??
                                              "Not Applied",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((17 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "msg_national_id_number".tr,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ),
                                        Text(
                                          state.farmersIdentificationModelObj
                                                  ?.farmer?.idNo ??
                                              "Not Applied",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((17 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: ((1 / 411) * 100).w),
                                            child: Text(
                                              "lbl_email".tr,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2).w,
                                              ),
                                            )),
                                        Text(
                                          state.farmersIdentificationModelObj
                                                  ?.farmer?.email ??
                                              "Not Applied",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((16 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Date of birth",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ),
                                        Text(
                                          state.farmersIdentificationModelObj!
                                                      .farmer?.dob !=
                                                  null
                                              ? state
                                                  .farmersIdentificationModelObj!
                                                  .farmer!
                                                  .dob!
                                                  .toString()
                                              : "Not Applied",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((18 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "lbl_postal_address".tr,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ),
                                        Text(
                                          state.farmersIdentificationModelObj
                                                  ?.farmer?.postalAddress ??
                                              "Not Applied",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((18 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "lbl_postal_code".tr,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ),
                                        Text(
                                          state.farmersIdentificationModelObj
                                                  ?.farmer?.postalAddress ??
                                              "Not Applied",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((17 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "lbl_mobile_number".tr,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ),
                                        Text(
                                          state.farmersIdentificationModelObj
                                                  ?.farmer?.mobile ??
                                              "Not Applied",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((17 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "lbl_marital_status".tr,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ),
                                        Text(
                                          state.farmersIdentificationModelObj
                                                  ?.marital ??
                                              "Not Applied",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((18 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "lbl_sex".tr,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ),
                                        Text(
                                          state.farmersIdentificationModelObj
                                                      ?.farmer?.gender ==
                                                  1
                                              ? "Male"
                                              : state.farmersIdentificationModelObj
                                                          ?.farmer?.gender ==
                                                      2
                                                  ? "Female"
                                                  : "Other",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((17 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "lbl_hh_size".tr,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ),
                                        Text(
                                          state.farmersIdentificationModelObj
                                                  ?.farmer?.hhSize
                                                  .toString() ??
                                              "Not Applied",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        )
                                      ]),
                                  SizedBox(height: ((18 / 411) * 100).w),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: DeviceExt(50).w,
                                          child: Text(
                                            "msg_agriculture_formal".tr,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: DeviceExt(30).w,
                                          child: Text(
                                            state.farmersIdentificationModelObj
                                                        ?.farmer?.agriSkillsId ==
                                                    1
                                                ? "Yes"
                                                : "No",
                                            textAlign: TextAlign.right,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              color: Colors.black,
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
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
                                                bottom: ((16 / 411) * 100).w),
                                            child: Container(
                                              width: DeviceExt(50).w,
                                              child: Text(
                                                "msg_formal_education".tr,
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                  fontSize: Device
                                                              .orientation ==
                                                          Orientation.portrait
                                                      ? DeviceExt(1.8).h
                                                      : DeviceExt(2).w,
                                                ),
                                              ),
                                            )),
                                        Container(
                                            child: Text(
                                          state.farmersIdentificationModelObj
                                                  ?.ed ??
                                              "Not Applied",
                                          maxLines: 10,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.right,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.8).h
                                                : DeviceExt(2).w,
                                          ),
                                        ))
                                      ]),
                                  SizedBox(height: ((3 / 411) * 100).w)
                                ])),
                        SizedBox(height: ((11 / 411) * 100).w),
                        Text(
                          "msg_respondent_details".tr,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontSize: Device.orientation == Orientation.portrait
                                ? DeviceExt(2).h
                                : DeviceExt(2.5).w,
                          ),
                        ),
                        SizedBox(height: ((8 / 411) * 100).w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: DeviceExt((9 / 841) * 100).h,
                              vertical: ((23 / 411) * 100).w),
                          decoration: AppDecoration.outlinePrimary.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: DeviceExt((1 / 841) * 100).h),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: ((1 / 411) * 100).w),
                                            child: Text(
                                              "msg_is_farmer_respondent".tr,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2).w,
                                              ),
                                            )),
                                        Text(
                                          state
                                                      .farmersIdentificationModelObj
                                                      ?.farmer
                                                      ?.farmerTheRespodent ??
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
                                          ),
                                        )
                                      ])),
                              Visibility(
                                visible: !(state.farmersIdentificationModelObj
                                        ?.farmer?.farmerTheRespodent ??
                                    false),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: DeviceExt((1 / 841) * 100).h,
                                      top: ((13 / 411) * 100).w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: ((1 / 411) * 100).w),
                                          child: Container(
                                            width: DeviceExt(50).w,
                                            child: Text(
                                              "msg_respondent_relationship".tr,
                                              maxLines: 10,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2).w,
                                              ),
                                            ),
                                          )),
                                      Container(
                                        width: DeviceExt(30).w,
                                        child: Text(
                                          pattern.hasMatch(state
                                                      .farmersIdentificationModelObj
                                                      ?.rship ??
                                                  "")
                                              ? "${state.farmersIdentificationModelObj?.rship} - ${state.farmersIdentificationModelObj?.farmer?.other ?? ""}"
                                              : state.farmersIdentificationModelObj
                                                      ?.rship ??
                                                  "Not Applied",
                                          textAlign: TextAlign.right,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            color: Colors.black,
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
                              ),
                              Visibility(
                                visible: !(state.farmersIdentificationModelObj
                                        ?.farmer?.farmerTheRespodent ??
                                    false),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: DeviceExt((1 / 841) * 100).h,
                                      top: ((13 / 411) * 100).w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: ((1 / 411) * 100).w),
                                          child: Text(
                                            "Respondent Name:".tr,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Text(
                                        state.farmersIdentificationModelObj
                                                ?.farmer?.respondentName ??
                                            "Not Applied",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !(state.farmersIdentificationModelObj
                                        ?.farmer?.farmerTheRespodent ??
                                    false),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: DeviceExt((1 / 841) * 100).h,
                                      top: ((13 / 411) * 100).w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: ((1 / 411) * 100).w),
                                          child: Text(
                                            "Respondent ID Number:".tr,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Text(
                                        state.farmersIdentificationModelObj
                                                ?.farmer?.respNationalId ??
                                            "Not Applied",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: ((20 / 411) * 100).w),
                              Visibility(
                                visible: !(state.farmersIdentificationModelObj
                                        ?.farmer?.farmerTheRespodent ??
                                    false),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: DeviceExt((1 / 841) * 100).h,
                                      top: ((13 / 411) * 100).w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: ((1 / 411) * 100).w),
                                          child: Text(
                                            "Respondent Mobile:".tr,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          )),
                                      Text(
                                        state.farmersIdentificationModelObj
                                                ?.farmer?.respondentMobile ??
                                            "Not Applied",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                              fontSize:
                                  Device.orientation == Orientation.portrait
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
                            onTap: () => NavigatorService.popAndPushNamed(
                                AppRoutes.primaryFarmHoldingOneScreen),
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
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
}
