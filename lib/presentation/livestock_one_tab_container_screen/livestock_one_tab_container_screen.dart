import 'bloc/livestock_one_tab_container_bloc.dart';
import 'models/livestock_one_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/presentation/livestock_one_page/livestock_one_page.dart';
import 'package:kiamis_app/presentation/livestock_two_page/livestock_two_page.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
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
                  title: AppbarSubtitle1(text: "lbl_livestock".tr),
                  actions: [
                    if (state.liveorins)
                      AppbarImage1(
                          svgPath: ImageConstant.imgFrame34WhiteA70044x44,
                          margin: EdgeInsets.fromLTRB(11.h, 5.v, 11.h, 9.v),
                          onTap: () {
                            onTapImage(context);
                          }),
                    if (!state.liveorins)
                      AppbarImage1(
                          svgPath: ImageConstant.imgFrame33,
                          margin: EdgeInsets.fromLTRB(11.h, 5.v, 11.h, 9.v),
                          onTap: () {
                            gotoInputs(context);
                          })
                  ],
                  styleType: Style.bgFill),
              body: SizedBox(
                  width: mediaQueryData.size.width,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 4.v),
                      child: Column(children: [
                        Container(
                            height: 50.v,
                            width: 350.h,
                            decoration: BoxDecoration(
                                color: appTheme.gray5001,
                                border: Border.all(
                                    color: appTheme.whiteA700, width: 1.h)),
                            child: TabBar(
                                onTap: (value) => changeTab(context, value),
                                controller: tabviewController,
                                labelPadding: EdgeInsets.zero,
                                labelColor: theme.colorScheme.primary,
                                labelStyle: TextStyle(
                                    fontSize: 16.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                                unselectedLabelColor: appTheme.blueGray40003,
                                unselectedLabelStyle: TextStyle(
                                    fontSize: 16.fSize,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                                indicatorColor: theme.colorScheme.primary,
                                tabs: [
                                  Tab(child: Text("msg_livestock_reared".tr)),
                                  Tab(child: Text("lbl_livestock_input".tr))
                                ])),
                        SizedBox(
                            height: 959.v,
                            child: TabBarView(
                                controller: tabviewController,
                                children: [
                                  LivestockOnePage.builder(context),
                                  LivestockTwoPage.builder(context)
                                ]))
                      ])))));
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
    NavigatorService.popAndPushNamed(
      AppRoutes.addRearedLivestockOneScreen,
    );
  }
}
