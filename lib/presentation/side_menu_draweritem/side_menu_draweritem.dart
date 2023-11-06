import 'package:kiamis_app/presentation/post_dialog/post_dialog.dart';
import 'package:kiamis_app/presentation/update_db/updatedb_dialog.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class SideMenuDraweritem extends StatelessWidget {
  const SideMenuDraweritem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Drawer(
        width: DeviceExt((300 / 841) * 100).h,
        child: SingleChildScrollView(
          child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: ((33 / 411) * 100).w),
              decoration: AppDecoration.fillWhiteA,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage2,
                          height: DeviceExt(8.4).h,
                          width: DeviceExt(8.4).h),
                      Padding(
                          padding: EdgeInsets.only(
                              left: DeviceExt(0.2).h,
                              top: 2.4.w,
                              bottom: 2.7.w),
                          child: Text("lbl_kiamis".tr,
                              style: theme.textTheme.headlineLarge
                                  ?.copyWith(fontSize: DeviceExt(4).h)))
                    ]),
                    CustomElevatedButton(
                        height: ((28 / 411) * 100).w,
                        width: DeviceExt((250 / 841) * 100).h,
                        text: "lbl_dashboard".tr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        margin: EdgeInsets.only(
                            left: DeviceExt((7 / 841) * 100).h,
                            top: ((48 / 411) * 100).w),
                        leftIcon: Container(
                            padding: EdgeInsets.only(
                              left: DeviceExt((10 / 841) * 100).h,
                            ),
                            margin: EdgeInsets.only(
                                right: DeviceExt((20 / 841) * 100).h),
                            child: CustomImageView(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                width:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                svgPath: ImageConstant.imgHome2)),
                        buttonStyle: CustomButtonStyles.none,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        onTap: () {
                          onTapDashboard(context);
                        }),
                    CustomElevatedButton(
                        height: ((28 / 411) * 100).w,
                        width: DeviceExt((250 / 841) * 100).h,
                        text: "lbl_draft_entries".tr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        margin: EdgeInsets.only(
                            left: DeviceExt((7 / 841) * 100).h,
                            top: ((26 / 411) * 100).w),
                        leftIcon: Container(
                            padding: EdgeInsets.only(
                              left: DeviceExt((10 / 841) * 100).h,
                            ),
                            margin: EdgeInsets.only(
                                right: DeviceExt((20 / 841) * 100).h),
                            child: CustomImageView(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                width:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                svgPath: ImageConstant.imgTransfer1)),
                        buttonStyle: CustomButtonStyles.none,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        onTap: () {
                          onTapDraftentries(context);
                        }),
                    CustomElevatedButton(
                        height: ((30 / 411) * 100).w,
                        width: DeviceExt((250 / 841) * 100).h,
                        text: "lbl_register_farmer".tr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        margin: EdgeInsets.only(
                            left: DeviceExt((7 / 841) * 100).h,
                            top: ((27 / 411) * 100).w),
                        leftIcon: Container(
                            padding: EdgeInsets.only(
                              left: DeviceExt((10 / 841) * 100).h,
                            ),
                            margin: EdgeInsets.only(
                                right: DeviceExt((20 / 841) * 100).h),
                            child: CustomImageView(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                width:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                svgPath: ImageConstant.imgUser31)),
                        buttonStyle: CustomButtonStyles.none,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        onTap: () {
                          onTapRegisterfarmer(context);
                        }),
                    CustomElevatedButton(
                        height: ((30 / 411) * 100).w,
                        width: DeviceExt((250 / 841) * 100).h,
                        text: "Submitable Farmers".tr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        margin: EdgeInsets.only(
                            left: DeviceExt((7 / 841) * 100).h,
                            top: ((27 / 411) * 100).w),
                        leftIcon: Container(
                            padding: EdgeInsets.only(
                              left: DeviceExt((10 / 841) * 100).h,
                            ),
                            margin: EdgeInsets.only(
                                right: DeviceExt((20 / 841) * 100).h),
                            child: CustomImageView(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                width:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                svgPath: ImageConstant.imgSavePrimary)),
                        buttonStyle: CustomButtonStyles.none,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        onTap: () {
                          onTapSaved(context);
                        }),
                    CustomElevatedButton(
                        height: ((30 / 411) * 100).w,
                        width: DeviceExt((250 / 841) * 100).h,
                        text: "msg_post_farmers_to".tr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        margin: EdgeInsets.only(
                            left: DeviceExt((7 / 841) * 100).h,
                            top: ((27 / 411) * 100).w),
                        leftIcon: Container(
                            padding: EdgeInsets.only(
                              left: DeviceExt((10 / 841) * 100).h,
                            ),
                            margin: EdgeInsets.only(
                                right: DeviceExt((20 / 841) * 100).h),
                            child: CustomImageView(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                width:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                svgPath: ImageConstant.imgUpload)),
                        buttonStyle: CustomButtonStyles.none,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        onTap: () {
                          postDialog(context);
                        }),
                    CustomElevatedButton(
                        height: ((30 / 411) * 100).w,
                        width: DeviceExt((250 / 841) * 100).h,
                        text: "msg_download_farmers".tr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        margin: EdgeInsets.only(
                            left: DeviceExt((7 / 841) * 100).h,
                            top: ((27 / 411) * 100).w),
                        leftIcon: Container(
                            padding: EdgeInsets.only(
                              left: DeviceExt((10 / 841) * 100).h,
                            ),
                            margin: EdgeInsets.only(
                                right: DeviceExt((20 / 841) * 100).h),
                            child: CustomImageView(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                width:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                svgPath: ImageConstant.imgRefresh)),
                        buttonStyle: CustomButtonStyles.none,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        onTap: () {
                          updateDialog(context);
                        }),
                    CustomElevatedButton(
                        height: ((27 / 411) * 100).w,
                        width: DeviceExt((250 / 841) * 100).h,
                        text: "lbl_settings".tr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        margin: EdgeInsets.only(
                            left: DeviceExt((7 / 841) * 100).h,
                            top: ((30 / 411) * 100).w),
                        leftIcon: Container(
                            padding: EdgeInsets.only(
                              left: DeviceExt((10 / 841) * 100).h,
                            ),
                            margin: EdgeInsets.only(
                                right: DeviceExt((20 / 841) * 100).h),
                            child: CustomImageView(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                width:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                svgPath: ImageConstant.imgSettingsSolid1)),
                        buttonStyle: CustomButtonStyles.none,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        onTap: () {
                          onTapSettings(context);
                        }),
                    CustomElevatedButton(
                        height: ((27 / 411) * 100).w,
                        width: DeviceExt((250 / 841) * 100).h,
                        text: "lbl_exit".tr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        margin: EdgeInsets.only(
                            left: DeviceExt((7 / 841) * 100).h,
                            top: ((30 / 411) * 100).w),
                        leftIcon: Container(
                            padding: EdgeInsets.only(
                              left: DeviceExt((10 / 841) * 100).h,
                            ),
                            margin: EdgeInsets.only(
                                right: DeviceExt((20 / 841) * 100).h),
                            child: CustomImageView(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                width:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(3).h
                                        : 5.w,
                                svgPath: ImageConstant.imgArrowright)),
                        buttonStyle: CustomButtonStyles.none,
                        buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                        ),
                        onTap: () {
                          onTapRowarrowright(context);
                        }),
                  ])),
        ));
  }

  postDialog(BuildContext context) async {
    Navigator.pop(context);

    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: PostDialog.builder(
                context,
              ),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  updateDialog(BuildContext context) async {
    Navigator.pop(context);

    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: UpdateDBDialog.builder(
                context,
              ),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the homeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the homeScreen.
  onTapDashboard(BuildContext context) {
    Navigator.pop(context);
    NavigatorService.popAndPushNamed(
      AppRoutes.homeScreen,
    );
  }

  /// Navigates to the draftEntriesScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the draftEntriesScreen.
  onTapDraftentries(BuildContext context) {
    Navigator.pop(context);
    PrefUtils().setAction("All");
    NavigatorService.popAndPushNamed(
      AppRoutes.draftEntriesScreen,
    );
  }

  onTapSaved(BuildContext context) {
    Navigator.pop(context);
    PrefUtils().setAction("To Submit");
    NavigatorService.popAndPushNamed(
      AppRoutes.draftEntriesScreen,
    );
  }

  /// Navigates to the searchFarmerScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the searchFarmerScreen.
  onTapRegisterfarmer(BuildContext context) {
    Navigator.pop(context);

    NavigatorService.popAndPushNamed(
      AppRoutes.searchFarmerScreen,
    );
  }

  /// Navigates to the settingsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the settingsScreen.
  onTapSettings(BuildContext context) {
    Navigator.pop(context);

    NavigatorService.popAndPushNamed(
      AppRoutes.settingsScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapRowarrowright(BuildContext context) {
    Navigator.pop(context);

    NavigatorService.popAndPushNamed(
      AppRoutes.loginScreen,
    );
  }
}
