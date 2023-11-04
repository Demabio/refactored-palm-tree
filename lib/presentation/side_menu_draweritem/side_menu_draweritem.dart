import 'package:kiamis_app/presentation/post_dialog/post_dialog.dart';
import 'package:kiamis_app/presentation/update_db/updatedb_dialog.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

class SideMenuDraweritem extends StatelessWidget {
  const SideMenuDraweritem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Drawer(
        child: Container(
            width: 274.h,
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 33.v),
            decoration: AppDecoration.fillWhiteA,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgImage2,
                        height: 70.adaptSize,
                        width: 70.adaptSize),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 2.h, top: 10.v, bottom: 11.v),
                        child: Text("lbl_kiamis".tr,
                            style: theme.textTheme.headlineLarge))
                  ])),
              CustomElevatedButton(
                  height: 28.v,
                  width: 147.h,
                  text: "lbl_dashboard".tr,
                  margin: EdgeInsets.only(left: 7.h, top: 48.v),
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 20.h),
                      child: CustomImageView(svgPath: ImageConstant.imgHome2)),
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: CustomTextStyles.titleMedium18,
                  onTap: () {
                    onTapDashboard(context);
                  }),
              CustomElevatedButton(
                  height: 28.v,
                  width: 155.h,
                  text: "lbl_draft_entries".tr,
                  margin: EdgeInsets.only(left: 7.h, top: 26.v),
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 20.h),
                      child:
                          CustomImageView(svgPath: ImageConstant.imgTransfer1)),
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: CustomTextStyles.titleMedium18,
                  onTap: () {
                    onTapDraftentries(context);
                  }),
              CustomElevatedButton(
                  height: 30.v,
                  width: 222.h,
                  text: "lbl_register_farmer".tr,
                  margin: EdgeInsets.only(left: 7.h, top: 27.v),
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 20.h),
                      child: CustomImageView(svgPath: ImageConstant.imgUser31)),
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: CustomTextStyles.titleMedium18,
                  onTap: () {
                    onTapRegisterfarmer(context);
                  }),
              CustomElevatedButton(
                  height: 30.v,
                  width: 222.h,
                  text: "msg_view_saved_farmers".tr,
                  margin: EdgeInsets.only(left: 7.h, top: 27.v),
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 20.h),
                      child: CustomImageView(
                          svgPath: ImageConstant.imgSavePrimary)),
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: CustomTextStyles.titleMedium18,
                  onTap: () {
                    onTapSaved(context);
                  }),
              CustomElevatedButton(
                  height: 30.v,
                  width: 222.h,
                  text: "msg_post_farmers_to".tr,
                  margin: EdgeInsets.only(left: 7.h, top: 27.v),
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 20.h),
                      child: CustomImageView(svgPath: ImageConstant.imgUpload)),
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: CustomTextStyles.titleMedium18,
                  onTap: () {
                    postDialog(context);
                  }),
              CustomElevatedButton(
                  height: 30.v,
                  width: 222.h,
                  text: "msg_download_farmers".tr,
                  margin: EdgeInsets.only(top: 27.v),
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 20.h),
                      child: CustomImageView(svgPath: ImageConstant.imgUpload)),
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: CustomTextStyles.titleMedium18,
                  onTap: () {
                    updateDialog(context);
                  }),
              CustomElevatedButton(
                  height: 27.v,
                  width: 119.h,
                  text: "lbl_settings".tr,
                  margin: EdgeInsets.only(left: 7.h, top: 30.v),
                  leftIcon: Container(
                      margin: EdgeInsets.only(right: 20.h),
                      child: CustomImageView(
                          svgPath: ImageConstant.imgSettingsSolid1)),
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: CustomTextStyles.titleMedium18,
                  onTap: () {
                    onTapSettings(context);
                  }),
              GestureDetector(
                  onTap: () {
                    onTapRowarrowright(context);
                  },
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 7.h, top: 25.v, bottom: 25.v),
                      child: Row(children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgArrowright,
                            height: 25.adaptSize,
                            width: 25.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Text("lbl_exit".tr,
                                style: CustomTextStyles.titleMedium18))
                      ])))
            ])));
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
