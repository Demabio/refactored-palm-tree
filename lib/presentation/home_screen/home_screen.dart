import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/widgets/graphs/bargraph/bar_chart.dart';
import 'package:tuple/tuple.dart';

import '../../widgets/custom_icon_button.dart';
import '../../widgets/graphs/bargraph/bar_chart_sample2.dart';
import '../../widgets/graphs/donutchart/pie_chart_sample2.dart';
// import '../../widgets/graphs/linegraph/line_chart_widget.dart';
import '../../widgets/graphs/piechart/pie_chart_sample3.dart';
import '../download_setups/home_farmer_not_found_dialog.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';
import 'package:kiamis_app/presentation/home_farmer_found_dialog/home_farmer_found_dialog.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(HomeState(homeModelObj: HomeModel()))
          ..add(HomeInitialEvent()),
        child: HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FarmerDB farmerDB = FarmerDB();
  // FocusNode _firstTextFieldFocus = FocusNode();
  FocusNode _secondTextFieldFocus = FocusNode();
  int count = 0;

  @override
  void initState() {
    super.initState();
    // context.read<HomeBloc>().add(DBCheckEvent(onError: () {
    //       dbNotFound(context);
    //     }, onSuccess: () {
    //       //dbNotFound(context);
    //     }));
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: true,
          drawer: SideMenuDraweritem(),
          appBar: CustomAppBar(
              height: ((47 / 411) * 100).w,
              leadingWidth: DeviceExt((48 / 841) * 100).h,
              leading: AppbarImage(
                onTap: () {
                  onTapMenuone(context);
                },
                svgPath: ImageConstant.imgMenu,
                margin: EdgeInsets.only(
                  left: DeviceExt((24 / 841) * 100).h,
                  top: ((8 / 411) * 100).w,
                  bottom: ((15 / 411) * 100).w,
                ),
              ),
              centerTitle: true,
              title: AppbarSubtitle1(
                text: "lbl_dashboard".tr,
              )),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              padding: Device.orientation == Orientation.portrait
                  ? EdgeInsets.only(top: 10.w)
                  : EdgeInsets.only(top: DeviceExt(10).h),
              child: Padding(
                padding: Device.orientation == Orientation.portrait
                    ? EdgeInsets.only(
                        bottom: 1.2.w,
                      )
                    : EdgeInsets.only(
                        bottom: DeviceExt(1.2).h,
                      ),
                child: Column(
                  children: [
                    SizedBox(
                      height: Device.orientation == Orientation.portrait
                          ? 11.w
                          : DeviceExt(11).h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: Device.orientation == Orientation.portrait
                            ? EdgeInsets.only(left: DeviceExt(3).h, top: 7.v)
                            : EdgeInsets.only(left: DeviceExt(3).w, top: 7.v),
                        child: Text(
                          "msg_farmers_overview".tr,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontSize: Device.orientation == Orientation.portrait
                                ? DeviceExt(2.5).h
                                : DeviceExt(3).w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Device.orientation == Orientation.portrait
                          ? 7.w
                          : DeviceExt(7).h,
                    ),
                    Padding(
                      padding: Device.orientation == Orientation.portrait
                          ? EdgeInsets.symmetric(horizontal: DeviceExt(0.1).h)
                          : EdgeInsets.symmetric(horizontal: DeviceExt(0.1).w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: Device.orientation == Orientation.portrait
                                  ? EdgeInsets.only(right: DeviceExt(1).h)
                                  : EdgeInsets.only(right: DeviceExt(1).w),
                              padding:
                                  Device.orientation == Orientation.portrait
                                      ? EdgeInsets.symmetric(
                                          horizontal: DeviceExt(2).h,
                                          vertical: 5.w,
                                        )
                                      : EdgeInsets.symmetric(
                                          horizontal: DeviceExt(1).w,
                                          vertical: DeviceExt(5).h,
                                        ),
                              decoration: AppDecoration.fillGray.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder15),
                              child: Row(
                                children: [
                                  CustomIconButton(
                                      onTap: () {
                                        PrefUtils().setAction("To Submit");
                                        NavigatorService.popAndPushNamed(
                                            AppRoutes.draftEntriesScreen);
                                      },
                                      height: Device.orientation ==
                                              Orientation.portrait
                                          ? 11.w
                                          : DeviceExt(11).h,
                                      width: Device.orientation ==
                                              Orientation.portrait
                                          ? 11.w
                                          : DeviceExt(11).h,
                                      padding: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.all(DeviceExt(0.5).h)
                                          : EdgeInsets.all(0.5.w),
                                      decoration: IconButtonStyleHelper
                                          .fillPrimaryContainer,
                                      child: CustomImageView(
                                        height: Device.orientation ==
                                                Orientation.portrait
                                            ? DeviceExt(3).h
                                            : 3.w,
                                        width: Device.orientation ==
                                                Orientation.portrait
                                            ? DeviceExt(3).h
                                            : 3.w,
                                        fit: BoxFit.fill,
                                        svgPath: ImageConstant.imgSave,
                                      )),
                                  Padding(
                                    padding: Device.orientation ==
                                            Orientation.portrait
                                        ? EdgeInsets.only(
                                            left: DeviceExt(1).h, bottom: 0.5.w)
                                        : EdgeInsets.only(
                                            left: DeviceExt(1).w,
                                            bottom: DeviceExt(0.5).h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "To Submit".tr,
                                          style: theme.textTheme.headlineSmall
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.5).h
                                                : DeviceExt(2).w,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: Device.orientation ==
                                                  Orientation.portrait
                                              ? 1.w
                                              : DeviceExt(1).h,
                                        ),
                                        Text(
                                          state.a.toString(),
                                          style: theme.textTheme.headlineSmall
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(2.5).h
                                                : DeviceExt(3).w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: Device.orientation == Orientation.portrait
                                  ? EdgeInsets.only(right: DeviceExt(1).h)
                                  : EdgeInsets.only(right: DeviceExt(1).w),
                              padding:
                                  Device.orientation == Orientation.portrait
                                      ? EdgeInsets.symmetric(
                                          horizontal: DeviceExt(2).h,
                                          vertical: 5.w,
                                        )
                                      : EdgeInsets.symmetric(
                                          horizontal: DeviceExt(2).w,
                                          vertical: DeviceExt(5).h,
                                        ),
                              decoration: AppDecoration.fillGray.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder15),
                              child: Row(
                                children: [
                                  CustomIconButton(
                                      onTap: () {
                                        PrefUtils().setAction("Approved");
                                        NavigatorService.popAndPushNamed(
                                            AppRoutes.draftEntriesScreen);
                                      },
                                      height: Device.orientation ==
                                              Orientation.portrait
                                          ? 11.w
                                          : DeviceExt(11).h,
                                      width: Device.orientation ==
                                              Orientation.portrait
                                          ? 11.w
                                          : DeviceExt(11).h,
                                      padding: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.all(DeviceExt(0.5).h)
                                          : EdgeInsets.all(0.5.w),
                                      decoration: IconButtonStyleHelper
                                          .fillPrimaryContainer,
                                      child: CustomImageView(
                                          height: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(3).h
                                              : 3.w,
                                          width: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(3).h
                                              : 3.w,
                                          fit: BoxFit.fill,
                                          svgPath: ImageConstant.imgCall)),
                                  Padding(
                                    padding: Device.orientation ==
                                            Orientation.portrait
                                        ? EdgeInsets.only(
                                            left: DeviceExt(1).h, bottom: 0.5.w)
                                        : EdgeInsets.only(
                                            left: DeviceExt(1).w,
                                            bottom: DeviceExt(0.5).h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_verified".tr,
                                          style: theme.textTheme.headlineSmall
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(1.5).h
                                                : DeviceExt(2).w,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: Device.orientation ==
                                                  Orientation.portrait
                                              ? 1.w
                                              : DeviceExt(1).h,
                                        ),
                                        Text(
                                          state.b.toString(),
                                          style: theme.textTheme.headlineSmall
                                              ?.copyWith(
                                            fontSize: Device.orientation ==
                                                    Orientation.portrait
                                                ? DeviceExt(2.5).h
                                                : DeviceExt(3).w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: Device.orientation == Orientation.portrait
                            ? EdgeInsets.only(top: 5.w, right: DeviceExt(0.1).h)
                            : EdgeInsets.only(
                                top: DeviceExt(5).h, right: DeviceExt(0.1).w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.only(
                                              right: DeviceExt(1).h)
                                          : EdgeInsets.only(
                                              right: DeviceExt(1).w),
                                      padding: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.symmetric(
                                              horizontal: DeviceExt(2).h,
                                              vertical: 5.w,
                                            )
                                          : EdgeInsets.symmetric(
                                              horizontal: DeviceExt(2).w,
                                              vertical: DeviceExt(5).h,
                                            ),
                                      decoration: AppDecoration.fillGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Row(children: [
                                        CustomIconButton(
                                            onTap: () {
                                              PrefUtils()
                                                  .setAction("Submitted");
                                              NavigatorService.popAndPushNamed(
                                                  AppRoutes.draftEntriesScreen);
                                            },
                                            height: Device.orientation ==
                                                    Orientation.portrait
                                                ? 11.w
                                                : DeviceExt(11).h,
                                            width: Device.orientation ==
                                                    Orientation.portrait
                                                ? 11.w
                                                : DeviceExt(11).h,
                                            padding: Device.orientation ==
                                                    Orientation.portrait
                                                ? EdgeInsets.all(
                                                    DeviceExt(0.5).h)
                                                : EdgeInsets.all(0.5.w),
                                            decoration: IconButtonStyleHelper
                                                .fillPrimaryContainer,
                                            child: CustomImageView(
                                                height: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(3).h
                                                    : 3.w,
                                                width: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(3).h
                                                    : 3.w,
                                                fit: BoxFit.fill,
                                                svgPath: ImageConstant.imgWarning)),
                                        Padding(
                                            padding: Device.orientation ==
                                                    Orientation.portrait
                                                ? EdgeInsets.only(
                                                    left: DeviceExt(1).h,
                                                    bottom: 0.5.w)
                                                : EdgeInsets.only(
                                                    left: DeviceExt(1).w,
                                                    bottom: DeviceExt(0.5).h),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Submitted".tr,
                                                    style: theme
                                                        .textTheme.headlineSmall
                                                        ?.copyWith(
                                                      fontSize:
                                                          Device.orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? DeviceExt(1.5).h
                                                              : DeviceExt(2).w,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Device
                                                                .orientation ==
                                                            Orientation.portrait
                                                        ? 1.w
                                                        : DeviceExt(1).h,
                                                  ),
                                                  Text(
                                                    state.c.toString(),
                                                    style: theme
                                                        .textTheme.headlineSmall
                                                        ?.copyWith(
                                                      fontSize:
                                                          Device.orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? DeviceExt(2.5).h
                                                              : DeviceExt(3).w,
                                                    ),
                                                  ),
                                                ]))
                                      ]))),
                              Expanded(
                                  child: Container(
                                      margin: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.only(
                                              right: DeviceExt(1).h)
                                          : EdgeInsets.only(
                                              right: DeviceExt(1).w),
                                      padding: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.symmetric(
                                              horizontal: DeviceExt(2).h,
                                              vertical: 5.w,
                                            )
                                          : EdgeInsets.symmetric(
                                              horizontal: DeviceExt(2).w,
                                              vertical: DeviceExt(5).h,
                                            ),
                                      decoration: AppDecoration.fillGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomIconButton(
                                                onTap: () {
                                                  PrefUtils()
                                                      .setAction("Rejected");
                                                  NavigatorService
                                                      .popAndPushNamed(AppRoutes
                                                          .draftEntriesScreen);
                                                },
                                                height: Device.orientation ==
                                                        Orientation.portrait
                                                    ? 11.w
                                                    : DeviceExt(11).h,
                                                width: Device.orientation == Orientation.portrait
                                                    ? 11.w
                                                    : DeviceExt(11).h,
                                                padding: Device.orientation ==
                                                        Orientation.portrait
                                                    ? EdgeInsets.all(
                                                        DeviceExt(0.5).h)
                                                    : EdgeInsets.all(0.5.w),
                                                decoration: IconButtonStyleHelper
                                                    .fillPrimaryContainer,
                                                child: CustomImageView(
                                                    height: Device.orientation ==
                                                            Orientation.portrait
                                                        ? DeviceExt(3).h
                                                        : 3.w,
                                                    width: Device.orientation ==
                                                            Orientation.portrait
                                                        ? DeviceExt(3).h
                                                        : 3.w,
                                                    fit: BoxFit.fill,
                                                    svgPath: ImageConstant.imgRefresh)),
                                            Padding(
                                                padding: Device.orientation ==
                                                        Orientation.portrait
                                                    ? EdgeInsets.only(
                                                        left: DeviceExt(1).h,
                                                        bottom: 0.5.w)
                                                    : EdgeInsets.only(
                                                        left: DeviceExt(1).w,
                                                        bottom:
                                                            DeviceExt(0.5).h),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "lbl_rejected".tr,
                                                        style: theme.textTheme
                                                            .headlineSmall
                                                            ?.copyWith(
                                                          fontSize: Device
                                                                      .orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? DeviceExt(1.5).h
                                                              : DeviceExt(2).w,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Device.orientation ==
                                                                    Orientation
                                                                        .portrait
                                                                ? 1.w
                                                                : DeviceExt(1)
                                                                    .h,
                                                      ),
                                                      Text(
                                                        state.d.toString(),
                                                        style: theme.textTheme
                                                            .headlineSmall
                                                            ?.copyWith(
                                                          fontSize: Device
                                                                      .orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? DeviceExt(2.5).h
                                                              : DeviceExt(3).w,
                                                        ),
                                                      )
                                                    ]))
                                          ])))
                            ])),
                    Padding(
                        padding: Device.orientation == Orientation.portrait
                            ? EdgeInsets.only(
                                left: DeviceExt(0.1).h,
                                top: 4.3.w,
                                right: DeviceExt(0.1).h)
                            : EdgeInsets.only(
                                left: 0.1.w,
                                top: DeviceExt(4.3).h,
                                right: 0.1.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.only(
                                              right: DeviceExt(1).h)
                                          : EdgeInsets.only(
                                              right: DeviceExt(1).w),
                                      padding: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.symmetric(
                                              horizontal: DeviceExt(2).h,
                                              vertical: 5.w,
                                            )
                                          : EdgeInsets.symmetric(
                                              horizontal: DeviceExt(2).w,
                                              vertical: DeviceExt(5).h,
                                            ),
                                      decoration: AppDecoration.fillGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Row(children: [
                                        CustomIconButton(
                                            height: Device.orientation ==
                                                    Orientation.portrait
                                                ? 11.w
                                                : DeviceExt(11).h,
                                            width: Device.orientation ==
                                                    Orientation.portrait
                                                ? 11.w
                                                : DeviceExt(11).h,
                                            padding: Device.orientation ==
                                                    Orientation.portrait
                                                ? EdgeInsets.all(
                                                    DeviceExt(0.5).h)
                                                : EdgeInsets.all(0.5.w),
                                            decoration: IconButtonStyleHelper
                                                .fillPrimaryContainer,
                                            child: CustomImageView(
                                                height: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(3).h
                                                    : 3.w,
                                                width: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(3).h
                                                    : 3.w,
                                                fit: BoxFit.fill,
                                                svgPath: ImageConstant.imgWarning)),
                                        Padding(
                                            padding: Device.orientation ==
                                                    Orientation.portrait
                                                ? EdgeInsets.only(
                                                    left: DeviceExt(1).h,
                                                    bottom: 0.5.w)
                                                : EdgeInsets.only(
                                                    left: DeviceExt(1).w,
                                                    bottom: DeviceExt(0.5).h),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "lbl_iprs_failed".tr,
                                                    style: theme
                                                        .textTheme.headlineSmall
                                                        ?.copyWith(
                                                      fontSize:
                                                          Device.orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? DeviceExt(1.5).h
                                                              : DeviceExt(2).w,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    "0", //state.c.toString(),
                                                    style: theme
                                                        .textTheme.headlineSmall
                                                        ?.copyWith(
                                                      fontSize:
                                                          Device.orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? DeviceExt(2.5).h
                                                              : DeviceExt(3).w,
                                                    ),
                                                  )
                                                ]))
                                      ]))),
                              Expanded(
                                  child: Container(
                                      margin: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.only(
                                              right: DeviceExt(1).h)
                                          : EdgeInsets.only(
                                              right: DeviceExt(1).w),
                                      padding: Device.orientation ==
                                              Orientation.portrait
                                          ? EdgeInsets.symmetric(
                                              horizontal: DeviceExt(2).h,
                                              vertical: 5.w,
                                            )
                                          : EdgeInsets.symmetric(
                                              horizontal: DeviceExt(2).w,
                                              vertical: DeviceExt(5).h,
                                            ),
                                      decoration: AppDecoration.fillGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Row(children: [
                                        CustomIconButton(
                                            onTap: () {
                                              PrefUtils()
                                                  .setAction("Incomplete");
                                              NavigatorService.popAndPushNamed(
                                                  AppRoutes.draftEntriesScreen);
                                            },
                                            height: Device.orientation ==
                                                    Orientation.portrait
                                                ? 11.w
                                                : DeviceExt(11).h,
                                            width: Device.orientation ==
                                                    Orientation.portrait
                                                ? 11.w
                                                : DeviceExt(11).h,
                                            padding: Device.orientation ==
                                                    Orientation.portrait
                                                ? EdgeInsets.all(
                                                    DeviceExt(0.5).h)
                                                : EdgeInsets.all(0.5.w),
                                            decoration: IconButtonStyleHelper
                                                .fillPrimaryContainer,
                                            child: CustomImageView(
                                                height: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(3).h
                                                    : 3.w,
                                                width: Device.orientation ==
                                                        Orientation.portrait
                                                    ? DeviceExt(3).h
                                                    : 3.w,
                                                fit: BoxFit.fill,
                                                svgPath: ImageConstant.imgBag)),
                                        Padding(
                                            padding: Device.orientation ==
                                                    Orientation.portrait
                                                ? EdgeInsets.only(
                                                    left: DeviceExt(1).h,
                                                    bottom: 0.5.w)
                                                : EdgeInsets.only(
                                                    left: DeviceExt(1).w,
                                                    bottom: DeviceExt(0.5).h),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Incomplete".tr,
                                                    style: theme
                                                        .textTheme.headlineSmall
                                                        ?.copyWith(
                                                      fontSize:
                                                          Device.orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? DeviceExt(1.5).h
                                                              : DeviceExt(2).w,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Device
                                                                .orientation ==
                                                            Orientation.portrait
                                                        ? 1.w
                                                        : DeviceExt(1).h,
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        state.f.toString(),
                                                        style: theme.textTheme
                                                            .headlineSmall
                                                            ?.copyWith(
                                                          fontSize: Device
                                                                      .orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? DeviceExt(2.5).h
                                                              : DeviceExt(3).w,
                                                        ),
                                                      ))
                                                ]))
                                      ])))
                            ])),
                    SizedBox(
                      height: Device.orientation == Orientation.portrait
                          ? 11.w
                          : DeviceExt(11).h,
                    ),
                    SizedBox(
                        height: Device.orientation == Orientation.portrait
                            ? 50.w
                            : DeviceExt(50).h,
                        width: double.infinity,
                        child: Column(children: [
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: Device.orientation ==
                                          Orientation.portrait
                                      ? EdgeInsets.symmetric(
                                          horizontal: DeviceExt(3).h)
                                      : EdgeInsets.symmetric(horizontal: 3.w),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BlocSelector<HomeBloc, HomeState,
                                                TextEditingController?>(
                                            selector: (state) =>
                                                state.searchController1,
                                            builder:
                                                (context, searchController1) {
                                              return Form(
                                                key: _formKey,
                                                child: CustomSearchView(
                                                    onChanged: (p0) {
                                                      return null;
                                                    },
                                                    enabled: true,
                                                    autofocus: false,
                                                    focusNode:
                                                        _secondTextFieldFocus,
                                                    controller:
                                                        searchController1,
                                                    textInputType: TextInputType
                                                        .number,
                                                    validator: (value) {
                                                      if (!isID(value,
                                                          isRequired: true)) {
                                                        return "Please provide a valid ID Number";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    hintText: "msg_search_id_number"
                                                        .tr,
                                                    textStyle: theme.textTheme.titleSmall?.copyWith(
                                                        fontSize: Device.orientation == Orientation.portrait
                                                            ? DeviceExt(1.8).h
                                                            : DeviceExt(2).w,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black),
                                                    hintStyle: theme
                                                        .textTheme.titleSmall
                                                        ?.copyWith(
                                                      fontSize:
                                                          Device.orientation ==
                                                                  Orientation
                                                                      .portrait
                                                              ? DeviceExt(1.8).h
                                                              : DeviceExt(2).w,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    prefix: Container(
                                                        margin: Device.orientation ==
                                                                Orientation
                                                                    .portrait
                                                            ? EdgeInsets
                                                                .fromLTRB(
                                                                DeviceExt(2).h,
                                                                3.w,
                                                                DeviceExt(1.2)
                                                                    .h,
                                                                3.w,
                                                              )
                                                            : EdgeInsets
                                                                .fromLTRB(
                                                                2.w,
                                                                DeviceExt(3).h,
                                                                1.2.w,
                                                                DeviceExt(3).h,
                                                              ),
                                                        child: CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgSearch)),
                                                    prefixConstraints: Device.orientation == Orientation.portrait
                                                        ? BoxConstraints(maxHeight: 10.w)
                                                        : BoxConstraints(maxHeight: DeviceExt(10).h),
                                                    suffix: Padding(
                                                        padding: Device.orientation == Orientation.portrait
                                                            ? EdgeInsets.only(right: DeviceExt(2).h)
                                                            : EdgeInsets.only(
                                                                right: 2.w,
                                                              ),
                                                        child: IconButton(
                                                            onPressed: () {
                                                              searchController1!
                                                                  .clear();
                                                            },
                                                            icon: Icon(Icons.clear, color: Colors.grey.shade600)))),
                                              );
                                            }),
                                      ]))),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  margin: Device.orientation ==
                                          Orientation.portrait
                                      ? EdgeInsets.only(top: 1.2.w)
                                      : EdgeInsets.only(top: DeviceExt(1.2).h),
                                  padding:
                                      Device.orientation == Orientation.portrait
                                          ? EdgeInsets.symmetric(
                                              horizontal: DeviceExt(3).h,
                                              vertical: 1.2.w)
                                          : EdgeInsets.symmetric(
                                              horizontal: 3.w,
                                              vertical: DeviceExt(1.2).h),
                                  decoration: AppDecoration.fillWhiteA,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: Device.orientation ==
                                                  Orientation.portrait
                                              ? 2.w
                                              : DeviceExt(2).h,
                                        ),
                                        CustomElevatedButton(
                                            text: "lbl_search_farmer".tr,
                                            leftIcon: Container(
                                                margin: Device.orientation ==
                                                        Orientation.portrait
                                                    ? EdgeInsets.only(
                                                        right: DeviceExt(1).h)
                                                    : EdgeInsets.only(
                                                        right: DeviceExt(1).w),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgVolume)),
                                            height: Device.orientation == Orientation.portrait
                                                ? DeviceExt(6).h
                                                : 8.w,
                                            // width:
                                            //     Device.orientation == Orientation.portrait
                                            //         ? DeviceExt(50).h
                                            //         : 50.w,
                                            buttonTextStyle: theme
                                                .textTheme.titleMedium
                                                ?.copyWith(
                                              color: Colors.white,
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(2).h
                                                  : DeviceExt(2.5).w,
                                            ),
                                            margin: Device.orientation == Orientation.portrait
                                                ? EdgeInsets.fromLTRB(
                                                    DeviceExt(0.36).h,
                                                    6.w,
                                                    DeviceExt(0.2).h,
                                                    1.2.w)
                                                : EdgeInsets.fromLTRB(
                                                    DeviceExt(0.36).w,
                                                    DeviceExt(6).h,
                                                    DeviceExt(0.2).w,
                                                    DeviceExt(1.2).h),
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _secondTextFieldFocus.unfocus();
                                                context.read<HomeBloc>().add(
                                                    FarmerSearchEvent(
                                                        onError: () =>
                                                            onTapSearchfarmer(
                                                                context),
                                                        onSuccess: () =>
                                                            onTapSearchfarmer(
                                                                context),
                                                        idNo: state
                                                            .searchController1
                                                            ?.text));
                                              }
                                            })
                                      ]))),
                        ])),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: Device.orientation == Orientation.portrait
                            ? EdgeInsets.only(left: DeviceExt(3).h, top: 1.2.w)
                            : EdgeInsets.only(
                                left: 3.w,
                                top: DeviceExt(1.2).h,
                              ),
                        child: Text(
                          "Registration Accuracy and Verification Statistics"
                              .tr,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontSize: Device.orientation == Orientation.portrait
                                ? DeviceExt(1.5).h
                                : DeviceExt(1).w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Device.orientation == Orientation.portrait
                          ? 11.w
                          : DeviceExt(11).h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Device.orientation == Orientation.portrait
                              ? 15.w
                              : DeviceExt(11).h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 4.w,
                              right: DeviceExt(1.5).h,
                              left: DeviceExt(1.5).h),
                          child: Column(
                            children: [
                              FutureBuilder<Tuple2<int?, int?>?>(
                                future: farmerDB.regAccuracy(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    // Return a loading indicator while waiting for data.
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    // Handle errors, e.g., display an error message.
                                    return Text('Error: ${snapshot.error}');
                                  } else if (!snapshot.hasData) {
                                    // Handle cases where there's no data to display.
                                    return Center(
                                        child: Text(
                                      'No data available.',
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        color: Colors.black,
                                        fontSize: Device.orientation ==
                                                Orientation.portrait
                                            ? DeviceExt(1.8).h
                                            : DeviceExt(2).w,
                                      ),
                                    ));
                                  } else {
                                    // Data is available, build the widget with the data.
                                    return Padding(
                                        padding: EdgeInsets.only(
                                            top: 4.w,
                                            right: DeviceExt(0.5).h,
                                            left: DeviceExt(0.5).h),
                                        child: Container(
                                            height: DeviceExt(14).h,
                                            width: DeviceExt(9).h,
                                            child: PieChartSample2(
                                              tdata: snapshot.data,
                                            )));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 4.w,
                              right: DeviceExt(0.5).h,
                              left: DeviceExt(0.5).h),
                          child: Column(
                            children: [
                              FutureBuilder<Tuple2<int?, int?>?>(
                                future: farmerDB.regPie(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    // Return a loading indicator while waiting for data.
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    // Handle errors, e.g., display an error message.
                                    return Text('Error: ${snapshot.error}');
                                  } else if (!snapshot.hasData) {
                                    // Handle cases where there's no data to display.
                                    return Center(
                                      child: Text(
                                        'No data available.',
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Device.orientation ==
                                                  Orientation.portrait
                                              ? DeviceExt(1.8).h
                                              : DeviceExt(2).w,
                                        ),
                                      ),
                                    );
                                  } else {
                                    // Data is available, build the widget with the data.
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.w,
                                          right: DeviceExt(0.5).h,
                                          left: DeviceExt(0.5).h),
                                      child: Container(
                                          height: DeviceExt(14).h,
                                          width: DeviceExt(9).h,
                                          child: PieChartSample3(
                                            data: snapshot.data,
                                          )),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Device.orientation == Orientation.portrait
                              ? 15.w
                              : DeviceExt(11).h,
                        ),
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: Device.orientation == Orientation.portrait
                                ? EdgeInsets.only(
                                    left: DeviceExt(3).h, top: 15.w)
                                : EdgeInsets.only(
                                    left: 3.w, top: DeviceExt(15).h),
                            child: Text(
                              "lbl_weekly_activity".tr,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(2.5).h
                                        : DeviceExt(3).w,
                              ),
                            ))),
                    Container(
                      margin: Device.orientation == Orientation.portrait
                          ? EdgeInsets.only(left: DeviceExt(0.1).h, top: 2.w)
                          : EdgeInsets.only(
                              left: 28.w, right: 28.w, top: DeviceExt(2).h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: Device.orientation == Orientation.portrait
                                ? 7.w
                                : DeviceExt(7).h,
                          ),
                          Container(
                            padding: Device.orientation == Orientation.portrait
                                ? EdgeInsets.symmetric(
                                    horizontal: DeviceExt(3).h, vertical: 4.w)
                                : EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: DeviceExt(4).h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: Device.orientation ==
                                            Orientation.portrait
                                        ? EdgeInsets.only(
                                            left: DeviceExt(0.5).h, top: 3.w)
                                        : EdgeInsets.only(
                                            left: DeviceExt(1.5).w,
                                            right: DeviceExt(1.5).w,
                                            top: DeviceExt(3).w),
                                    child:
                                        FutureBuilder<List<Tuple2<int, int>>?>(
                                      future:
                                          farmerDB.getFarmersCountLast7Days(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          // Return a loading indicator while waiting for data.
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (snapshot.hasError) {
                                          // Handle errors, e.g., display an error message.
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        } else if (!snapshot.hasData ||
                                            snapshot.data!.isEmpty) {
                                          print(snapshot.data);
                                          // Handle cases where there's no data to display.
                                          return Text(
                                            'No data available.',
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              color: Colors.black,
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                            ),
                                          );
                                        } else {
                                          // Data is available, build the widget with the data.
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                top: 4.w,
                                                right: DeviceExt(0.5).h,
                                                left: DeviceExt(0.5).h),
                                            child: Container(
                                                height: DeviceExt(20).h,
                                                width: DeviceExt(9).h,
                                                child: BarChartSample3(
                                                  listdata: snapshot.data,
                                                )),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: Device.orientation == Orientation.portrait
                                ? EdgeInsets.only(
                                    left: DeviceExt(3).h, top: 6.w)
                                : EdgeInsets.only(
                                    left: 3.w, top: DeviceExt(6).h),
                            child: Text(
                              "msg_registration_overview".tr,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(2.5).h
                                        : DeviceExt(3).w,
                              ),
                            ))),
                    Container(
                      margin: Device.orientation == Orientation.portrait
                          ? EdgeInsets.only(
                              left: DeviceExt(3).h,
                              top: 2.w,
                              right: DeviceExt(3).h)
                          : EdgeInsets.only(
                              left: DeviceExt(3).w,
                              top: DeviceExt(2).h,
                              right: 3.w),
                      padding: Device.orientation == Orientation.portrait
                          ? EdgeInsets.symmetric(
                              horizontal: DeviceExt(3).h, vertical: 4.w)
                          : EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: DeviceExt(4).h),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: Device.orientation == Orientation.portrait
                                ? EdgeInsets.only(
                                    top: 0.5.w, right: DeviceExt(0.1).h)
                                : EdgeInsets.only(
                                    top: DeviceExt(0.5).h, right: 0.1.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.5).h
                                        : 1.5.w,
                                    width: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.5).h
                                        : 1.5.w,
                                    margin: Device.orientation ==
                                            Orientation.portrait
                                        ? EdgeInsets.only(bottom: 0.5.w)
                                        : EdgeInsets.only(
                                            bottom: DeviceExt(0.5).h),
                                    decoration: BoxDecoration(
                                        color: theme.colorScheme.primary,
                                        borderRadius: BorderRadius.circular(
                                            DeviceExt(4).h))),
                                Padding(
                                    padding: Device.orientation ==
                                            Orientation.portrait
                                        ? EdgeInsets.only(
                                            left: DeviceExt(1.2).h)
                                        : EdgeInsets.only(left: 1.2.w),
                                    child: Text(
                                      "lbl_approved".tr,
                                      style: theme.textTheme.titleSmall
                                          ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                    )),
                                Container(
                                    height: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.5).h
                                        : 1.5.w,
                                    width: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.5).h
                                        : 1.5.w,
                                    margin: Device.orientation ==
                                            Orientation.portrait
                                        ? EdgeInsets.only(
                                            left: DeviceExt(1.2).h,
                                            bottom: 0.5.w)
                                        : EdgeInsets.only(
                                            left: 1.2.w,
                                            bottom: DeviceExt(0.5).h),
                                    decoration: BoxDecoration(
                                        color: appTheme.green200,
                                        borderRadius: BorderRadius.circular(
                                            DeviceExt(4).h))),
                                Padding(
                                    padding: Device.orientation ==
                                            Orientation.portrait
                                        ? EdgeInsets.only(
                                            left: DeviceExt(1.2).h)
                                        : EdgeInsets.only(left: 1.2.w),
                                    child: Text(
                                      "lbl_rejected".tr,
                                      style: theme.textTheme.titleSmall
                                          ?.copyWith(
                                              fontSize: Device.orientation ==
                                                      Orientation.portrait
                                                  ? DeviceExt(1.8).h
                                                  : DeviceExt(2).w,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                    ))
                              ],
                            ),
                          ),
                          FutureBuilder<List<Map<String, Object?>>?>(
                            future: farmerDB
                                .getApprovedAndRejectedCountsForLast6Months(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // Return a loading indicator while waiting for data.
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                // Handle errors, e.g., display an error message.
                                return Text('Error: ${snapshot.error}');
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                // Handle cases where there's no data to display.
                                return Text(
                                  'No data available.',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.black,
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(1.8).h
                                        : DeviceExt(2).w,
                                  ),
                                );
                              } else {
                                // Data is available, build the widget with the data.
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: 4.w,
                                      right: DeviceExt(0.5).h,
                                      left: DeviceExt(0.5).h),
                                  child: Container(
                                    height: DeviceExt(40).h,
                                    width: DeviceExt(40).h,
                                    child: BarChartSample2(
                                      bardata: snapshot.data,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  /// Opens the drawer of the current scaffold using the [_scaffoldKey] instance
  /// variable.
  onTapMenuone(BuildContext context) {
    _scaffoldKey.currentState?.openDrawer();
  }

  /// Displays an [AlertDialog] with a custom content widget using the
  /// provided [BuildContext].
  ///
  /// The custom content widget is created by calling
  /// [HomeFarmerFoundDialog.builder] method.
  onTapSearchfarmer(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              content: HomeFarmerFoundDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  dbNotFound(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: HomeFarmerNotFoundDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
