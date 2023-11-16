import 'package:intl/intl.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';
import 'package:kiamis_app/presentation/enumerator_db_download/enum_db_download.dart';
import 'package:kiamis_app/presentation/side_menu_draweritem/side_menu_draweritem.dart';

import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_switch.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
        create: (context) =>
            SettingsBloc(SettingsState(settingsModelObj: SettingsModel()))
              ..add(SettingsInitialEvent()),
        child: SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        drawer: SideMenuDraweritem(),
        key: _scaffoldKey,
        appBar: CustomAppBar(
            leadingWidth: 48.h,
            leading: AppbarImage(
                onTap: () => onTapMenuone(context),
                svgPath: ImageConstant.imgMenu,
                margin: EdgeInsets.only(left: 24.h, top: 12.v, bottom: 22.v)),
            centerTitle: true,
            title: AppbarSubtitle1(text: "lbl_settings".tr),
            styleType: Style.bgFill),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 51.v),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 8.h),
                  child: GestureDetector(
                    onTap: () => changePassword(context),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgMegaphone,
                              height: 40.adaptSize,
                              width: 40.adaptSize),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 16.h, top: 10.v, bottom: 5.v),
                              child: Text("lbl_change_password".tr,
                                  style: CustomTextStyles.titleMediumBlack900)),
                          Spacer(),
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowrightBlack900,
                              height: 9.v,
                              width: 5.h,
                              margin: EdgeInsets.symmetric(vertical: 15.v))
                        ]),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 20.v, right: 8.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUser,
                            height: 40.adaptSize,
                            width: 40.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 16.h, top: 7.v, bottom: 8.v),
                            child: Text("lbl_notification".tr,
                                style: CustomTextStyles.titleMediumBlack900)),
                        Spacer(),
                        BlocSelector<SettingsBloc, SettingsState, bool?>(
                            selector: (state) => state.isSelectedSwitch,
                            builder: (context, isSelectedSwitch) {
                              return CustomSwitch(
                                  margin: EdgeInsets.symmetric(vertical: 9.v),
                                  value: isSelectedSwitch,
                                  onChange: (value) {
                                    context
                                        .read<SettingsBloc>()
                                        .add(ChangeSwitchEvent(value: value));
                                  });
                            })
                      ])),
              Padding(
                  padding: EdgeInsets.only(top: 20.v, right: 8.h),
                  child: GestureDetector(
                    onTap: () => downloadDialog(context),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowleft,
                              height: 40.adaptSize,
                              width: 40.adaptSize),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 16.h, top: 10.v, bottom: 5.v),
                              child: Text("Retrieve Previous Entries".tr,
                                  style: CustomTextStyles.titleMediumBlack900)),
                          Spacer(),
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowrightBlack900,
                              height: 9.v,
                              width: 5.h,
                              margin: EdgeInsets.symmetric(vertical: 15.v))
                        ]),
                  )),
              // Padding(
              //     padding: EdgeInsets.only(top: 20.v, right: 8.h),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           CustomImageView(
              //               svgPath: ImageConstant.imgEye,
              //               height: 40.adaptSize,
              //               width: 40.adaptSize),
              //           Padding(
              //               padding: EdgeInsets.only(
              //                   left: 16.h, top: 8.v, bottom: 7.v),
              //               child: Text("lbl_stats".tr,
              //                   style: CustomTextStyles.titleMediumBlack900)),
              //           Spacer(),
              //           CustomImageView(
              //               svgPath: ImageConstant.imgArrowrightBlack900,
              //               height: 9.v,
              //               width: 5.h,
              //               margin: EdgeInsets.symmetric(vertical: 15.v))
              //         ])),
              // Padding(
              //     padding: EdgeInsets.only(top: 20.v, right: 8.h),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           CustomImageView(
              //               svgPath: ImageConstant.imgClock,
              //               height: 40.adaptSize,
              //               width: 40.adaptSize),
              //           Padding(
              //               padding: EdgeInsets.only(
              //                   left: 16.h, top: 7.v, bottom: 8.v),
              //               child: Text("lbl_about_info".tr,
              //                   style: CustomTextStyles.titleMediumBlack900)),
              //           Spacer(),
              //           CustomImageView(
              //               svgPath: ImageConstant.imgArrowrightBlack900,
              //               height: 9.v,
              //               width: 5.h,
              //               margin: EdgeInsets.symmetric(vertical: 15.v))
              //         ])),
              Spacer(),
              CustomElevatedButton(
                text: "lbl_log_out".tr,
                margin: EdgeInsets.only(right: 8.h),
                leftIcon: Container(
                    padding: EdgeInsets.all(3.h),
                    margin: EdgeInsets.only(right: 6.h),
                    decoration: BoxDecoration(color: theme.colorScheme.primary),
                    child: CustomImageView(
                        svgPath: ImageConstant.imgArrowleftWhiteA700)),
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                onTap: () {
                  onTapLogout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapLogout(BuildContext context) {
    DateTime now = DateTime.now();

// Set the time to tomorrow at 6 am
    DateTime tomorrow6AM = DateTime(now.year, now.month, now.day - 1, 6, 0, 0);

// Format the DateTime to a string
    String formattedTomorrow6AM =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(tomorrow6AM);

// Set the formatted string to your PrefUtils
    PrefUtils().setTomorrow(formattedTomorrow6AM);
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  changePassword(BuildContext context) async {
    String label = "Change Password";
    String body =
        "Are you sure you want to change your password, Once requested you must change your password?";
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: DynamicDialog.builder(context, label, body),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));

    context.read<SettingsBloc>().add(
          ResetPEvent(
            onCreateLoginEventSuccess: () {
              changeP(context);
            },
            onCreateLoginEventError: () {
              _onLoginUserServicePostEventError(context);
            },
          ),
        );
  }

  void _onLoginUserServicePostEventError(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Request Failed'),
              content:
                  const Text('Something went wrong, contact administrator'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ));
  }

  changeP(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.newPasswordScreen,
    );
  }

  onTapMenuone(BuildContext context) {
    _scaffoldKey.currentState?.openDrawer();
  }

  downloadDialog(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: EnumDbDownloadDialog.builder(
                context,
              ),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
