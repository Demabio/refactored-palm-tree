import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:tuple/tuple.dart';

import '../../widgets/custom_icon_button.dart';
import '../../widgets/graphs/bargraph/bar_chart_sample2.dart';
import '../../widgets/graphs/donutchart/pie_chart_sample2.dart';
import '../../widgets/graphs/linegraph/line_chart_widget.dart';
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
  FocusNode _firstTextFieldFocus = FocusNode();
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
              height: 47.v,
              leadingWidth: 73.h,
              leading: AppbarImage(
                  svgPath: ImageConstant.imgMenu,
                  margin: EdgeInsets.only(left: 49.h, top: 8.v, bottom: 15.v),
                  onTap: () {
                    onTapMenuone(context);
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "lbl_dashboard".tr)),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 14.v),
              child: Padding(
                padding: EdgeInsets.only(right: 1.h, bottom: 5.v),
                child: Column(
                  children: [
                    BlocSelector<HomeBloc, HomeState, TextEditingController?>(
                        selector: (state) => state.searchController,
                        builder: (context, searchController) {
                          return CustomSearchView(
                              enabled: true,
                              autofocus: false,
                              focusNode: _firstTextFieldFocus,
                              margin: EdgeInsets.only(left: 24.h, right: 23.h),
                              controller: searchController,
                              hintText: "lbl_search_for_menu".tr,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      16.h, 12.v, 10.h, 12.v),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgSearch)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 40.v),
                              suffix: Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: IconButton(
                                      onPressed: () {
                                        searchController!.clear();
                                      },
                                      icon: Icon(Icons.clear,
                                          color: Colors.grey.shade600))));
                        }),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 24.h, top: 7.v),
                            child: Text("msg_farmers_overview".tr,
                                style: CustomTextStyles.titleMediumSemiBold))),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(right: 8.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.h, vertical: 19.v),
                                      decoration: AppDecoration.fillGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Row(children: [
                                        CustomIconButton(
                                            onTap: () {
                                              PrefUtils().setAction("Saved");
                                              NavigatorService.popAndPushNamed(
                                                  AppRoutes.draftEntriesScreen);
                                            },
                                            height: 45.adaptSize,
                                            width: 45.adaptSize,
                                            padding: EdgeInsets.all(12.h),
                                            decoration: IconButtonStyleHelper
                                                .fillPrimaryContainer,
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgSave)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.h, bottom: 2.v),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Drafts".tr,
                                                      style: theme.textTheme
                                                          .labelLarge),
                                                  SizedBox(height: 1.v),
                                                  Text(state.a.toString(),
                                                      style: CustomTextStyles
                                                          .titleMediumPrimary)
                                                ]))
                                      ]))),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(left: 8.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.h, vertical: 19.v),
                                      decoration: AppDecoration.fillGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Row(children: [
                                        CustomIconButton(
                                            onTap: () {
                                              PrefUtils().setAction("Approved");
                                              NavigatorService.popAndPushNamed(
                                                  AppRoutes.draftEntriesScreen);
                                            },
                                            height: 45.adaptSize,
                                            width: 45.adaptSize,
                                            padding: EdgeInsets.all(12.h),
                                            decoration: IconButtonStyleHelper
                                                .fillPrimaryContainer,
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCall)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.h, bottom: 2.v),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("lbl_verified".tr,
                                                      style: theme.textTheme
                                                          .labelLarge),
                                                  SizedBox(height: 1.v),
                                                  Text(state.b.toString(),
                                                      style: CustomTextStyles
                                                          .titleMediumPrimary)
                                                ]))
                                      ])))
                            ])),
                    Padding(
                        padding: EdgeInsets.only(top: 19.v, right: 1.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(top: 1.v, right: 8.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.h, vertical: 19.v),
                                      decoration: AppDecoration.fillGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Row(children: [
                                        CustomIconButton(
                                            onTap: () {
                                              PrefUtils()
                                                  .setAction("Unverified");
                                              NavigatorService.popAndPushNamed(
                                                  AppRoutes.draftEntriesScreen);
                                            },
                                            height: 45.adaptSize,
                                            width: 45.adaptSize,
                                            padding: EdgeInsets.all(12.h),
                                            decoration: IconButtonStyleHelper
                                                .fillPrimaryContainer,
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgWarning)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.h, bottom: 2.v),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Submitted".tr,
                                                      style: theme.textTheme
                                                          .labelMedium),
                                                  SizedBox(height: 2.v),
                                                  Text(state.c.toString(),
                                                      style: CustomTextStyles
                                                          .titleMediumPrimary)
                                                ]))
                                      ]))),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(left: 8.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.h, vertical: 20.v),
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
                                                height: 45.adaptSize,
                                                width: 45.adaptSize,
                                                padding: EdgeInsets.all(12.h),
                                                decoration:
                                                    IconButtonStyleHelper
                                                        .fillPrimaryContainer,
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgRefresh)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.h, bottom: 6.v),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("lbl_rejected".tr,
                                                          style: theme.textTheme
                                                              .labelLarge),
                                                      Text(state.d.toString(),
                                                          style: CustomTextStyles
                                                              .titleMediumInterPrimary)
                                                    ]))
                                          ])))
                            ])),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 1.h, top: 18.v, right: 1.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(top: 1.v, right: 8.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.h, vertical: 19.v),
                                      decoration: AppDecoration.fillGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Row(children: [
                                        CustomIconButton(
                                            height: 45.adaptSize,
                                            width: 45.adaptSize,
                                            padding: EdgeInsets.all(12.h),
                                            decoration: IconButtonStyleHelper
                                                .fillPrimaryContainer,
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgWarning)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.h, bottom: 2.v),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("lbl_iprs_failed".tr,
                                                      style: theme.textTheme
                                                          .labelMedium),
                                                  SizedBox(height: 2.v),
                                                  Text(state.c.toString(),
                                                      style: CustomTextStyles
                                                          .titleMediumPrimary)
                                                ]))
                                      ]))),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(left: 8.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.h, vertical: 19.v),
                                      decoration: AppDecoration.fillGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder15),
                                      child: Row(children: [
                                        CustomIconButton(
                                            onTap: () {
                                              PrefUtils().setAction("All");
                                              NavigatorService.popAndPushNamed(
                                                  AppRoutes.draftEntriesScreen);
                                            },
                                            height: 45.adaptSize,
                                            width: 45.adaptSize,
                                            padding: EdgeInsets.all(12.h),
                                            decoration: IconButtonStyleHelper
                                                .fillPrimaryContainer,
                                            child: CustomImageView(
                                                svgPath: ImageConstant.imgBag)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.h, bottom: 2.v),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("lbl_total".tr,
                                                      style: theme.textTheme
                                                          .labelLarge),
                                                  SizedBox(height: 1.v),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                          state.f.toString(),
                                                          style: CustomTextStyles
                                                              .titleMediumPrimary))
                                                ]))
                                      ])))
                            ])),
                    SizedBox(height: 10.v),
                    SizedBox(
                        height: 200.v,
                        width: double.infinity,
                        child: Column(children: [
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 23.h),
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
                                                    textInputType:
                                                        TextInputType.number,
                                                    validator: (value) {
                                                      if (!isID(value,
                                                          isRequired: true)) {
                                                        return "Please provide a valid ID Number";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    hintText:
                                                        "msg_search_id_number"
                                                            .tr,
                                                    prefix: Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                16.h,
                                                                12.v,
                                                                10.h,
                                                                12.v),
                                                        child: CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgSearch)),
                                                    prefixConstraints:
                                                        BoxConstraints(
                                                            maxHeight: 40.v),
                                                    suffix: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 15.h),
                                                        child: IconButton(
                                                            onPressed: () {
                                                              searchController1!
                                                                  .clear();
                                                            },
                                                            icon: Icon(
                                                                Icons.clear,
                                                                color: Colors
                                                                    .grey
                                                                    .shade600)))),
                                              );
                                            }),
                                      ]))),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  margin: EdgeInsets.only(top: 5.v),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.h, vertical: 5.v),
                                  decoration: AppDecoration.fillWhiteA,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(height: 8.v),
                                        CustomElevatedButton(
                                            text: "lbl_search_farmer".tr,
                                            leftIcon: Container(
                                                margin:
                                                    EdgeInsets.only(right: 9.h),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgVolume)),
                                            buttonTextStyle: CustomTextStyles
                                                .titleMediumWhiteA700,
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
                        padding: EdgeInsets.only(left: 24.h, top: 5.v),
                        child: Text("msg_registration_accuracy".tr,
                            style: CustomTextStyles.titleMediumSemiBold),
                      ),
                    ),
                    SizedBox(height: 46.v),
                    Align(
                      alignment: Alignment.center,
                      child: FutureBuilder<Tuple2<int?, int?>?>(
                        future: farmerDB.regAccuracy(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Return a loading indicator while waiting for data.
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            // Handle errors, e.g., display an error message.
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            // Handle cases where there's no data to display.
                            return Center(child: Text('No data available.'));
                          } else {
                            // Data is available, build the widget with the data.
                            return Padding(
                                padding: EdgeInsets.only(top: 15.v, right: 1.h),
                                child: SizedBox(
                                    height: 350,
                                    width: 300,
                                    child: PieChartSample2(
                                      tdata: snapshot.data,
                                    )));
                          }
                        },
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 24.h, top: 60.v),
                            child: Text("msg_verification_statistics".tr,
                                style: CustomTextStyles.titleMediumSemiBold))),
                    Align(
                      alignment: Alignment.center,
                      child: FutureBuilder<Tuple2<int?, int?>?>(
                        future: farmerDB.regPie(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Return a loading indicator while waiting for data.
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            // Handle errors, e.g., display an error message.
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            // Handle cases where there's no data to display.
                            return Center(child: Text('No data available.'));
                          } else {
                            // Data is available, build the widget with the data.
                            return Padding(
                              padding: EdgeInsets.only(top: 15.v, right: 1.h),
                              child: Container(
                                  height: 350,
                                  width: 300,
                                  child: PieChartSample3(
                                    data: snapshot.data,
                                  )),
                            );
                          }
                        },
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 24.h, top: 46.v),
                            child: Text("lbl_weekly_activity".tr,
                                style: CustomTextStyles.titleMediumSemiBold))),
                    Container(
                      margin: EdgeInsets.only(left: 1.h, top: 9.v),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 29.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.h, vertical: 16.v),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.h, top: 12.v),
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
                                          // Handle cases where there's no data to display.
                                          return Text('No data available.');
                                        } else {
                                          // Data is available, build the widget with the data.
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                top: 15.v, right: 1.h),
                                            child: Container(
                                                height: 500,
                                                width: 500,
                                                child: LineChartWidget(
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
                            padding: EdgeInsets.only(left: 24.h, top: 26.v),
                            child: Text("msg_registration_overview".tr,
                                style: CustomTextStyles.titleMediumSemiBold))),
                    Container(
                      margin:
                          EdgeInsets.only(left: 23.h, top: 9.v, right: 23.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 21.h, vertical: 16.v),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.v, right: 1.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: 12.adaptSize,
                                    width: 12.adaptSize,
                                    margin: EdgeInsets.only(bottom: 2.v),
                                    decoration: BoxDecoration(
                                        color: theme.colorScheme.primary,
                                        borderRadius:
                                            BorderRadius.circular(4.h))),
                                Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Text("lbl_approved".tr,
                                        style: theme.textTheme.bodySmall)),
                                Container(
                                    height: 12.adaptSize,
                                    width: 12.adaptSize,
                                    margin: EdgeInsets.only(
                                        left: 11.h, bottom: 2.v),
                                    decoration: BoxDecoration(
                                        color: appTheme.green200,
                                        borderRadius:
                                            BorderRadius.circular(4.h))),
                                Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Text("lbl_rejected".tr,
                                        style: theme.textTheme.bodySmall))
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
                                return Text('No data available.');
                              } else {
                                // Data is available, build the widget with the data.
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.v, right: 1.h),
                                  child: Container(
                                    height: 500,
                                    width: 500,
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
