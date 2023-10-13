import 'bloc/financialandservices_bloc.dart';
import 'models/financialandservices_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

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
                  title:
                      AppbarSubtitle4(text: "msg_financial_and_services2".tr),
                  actions: [
                    AppbarImage1(
                        svgPath: ImageConstant.imgFrame33,
                        margin: EdgeInsets.fromLTRB(14.h, 3.v, 14.h, 11.v),
                        onTap: () {
                          onTapImage(context);
                        })
                  ],
                  styleType: Style.bgFill),
              body: SizedBox(
                  width: mediaQueryData.size.width,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.h, right: 15.h, bottom: 5.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
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
                                SizedBox(height: 15.v),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.h, vertical: 19.v),
                                    decoration: AppDecoration.outlinePrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 4.h),
                                              child: Text(
                                                  "msg_financial_livelihood".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          BlocSelector<
                                                  AddFinancialandservicesOneBloc,
                                                  AddFinancialandservicesOneState,
                                                  List<CheckBoxList>?>(
                                              selector: (state) => state.i,
                                              builder: (context, list) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 15.v,
                                                    right: 16.h,
                                                  ),
                                                  child: Column(
                                                    children:
                                                        List<Widget>.generate(
                                                      list?.length ?? 0,
                                                      (index) {
                                                        CheckBoxList model =
                                                            list![index];

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
                                                  left: 4.h,
                                                  top: 2.v,
                                                  right: 6.h),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: 186.h,
                                                        child: Text(
                                                            "msg_percentage_of_household"
                                                                .tr,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: CustomTextStyles
                                                                .labelMediumPrimary)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 19.v),
                                                        child: Text("lbl_25".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium))
                                                  ])),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 4.h),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: 173.h,
                                                        child: Text(
                                                            "msg_do_you_belong_to"
                                                                .tr,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: CustomTextStyles
                                                                .labelMediumPrimary)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 18.v),
                                                        child: Text(
                                                            "lbl_yes".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium))
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 2.v),
                                              child: Text(
                                                  "msg_cooperative_groups".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 4.v,
                                                  right: 9.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_other_cooperative"
                                                            .tr,
                                                        style: theme.textTheme
                                                            .labelMedium),
                                                    Text("lbl_faro_group".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 4.v,
                                                  right: 9.h),
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
                                                            "msg_common_interest"
                                                                .tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium)),
                                                    Text("lbl_common".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 2.v),
                                              child: Text(
                                                  "msg_financial_services".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 5.v),
                                              child: Text(
                                                  "msg_mobile_money_saving".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 14.v),
                                              child: Text(
                                                  "msg_self_salary_or".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 3.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_do_you_insure_your2"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_yes".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 2.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_do_you_insure_your3"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_yes".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 2.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_do_you_insure_your"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_yes".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 2.v),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: 191.h,
                                                        child: Text(
                                                            "msg_do_you_insure_your4"
                                                                .tr,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: CustomTextStyles
                                                                .labelMediumPrimary)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 15.v),
                                                        child: Text(
                                                            "lbl_yes".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium))
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 6.v),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: 141.h,
                                                        child: Text(
                                                            "msg_do_you_keep_written"
                                                                .tr,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: CustomTextStyles
                                                                .labelMediumPrimary)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 15.v),
                                                        child: Text(
                                                            "lbl_yes".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium))
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 4.v),
                                              child: Text(
                                                  "msg_agricultural_info".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Container(
                                              width: 275.h,
                                              margin: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 2.v,
                                                  right: 54.h),
                                              child: Text(
                                                  "msg_what_is_your_main".tr,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 3.v),
                                              child: Text(
                                                  "msg_extension_meetings".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 3.v),
                                              child: Text(
                                                  "msg_soil_seeds_and".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 2.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "msg_extension_service"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelMediumPrimary),
                                                    Text("lbl_yes".tr,
                                                        style: theme.textTheme
                                                            .labelMedium)
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 4.v),
                                              child: Text(
                                                  "msg_if_yes_from_where".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 2.v),
                                              child: Text("lbl_television".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 15.v),
                                              child: Text("lbl_relatives".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 4.v),
                                              child: Text(
                                                  "msg_what_is_the_mode".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumPrimary)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h, top: 2.v),
                                              child: Text("lbl_face_to_face".tr,
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.h,
                                                  top: 14.v,
                                                  bottom: 32.v),
                                              child: Text("lbl_e_extension".tr,
                                                  style: theme
                                                      .textTheme.labelMedium))
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

  /// Navigates to the primaryFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingOneScreen.
  onTapImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.primaryFarmHoldingOneScreen,
    );
  }
}
