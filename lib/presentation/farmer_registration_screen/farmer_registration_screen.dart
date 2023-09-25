import 'bloc/farmer_registration_bloc.dart';import 'models/farmer_registration_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';import 'package:kiamis_app/widgets/custom_elevated_button.dart';import 'package:kiamis_app/widgets/custom_icon_button.dart';import 'package:kiamis_app/widgets/custom_outlined_button.dart';import 'package:kiamis_app/presentation/save_draft_modal_dialog/save_draft_modal_dialog.dart';class FarmerRegistrationScreen extends StatelessWidget {const FarmerRegistrationScreen({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<FarmerRegistrationBloc>(create: (context) => FarmerRegistrationBloc(FarmerRegistrationState(farmerRegistrationModelObj: FarmerRegistrationModel()))..add(FarmerRegistrationInitialEvent()), child: FarmerRegistrationScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return BlocBuilder<FarmerRegistrationBloc, FarmerRegistrationState>(builder: (context, state) {return SafeArea(child: Scaffold(appBar: CustomAppBar(height: 47.v, leadingWidth: 48.h, leading: AppbarImage(svgPath: ImageConstant.imgMenu, margin: EdgeInsets.only(left: 24.h, top: 8.v, bottom: 15.v)), centerTitle: true, title: AppbarSubtitle1(text: "msg_farmer_registration".tr)), body: SizedBox(width: mediaQueryData.size.width, child: SingleChildScrollView(padding: EdgeInsets.only(top: 24.v), child: Padding(padding: EdgeInsets.only(left: 22.h, right: 10.h, bottom: 5.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.only(left: 8.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(9.h), decoration: IconButtonStyleHelper.fillPrimary, child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(right: 13.h), child: SizedBox(height: 119.v, child: VerticalDivider(width: 2.h, thickness: 2.v, color: theme.colorScheme.primary)))]), Padding(padding: EdgeInsets.only(left: 16.h, bottom: 42.v), child: Column(children: [Text("msg_farmers_identification".tr, style: CustomTextStyles.titleMediumBluegray90001), SizedBox(height: 51.v), CustomElevatedButton(height: 33.v, width: 177.h, text: "lbl_edit_details".tr, buttonTextStyle: CustomTextStyles.titleMediumWhiteA700, onTap: () {onTapEditdetails(context);})]))])), Padding(padding: EdgeInsets.only(left: 8.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(9.h), decoration: IconButtonStyleHelper.fillPrimary, child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(right: 13.h), child: SizedBox(height: 119.v, child: VerticalDivider(width: 2.h, thickness: 2.v, color: theme.colorScheme.primary)))]), Padding(padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 42.v), child: Column(children: [Text("msg_primary_farm_holding".tr, style: CustomTextStyles.titleMediumBluegray90001), SizedBox(height: 48.v), CustomElevatedButton(height: 33.v, width: 177.h, text: "lbl_edit_details".tr, buttonTextStyle: CustomTextStyles.titleMediumWhiteA700, onTap: () {onTapEditdetails1(context);})]))])), Padding(padding: EdgeInsets.only(left: 8.h, right: 83.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(9.h), decoration: IconButtonStyleHelper.fillPrimary, child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(right: 13.h), child: SizedBox(height: 119.v, child: VerticalDivider(width: 2.h, thickness: 2.v, color: theme.colorScheme.primary)))]), Expanded(child: Padding(padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 42.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("msg_add_other_farm_holdings".tr, style: CustomTextStyles.titleMediumBluegray90001), CustomElevatedButton(height: 33.v, text: "lbl_edit_details".tr, margin: EdgeInsets.only(top: 48.v, right: 26.h), buttonTextStyle: CustomTextStyles.titleMediumWhiteA700, onTap: () {onTapEditdetails2(context);})])))])), Padding(padding: EdgeInsets.only(left: 8.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(9.h), decoration: IconButtonStyleHelper.fillPrimary, child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(right: 13.h), child: SizedBox(height: 119.v, child: VerticalDivider(width: 2.h, thickness: 2.v, color: theme.colorScheme.primary)))]), Padding(padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 42.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("msg_crop_agriculture".tr, style: CustomTextStyles.titleMediumBluegray90001), SizedBox(height: 48.v), CustomElevatedButton(height: 33.v, width: 177.h, text: "lbl_edit_details".tr, buttonTextStyle: CustomTextStyles.titleMediumWhiteA700, onTap: () {onTapEditdetails3(context);})]))])), Padding(padding: EdgeInsets.only(left: 8.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(9.h), child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(right: 13.h), child: SizedBox(height: 119.v, child: VerticalDivider(width: 2.h, thickness: 2.v)))]), Padding(padding: EdgeInsets.only(left: 16.h, bottom: 42.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("lbl_livestock".tr, style: CustomTextStyles.titleMediumBluegray90001), SizedBox(height: 51.v), CustomElevatedButton(height: 33.v, width: 177.h, text: "lbl_add_details".tr, buttonTextStyle: CustomTextStyles.titleMediumWhiteA700, onTap: () {onTapAdddetails(context);})]))])), Padding(padding: EdgeInsets.only(left: 8.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(9.h), child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(right: 13.h), child: SizedBox(height: 119.v, child: VerticalDivider(width: 2.h, thickness: 2.v)))]), Padding(padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 42.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("lbl_aquaculture".tr, style: CustomTextStyles.titleMediumBluegray90001), SizedBox(height: 48.v), CustomElevatedButton(height: 33.v, width: 177.h, text: "lbl_add_details".tr, buttonTextStyle: CustomTextStyles.titleMediumWhiteA700)]))])), Padding(padding: EdgeInsets.only(left: 8.h, right: 52.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(9.h), child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(right: 13.h), child: SizedBox(height: 119.v, child: VerticalDivider(width: 2.h, thickness: 2.v)))]), Expanded(child: Padding(padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 42.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("msg_farm_technology".tr, style: CustomTextStyles.titleMediumBluegray90001), SizedBox(height: 48.v), CustomElevatedButton(height: 33.v, width: 177.h, text: "lbl_add_details".tr, buttonTextStyle: CustomTextStyles.titleMediumWhiteA700)])))])), Padding(padding: EdgeInsets.only(left: 8.h, right: 43.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Column(crossAxisAlignment: CrossAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(9.h), child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(right: 13.h), child: SizedBox(height: 119.v, child: VerticalDivider(width: 2.h, thickness: 2.v)))]), Expanded(child: Padding(padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 42.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("msg_land_and_water_management".tr, style: CustomTextStyles.titleMediumBluegray90001), SizedBox(height: 48.v), CustomElevatedButton(height: 33.v, width: 177.h, text: "lbl_add_details".tr, buttonTextStyle: CustomTextStyles.titleMediumWhiteA700)])))])), Padding(padding: EdgeInsets.only(left: 8.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomIconButton(height: 31.v, width: 32.h, margin: EdgeInsets.only(bottom: 77.v), padding: EdgeInsets.all(9.h), child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(left: 16.h), child: Column(children: [Text("msg_financial_and_services".tr, style: CustomTextStyles.titleMediumBluegray90001), SizedBox(height: 51.v), CustomElevatedButton(height: 33.v, width: 177.h, text: "lbl_add_details".tr, buttonTextStyle: CustomTextStyles.titleMediumWhiteA700)]))])), SizedBox(height: 54.v), CustomElevatedButton(text: "lbl_save".tr, leftIcon: Container(margin: EdgeInsets.only(right: 10.h), child: CustomImageView(svgPath: ImageConstant.imgSaveWhiteA700)), onTap: () {onTapSave(context);}), SizedBox(height: 12.v), CustomOutlinedButton(text: "lbl_discard".tr, leftIcon: Container(margin: EdgeInsets.only(right: 10.h), child: CustomImageView(svgPath: ImageConstant.imgTrashPrimary)), buttonStyle: CustomButtonStyles.outlinePrimary, buttonTextStyle: CustomTextStyles.bodyLargePrimary_2, onTap: () {onTapDiscard(context);})]))))));}); } 
/// Navigates to the farmersIdentificationScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the farmersIdentificationScreen.
onTapEditdetails(BuildContext context) { NavigatorService.pushNamed(AppRoutes.farmersIdentificationScreen, ); } 
/// Navigates to the primaryFarmHoldingScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the primaryFarmHoldingScreen.
onTapEditdetails1(BuildContext context) { NavigatorService.pushNamed(AppRoutes.primaryFarmHoldingScreen, ); } 
/// Navigates to the addFarmHoldingScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the addFarmHoldingScreen.
onTapEditdetails2(BuildContext context) { NavigatorService.pushNamed(AppRoutes.addFarmHoldingScreen, ); } 
/// Navigates to the cropAgricultureScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the cropAgricultureScreen.
onTapEditdetails3(BuildContext context) { NavigatorService.pushNamed(AppRoutes.cropAgricultureScreen, ); } 
/// Navigates to the livestockOneTabContainerScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the livestockOneTabContainerScreen.
onTapAdddetails(BuildContext context) { NavigatorService.pushNamed(AppRoutes.livestockOneTabContainerScreen, ); } 
/// Navigates to the homeScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the homeScreen.
onTapSave(BuildContext context) { NavigatorService.pushNamed(AppRoutes.homeScreen, ); } 


/// Displays an [AlertDialog] with a custom content widget using the 
/// provided [BuildContext].
///
/// The custom content widget is created by calling 
/// [SaveDraftModalDialog.builder] method.
onTapDiscard(BuildContext context) { showDialog(context: context, builder: (_) => AlertDialog(content: SaveDraftModalDialog.builder(context),backgroundColor: Colors.transparent, contentPadding: EdgeInsets.zero, insetPadding: const EdgeInsets.only(left: 0),)); } 
 }
