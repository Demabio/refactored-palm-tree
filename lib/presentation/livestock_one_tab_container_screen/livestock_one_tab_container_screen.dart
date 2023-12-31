import 'package:flutter_sizer/flutter_sizer.dart';

import 'bloc/livestock_one_tab_container_bloc.dart';
import 'models/livestock_one_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/presentation/livestock_one_page/livestock_one_page.dart';
import 'package:kiamis_app/presentation/livestock_two_page/livestock_two_page.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

class LivestockOneTabContainerScreen extends StatefulWidget {
  const LivestockOneTabContainerScreen({Key? key}) : super(key: key);

  @override
  LivestockOneTabContainerScreenState createState() =>
      LivestockOneTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<LivestockOneTabContainerBloc>(
        create: (context) => LivestockOneTabContainerBloc(
            LivestockOneTabContainerState(
                livestockOneTabContainerModelObj:
                    LivestockOneTabContainerModel()))
          ..add(LivestockOneTabContainerInitialEvent()),
        child: LivestockOneTabContainerScreen());
  }
}

// ignore_for_file: must_be_immutable
class LivestockOneTabContainerScreenState
    extends State<LivestockOneTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<LivestockOneTabContainerBloc,
        LivestockOneTabContainerState>(builder: (context, state) {
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
                    title: AppbarSubtitle1(text: "lbl_livestock".tr),
                    actions: [
                      if (state.liveorins)
                        CustomImageView(
                            svgPath: ImageConstant.imgFrame34WhiteA70044x44,
                            height: Device.orientation == Orientation.portrait
                                ? DeviceExt(5).h
                                : 5.w,
                            width: Device.orientation == Orientation.portrait
                                ? DeviceExt(5).h
                                : 5.w,
                            onTap: () {
                              onTapImage(context);
                            }),
                      if (!state.liveorins)
                        CustomImageView(
                            svgPath: ImageConstant.imgFrame33,
                            height: Device.orientation == Orientation.portrait
                                ? DeviceExt(5).h
                                : 5.w,
                            width: Device.orientation == Orientation.portrait
                                ? DeviceExt(5).h
                                : 5.w,
                            onTap: () {
                              gotoInputs(context);
                            }),
                    ],
                    styleType: Style.bgFill),
                body: SizedBox(
                    width: mediaQueryData.size.width,
                    child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: ((4 / 411) * 100).w),
                        child: Column(children: [
                          Container(
                              height: ((50 / 411) * 100).w,
                              width: DeviceExt((350 / 841) * 100).h,
                              decoration: BoxDecoration(
                                  color: appTheme.gray5001,
                                  border: Border.all(
                                      color: appTheme.whiteA700,
                                      width: DeviceExt((1 / 841) * 100).h)),
                              child: TabBar(
                                  onTap: (value) => changeTab(context, value),
                                  controller: tabviewController,
                                  labelPadding: EdgeInsets.zero,
                                  labelColor: theme.colorScheme.primary,
                                  // labelStyle: TextStyle(
                                  //     fontSize: 16.fSize,
                                  //     fontFamily: 'Poppins',
                                  //     fontWeight: FontWeight.w400),
                                  // unselectedLabelColor: appTheme.blueGray40003,
                                  // unselectedLabelStyle: TextStyle(
                                  //     fontSize: 16.fSize,
                                  //     fontFamily: 'Poppins',
                                  //     fontWeight: FontWeight.w400),
                                  indicatorColor: theme.colorScheme.primary,
                                  tabs: [
                                    Tab(
                                        child: Text(
                                      "msg_livestock_reared".tr,
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontSize: Device.orientation ==
                                                Orientation.portrait
                                            ? DeviceExt(2).h
                                            : DeviceExt(2.5).w,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Tab(
                                        child: Text(
                                      "lbl_livestock_input".tr,
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontSize: Device.orientation ==
                                                Orientation.portrait
                                            ? DeviceExt(2).h
                                            : DeviceExt(2.5).w,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                                  ])),
                          SizedBox(
                              height: double.maxFinite,
                              child: TabBarView(
                                  controller: tabviewController,
                                  children: [
                                    LivestockOnePage.builder(context),
                                    LivestockTwoPage.builder(context)
                                  ]))
                        ]))))),
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

  gotoInputs(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addLiverstockinputScreen,
    );
  }

  changeTab(BuildContext context, int value) {
    context
        .read<LivestockOneTabContainerBloc>()
        .add(ChangeTabEvent(value: value));
  }

  /// Navigates to the addRearedLivestockOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addRearedLivestockOneScreen.
  onTapImage(BuildContext context) {
    PrefUtils().setLivestockId(0);
    PrefUtils().setFeeds("0");
    PrefUtils().setAgeGroups("0");
    NavigatorService.popAndPushNamed(
      AppRoutes.addRearedLivestockOneScreen,
    );
  }
}
