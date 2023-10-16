import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/presentation/add_aquaculture_five_dialog/widgets/fish_widget.dart';
import 'package:kiamis_app/presentation/add_aquaculture_four_dialog/widgets/ProdSys_widget.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/widgets/inputs_widget.dart';
import 'package:kiamis_app/presentation/add_aquaculture_three_dialog/widgets/aqua_types_widget.dart';

import 'bloc/aquaculture_bloc.dart';
import 'models/aquaculture_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

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
                    leadingWidth: 60.h,
                    leading: AppbarImage(
                        svgPath: ImageConstant.imgSort,
                        margin:
                            EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                        onTap: () {
                          onTapSortone(context);
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "lbl_aquaculture".tr),
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
                                            padding:
                                                EdgeInsets.only(left: 21.h),
                                            child: Text(
                                                PrefUtils().getFarmerName(),
                                                style: theme
                                                    .textTheme.labelMedium))
                                      ])),
                                  SizedBox(height: 15.v),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.h, vertical: 20.v),
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
                                                    "msg_aquaculture_type".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary)),
                                            BlocSelector<
                                                    AquacultureBloc,
                                                    AquacultureState,
                                                    List<CheckBoxList>?>(
                                                selector: (state) =>
                                                    state.aquatypes,
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

                                                          return AquaTypeItemWidget(
                                                            model,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                }),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4.h, top: 4.v),
                                                child: Text(
                                                    "msg_production_system2".tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary)),
                                            BlocSelector<
                                                    AquacultureBloc,
                                                    AquacultureState,
                                                    List<CheckBoxList>?>(
                                                selector: (state) =>
                                                    state.prodsyss,
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
                                                width: 313.h,
                                                margin: EdgeInsets.only(
                                                    left: 4.h,
                                                    top: 3.v,
                                                    right: 16.h),
                                                child: Text(
                                                    "msg_does_the_household".tr,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary)),
                                            BlocSelector<
                                                    AquacultureBloc,
                                                    AquacultureState,
                                                    List<CheckBoxList>?>(
                                                selector: (state) => state.fish,
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
                                                    left: 4.h, top: 3.v),
                                                child: Text(
                                                    "msg_what_are_your_main2"
                                                        .tr,
                                                    style: CustomTextStyles
                                                        .labelMediumPrimary)),
                                            BlocSelector<
                                                    AquacultureBloc,
                                                    AquacultureState,
                                                    List<CheckBoxList>?>(
                                                selector: (state) =>
                                                    state.inputs,
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
                                                    left: 4.h, top: 4.v),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          "msg_do_you_utilize_fertilizers"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .labelMediumPrimary),
                                                      Text(
                                                          state.farmerFishProductionLevel
                                                                      ?.fertilizerInPonds ??
                                                                  false
                                                              ? "Yes"
                                                              : "No",
                                                          style: theme.textTheme
                                                              .labelMedium)
                                                    ])),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4.h,
                                                        top: 17.v,
                                                        right: 12.h),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 1.v),
                                                              child: Text(
                                                                  "msg_which_is_your_production"
                                                                      .tr,
                                                                  style: CustomTextStyles
                                                                      .labelMediumPrimary)),
                                                          Text(
                                                              state.level ??
                                                                  "N/A",
                                                              style: theme
                                                                  .textTheme
                                                                  .labelMedium)
                                                        ]))),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4.h, top: 17.v),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                          width: 197.h,
                                                          child: Text(
                                                              "msg_have_you_benefited"
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
                                                              state.farmerFishProductionLevel
                                                                          ?.espBenefit ==
                                                                      1
                                                                  ? "Yes"
                                                                  : "No",
                                                              style: theme
                                                                  .textTheme
                                                                  .labelMedium))
                                                    ])),
                                          ]))
                                ])))))),
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
