import 'bloc/primary_farm_holding_one_bloc.dart';import 'models/primary_farm_holding_one_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/core/utils/validation_functions.dart';import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';import 'package:kiamis_app/widgets/custom_drop_down.dart';import 'package:kiamis_app/widgets/custom_elevated_button.dart';import 'package:kiamis_app/widgets/custom_floating_text_field.dart';import 'package:kiamis_app/widgets/custom_icon_button.dart';import 'package:kiamis_app/widgets/custom_outlined_button.dart';
// ignore_for_file: must_be_immutable
class PrimaryFarmHoldingOneScreen extends StatelessWidget {PrimaryFarmHoldingOneScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

static Widget builder(BuildContext context) { return BlocProvider<PrimaryFarmHoldingOneBloc>(create: (context) => PrimaryFarmHoldingOneBloc(PrimaryFarmHoldingOneState(primaryFarmHoldingOneModelObj: PrimaryFarmHoldingOneModel()))..add(PrimaryFarmHoldingOneInitialEvent()), child: PrimaryFarmHoldingOneScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: CustomAppBar(leadingWidth: 60.h, leading: AppbarImage(svgPath: ImageConstant.imgSort, margin: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v), onTap: () {onTapSortone(context);}), centerTitle: true, title: AppbarSubtitle1(text: "msg_primary_farm_holding".tr), styleType: Style.bgFill), body: Form(key: _formKey, child: SingleChildScrollView(padding: EdgeInsets.only(top: 5.v), child: Padding(padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 5.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.only(left: 69.h), child: Row(children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Align(alignment: Alignment.centerRight, child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(8.h), child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(top: 16.v, bottom: 13.v), child: SizedBox(width: 54.h, child: Divider()))])), SizedBox(height: 6.v), Text("lbl_step_1".tr, style: CustomTextStyles.bodyLargeBluegray40003)]), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Padding(padding: EdgeInsets.only(top: 16.v, bottom: 13.v), child: SizedBox(width: 54.h, child: Divider())), CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(8.h), child: CustomImageView(svgPath: ImageConstant.imgCheckmark))]), SizedBox(height: 6.v), Align(alignment: Alignment.centerRight, child: Text("lbl_step_2".tr, style: CustomTextStyles.bodyLargeBluegray40003))])])), Padding(padding: EdgeInsets.only(left: 13.h, top: 13.v), child: Text("msg_main_farm_enterprises".tr, style: CustomTextStyles.titleMediumSemiBold)), SizedBox(height: 27.v), Text("msg_descriptive_name2".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<PrimaryFarmHoldingOneBloc, PrimaryFarmHoldingOneState, TextEditingController?>(selector: (state) => state.nameController, builder: (context, nameController) {return CustomFloatingTextField(controller: nameController, labelText: "lbl_name".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "lbl_name".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003, validator: (value) {if (!isText(value)) {return "Please enter valid text";} return null;});}), SizedBox(height: 32.v), Text("msg_total_land_size".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<PrimaryFarmHoldingOneBloc, PrimaryFarmHoldingOneState, TextEditingController?>(selector: (state) => state.sizeController, builder: (context, sizeController) {return CustomFloatingTextField(controller: sizeController, labelText: "lbl_size".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "lbl_size".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003);}), SizedBox(height: 32.v), Text("lbl_area_unit2".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<PrimaryFarmHoldingOneBloc, PrimaryFarmHoldingOneState, PrimaryFarmHoldingOneModel?>(selector: (state) => state.primaryFarmHoldingOneModelObj, builder: (context, primaryFarmHoldingOneModelObj) {return CustomDropDown(icon: Container(margin: EdgeInsets.only(left: 30.h), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.h)), child: CustomImageView(svgPath: ImageConstant.imgArrowdownPrimary)), hintText: "lbl_select".tr, items: primaryFarmHoldingOneModelObj?.dropdownItemList ?? [], onChanged: (value) {context.read<PrimaryFarmHoldingOneBloc>().add(ChangeDropDownEvent(value: value));});}), SizedBox(height: 32.v), Text("msg_size_of_land_under2".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<PrimaryFarmHoldingOneBloc, PrimaryFarmHoldingOneState, TextEditingController?>(selector: (state) => state.sizeoneController, builder: (context, sizeoneController) {return CustomFloatingTextField(controller: sizeoneController, labelText: "lbl_size".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "lbl_size".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003);}), SizedBox(height: 32.v), Text("msg_total_land_area2".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<PrimaryFarmHoldingOneBloc, PrimaryFarmHoldingOneState, TextEditingController?>(selector: (state) => state.areaController, builder: (context, areaController) {return CustomFloatingTextField(controller: areaController, labelText: "lbl_area".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "lbl_area".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003);}), SizedBox(height: 33.v), BlocSelector<PrimaryFarmHoldingOneBloc, PrimaryFarmHoldingOneState, TextEditingController?>(selector: (state) => state.sizeLandLeasedController, builder: (context, sizeLandLeasedController) {return CustomFloatingTextField(controller: sizeLandLeasedController, labelText: "msg_size_of_land_leased2".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "msg_size_of_land_leased2".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003);}), SizedBox(height: 33.v), BlocSelector<PrimaryFarmHoldingOneBloc, PrimaryFarmHoldingOneState, TextEditingController?>(selector: (state) => state.sizeLandIdleController, builder: (context, sizeLandIdleController) {return CustomFloatingTextField(controller: sizeLandIdleController, labelText: "msg_size_of_land_lying2".tr, labelStyle: CustomTextStyles.titleMediumBluegray40003, hintText: "msg_size_of_land_lying2".tr, hintStyle: CustomTextStyles.titleMediumBluegray40003, textInputAction: TextInputAction.done);}), SizedBox(height: 32.v), Row(mainAxisAlignment: MainAxisAlignment.center, children: [Expanded(child: CustomOutlinedButton(text: "lbl_back".tr, margin: EdgeInsets.only(right: 1.h), buttonStyle: CustomButtonStyles.outlinePrimaryTL10, buttonTextStyle: CustomTextStyles.bodyLargePrimary_1)), Expanded(child: CustomElevatedButton(text: "lbl_next".tr, margin: EdgeInsets.only(left: 1.h), onTap: () {onTapNext(context);}))]), SizedBox(height: 12.v), CustomElevatedButton(text: "lbl_save".tr, leftIcon: Container(margin: EdgeInsets.only(right: 10.h), child: CustomImageView(svgPath: ImageConstant.imgSaveWhiteA700)), onTap: () {onTapSave(context);})])))))); } 
/// Navigates to the primaryFarmHoldingScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the primaryFarmHoldingScreen.
onTapSortone(BuildContext context) { NavigatorService.pushNamed(AppRoutes.primaryFarmHoldingScreen, ); } 
/// Navigates to the primaryFarmHoldingTwoScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the primaryFarmHoldingTwoScreen.
onTapNext(BuildContext context) { NavigatorService.pushNamed(AppRoutes.primaryFarmHoldingTwoScreen, ); } 
/// Navigates to the primaryFarmHoldingScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the primaryFarmHoldingScreen.
onTapSave(BuildContext context) { NavigatorService.pushNamed(AppRoutes.primaryFarmHoldingScreen, ); } 
 }
