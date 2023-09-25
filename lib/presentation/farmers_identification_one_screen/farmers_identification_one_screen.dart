import 'bloc/farmers_identification_one_bloc.dart';import 'models/farmers_identification_one_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/core/utils/validation_functions.dart';import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';import 'package:kiamis_app/widgets/custom_elevated_button.dart';import 'package:kiamis_app/widgets/custom_floating_text_field.dart';import 'package:kiamis_app/widgets/custom_outlined_button.dart';
// ignore_for_file: must_be_immutable
class FarmersIdentificationOneScreen extends StatelessWidget {FarmersIdentificationOneScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

static Widget builder(BuildContext context) { return BlocProvider<FarmersIdentificationOneBloc>(create: (context) => FarmersIdentificationOneBloc(FarmersIdentificationOneState(farmersIdentificationOneModelObj: FarmersIdentificationOneModel()))..add(FarmersIdentificationOneInitialEvent()), child: FarmersIdentificationOneScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return BlocBuilder<FarmersIdentificationOneBloc, FarmersIdentificationOneState>(builder: (context, state) {return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: CustomAppBar(leadingWidth: 60.h, leading: AppbarImage(svgPath: ImageConstant.imgSort, margin: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v), onTap: () {onTapSortone(context);}), centerTitle: true, title: AppbarSubtitle1(text: "msg_farmers_identification".tr), styleType: Style.bgFill), body: Form(key: _formKey, child: SingleChildScrollView(padding: EdgeInsets.only(top: 9.v), child: Padding(padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 5.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.symmetric(horizontal: 7.h), child: Row(children: [Column(children: [CustomImageView(svgPath: ImageConstant.imgArrowleftBlueGray40003, height: 31.v, width: 82.h, onTap: () {onTapImgArrowleftone(context);}), SizedBox(height: 6.v), Text("lbl_step_1".tr, style: CustomTextStyles.bodyLargeBluegray40003)]), Column(children: [CustomImageView(svgPath: ImageConstant.imgArrowleftBlueGray4000331x82, height: 31.v, width: 82.h, onTap: () {onTapImgArrowleftthree(context);}), SizedBox(height: 6.v), Text("lbl_step_2".tr, style: CustomTextStyles.bodyLargeBluegray40003)]), Column(children: [CustomImageView(svgPath: ImageConstant.imgArrowleftBlueGray4000331x82, height: 31.v, width: 82.h), SizedBox(height: 6.v), Text("lbl_step_3".tr, style: CustomTextStyles.bodyLargeBluegray40003)]), Column(children: [CustomImageView(svgPath: ImageConstant.imgCheckmarkBlueGray40003, height: 31.v, width: 82.h), SizedBox(height: 6.v), Text("lbl_step_4".tr, style: CustomTextStyles.bodyLargeBluegray40003)])])), SizedBox(height: 13.v), Text("msg_enumaration_geography".tr, style: CustomTextStyles.titleMediumSemiBold), SizedBox(height: 19.v), BlocSelector<FarmersIdentificationOneBloc, FarmersIdentificationOneState, TextEditingController?>(selector: (state) => state.nameController, builder: (context, nameController) {return CustomFloatingTextField(controller: nameController, labelText: "msg_village_unit_name2".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "msg_village_unit_name2".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003, validator: (value) {if (!isText(value)) {return "Please enter valid text";} return null;}, contentPadding: EdgeInsets.fromLTRB(12.h, 16.v, 12.h, 9.v));}), SizedBox(height: 20.v), Text("msg_enumerator_area2".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<FarmersIdentificationOneBloc, FarmersIdentificationOneState, TextEditingController?>(selector: (state) => state.areaNumberController, builder: (context, areaNumberController) {return CustomFloatingTextField(controller: areaNumberController, labelText: "lbl_area_number".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "lbl_area_number".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003, textInputType: TextInputType.number, validator: (value) {if (!isNumeric(value)) {return "Please enter valid number";} return null;}, contentPadding: EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 12.v));}), SizedBox(height: 21.v), BlocSelector<FarmersIdentificationOneBloc, FarmersIdentificationOneState, TextEditingController?>(selector: (state) => state.shoppingCenterController, builder: (context, shoppingCenterController) {return CustomFloatingTextField(controller: shoppingCenterController, labelText: "lbl_shopping_center".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "lbl_shopping_center".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003, contentPadding: EdgeInsets.fromLTRB(16.h, 15.v, 16.h, 10.v));}), SizedBox(height: 20.v), Text("msg_individual_farmer".tr, style: CustomTextStyles.titleMediumSemiBold), SizedBox(height: 20.v), Text("lbl_farmer_name2".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<FarmersIdentificationOneBloc, FarmersIdentificationOneState, TextEditingController?>(selector: (state) => state.nameController1, builder: (context, nameController1) {return CustomFloatingTextField(controller: nameController1, labelText: "lbl_name".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "lbl_name".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003, textInputAction: TextInputAction.done, validator: (value) {if (!isText(value)) {return "Please enter valid text";} return null;}, contentPadding: EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 12.v));}), SizedBox(height: 31.v), Row(mainAxisAlignment: MainAxisAlignment.center, children: [Expanded(child: CustomOutlinedButton(text: "lbl_back".tr, margin: EdgeInsets.only(right: 1.h), buttonStyle: CustomButtonStyles.outlinePrimaryTL10, buttonTextStyle: CustomTextStyles.bodyLargePrimary_1)), Expanded(child: CustomElevatedButton(text: "lbl_next".tr, margin: EdgeInsets.only(left: 1.h), onTap: () {onTapNext(context);}))]), SizedBox(height: 12.v), CustomElevatedButton(text: "lbl_save".tr, leftIcon: Container(margin: EdgeInsets.only(right: 10.h), child: CustomImageView(svgPath: ImageConstant.imgSaveWhiteA700)), onTap: () {onTapSave(context);})]))))));}); } 
/// Navigates to the farmersIdentificationScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the farmersIdentificationScreen.
onTapSortone(BuildContext context) { NavigatorService.pushNamed(AppRoutes.farmersIdentificationScreen, ); } 


/// Navigates to the previous screen.
///
/// This function takes a [BuildContext] object as a parameter, which is
/// used to build the navigation stack. When the action is triggered, this
/// function uses the [NavigatorService] to navigate to the previous screen
/// in the navigation stack.
onTapImgArrowleftone(BuildContext context) { NavigatorService.goBack(); } 


/// Navigates to the previous screen.
///
/// This function takes a [BuildContext] object as a parameter, which is
/// used to build the navigation stack. When the action is triggered, this
/// function uses the [NavigatorService] to navigate to the previous screen
/// in the navigation stack.
onTapImgArrowleftthree(BuildContext context) { NavigatorService.goBack(); } 
/// Navigates to the farmersIdentificationTwoScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the farmersIdentificationTwoScreen.
onTapNext(BuildContext context) { NavigatorService.pushNamed(AppRoutes.farmersIdentificationTwoScreen, ); } 
/// Navigates to the farmersIdentificationScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the farmersIdentificationScreen.
onTapSave(BuildContext context) { NavigatorService.pushNamed(AppRoutes.farmersIdentificationScreen, ); } 
 }
