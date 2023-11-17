import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/widgets/coop_widget.dart';
import 'package:kiamis_app/presentation/financialandservices_screen/widgets/inputs_widget.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/financialandservices_bloc.dart';
import 'models/financialandservices_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class FinancialandservicesScreen extends StatelessWidget {
  const FinancialandservicesScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FinancialandservicesBloc>(
        create: (context) => FinancialandservicesBloc(FinancialandservicesState(
            financialandservicesModelObj: FinancialandservicesModel()))
          ..add(FinancialandservicesInitialEvent()),
        child: FinancialandservicesScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<FinancialandservicesBloc, FinancialandservicesState>(
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
                title: AppbarSubtitle4(text: "msg_financial_and_services2".tr),
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
                                  ),
                                ))
                          ])),
                      SizedBox(height: ((15 / 411) * 100).w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: DeviceExt((5 / 841) * 100).h,
                            vertical: ((19 / 411) * 100).w),
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
                                  "msg_financial_livelihood".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            BlocSelector<
                                    FinancialandservicesBloc,
                                    FinancialandservicesState,
                                    List<CheckBoxList>?>(
                                selector: (state) => state.i,
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

                                          return IncomesWidget(
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
                                    top: ((2 / 411) * 100).w,
                                    right: DeviceExt((6 / 841) * 100).h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((186 / 841) * 100).h,
                                          child: Text(
                                            "msg_percentage_of_household".tr,
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
                                              bottom: ((19 / 411) * 100).w),
                                          child: Text(
                                            "${state.farm?.farmingIncomePercent ?? "Not Applied"}",
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
                                    left: DeviceExt((4 / 841) * 100).h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((173 / 841) * 100).h,
                                          child: Text(
                                            "msg_do_you_belong_to".tr,
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
                                              bottom: ((18 / 411) * 100).w),
                                          child: Text(
                                            (state.farm?.cooperativeGroup ??
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
                                            ),
                                          ))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((2 / 411) * 100).w),
                                child: Text(
                                  "msg_cooperative_groups".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            BlocSelector<
                                    FinancialandservicesBloc,
                                    FinancialandservicesState,
                                    List<CheckBoxList>?>(
                                selector: (state) => state.c,
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

                                          return CoopItemWidget(
                                            model,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(height: ((20 / 411) * 100).w),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((2 / 411) * 100).w),
                                child: Text(
                                  "msg_financial_services".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            BlocSelector<
                                    FinancialandservicesBloc,
                                    FinancialandservicesState,
                                    List<CheckBoxList>?>(
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
                                }),
                            SizedBox(height: ((20 / 411) * 100).w),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((3 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_insure_your2".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2).w),
                                      ),
                                      Text(
                                        (state.f?.cropsInsurance ?? false)
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
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((2 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_insure_your3".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2).w),
                                      ),
                                      Text(
                                        state.f?.livestockInsurance ?? false
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
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((2 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_do_you_insure_your".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2).w),
                                      ),
                                      Text(
                                        state.f?.fishInsurance ?? false
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
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((2 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((191 / 841) * 100).h,
                                          child: Text(
                                            "msg_do_you_insure_your4".tr,
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
                                              bottom: ((15 / 411) * 100).w),
                                          child: Text(
                                            state.f?.assetsInsurance ?? false
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
                                          ))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((6 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: DeviceExt((141 / 841) * 100).h,
                                          child: Text(
                                            "msg_do_you_keep_written".tr,
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
                                              bottom: ((15 / 411) * 100).w),
                                          child: Text(
                                            state.f?.farmRecords ?? false
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
                                          ))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((4 / 411) * 100).w),
                                child: Text(
                                  "msg_agricultural_info".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            Container(
                                width: DeviceExt((275 / 841) * 100).h,
                                margin: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((2 / 411) * 100).w,
                                    right: DeviceExt((54 / 841) * 100).h),
                                child: Text(
                                  "msg_what_is_your_main".tr,
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            BlocSelector<
                                    FinancialandservicesBloc,
                                    FinancialandservicesState,
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
                            SizedBox(height: ((20 / 411) * 100).w),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((3 / 411) * 100).w),
                                child: Text(
                                  "msg_soil_seeds_and".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((2 / 411) * 100).w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "msg_extension_service".tr,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                                fontSize: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(1.8).h
                                                    : DeviceExt(2).w),
                                      ),
                                      Text(
                                        state.f?.extensionsericeAccess == 1
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
                              visible: state.farm?.extensionsericeAccess == 1,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: DeviceExt((4 / 841) * 100).h,
                                      top: ((4 / 411) * 100).w),
                                  child: Text(
                                    "msg_if_yes_from_where".tr,
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontSize: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(1.8).h
                                          : DeviceExt(2).w,
                                    ),
                                  )),
                            ),
                            Visibility(
                              visible: state.farm?.extensionsericeAccess == 1,
                              child: BlocSelector<
                                      FinancialandservicesBloc,
                                      FinancialandservicesState,
                                      List<CheckBoxList>?>(
                                  selector: (state) => state.e,
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
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((4 / 841) * 100).h,
                                    top: ((4 / 411) * 100).w),
                                child: Text(
                                  "msg_what_is_the_mode".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                )),
                            SizedBox(height: ((20 / 411) * 100).w),
                            BlocSelector<FinancialandservicesBloc,
                                FinancialandservicesState, List<CheckBoxList>?>(
                              selector: (state) => state.m,
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
                          text: "Main Page".tr,
                          onTap: () => NavigatorService.popAndPushNamed(
                              AppRoutes.farmerRegistrationScreen),
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
                          NavigatorService.popAndPushNamed(
                            AppRoutes.landandwatermgmtScreen,
                          );
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
    if (PrefUtils().getFound()) {
      NavigatorService.popAndPushNamed(
        AppRoutes.addFinancialandservicesTwoScreen,
      );
    } else {
      NavigatorService.popAndPushNamed(
        AppRoutes.addFinancialandservicesOneScreen,
      );
    }
  }
}
