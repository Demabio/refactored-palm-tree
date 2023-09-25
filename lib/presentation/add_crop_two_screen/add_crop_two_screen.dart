import 'bloc/add_crop_two_bloc.dart';import 'models/add_crop_two_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';import 'package:kiamis_app/widgets/custom_drop_down.dart';import 'package:kiamis_app/widgets/custom_elevated_button.dart';import 'package:kiamis_app/widgets/custom_icon_button.dart';import 'package:kiamis_app/widgets/custom_outlined_button.dart';class AddCropTwoScreen extends StatelessWidget {const AddCropTwoScreen({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<AddCropTwoBloc>(create: (context) => AddCropTwoBloc(AddCropTwoState(addCropTwoModelObj: AddCropTwoModel()))..add(AddCropTwoInitialEvent()), child: AddCropTwoScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(appBar: CustomAppBar(leadingWidth: 60.h, leading: AppbarImage(svgPath: ImageConstant.imgSort, margin: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v), onTap: () {onTapSortone(context);}), centerTitle: true, title: AppbarSubtitle1(text: "lbl_add_new_crop".tr), styleType: Style.bgFill), body: SizedBox(width: mediaQueryData.size.width, child: SingleChildScrollView(padding: EdgeInsets.only(top: 10.v), child: Padding(padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 5.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.only(left: 69.h), child: Row(children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Align(alignment: Alignment.centerRight, child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(8.h), decoration: IconButtonStyleHelper.fillPrimary, child: CustomImageView(svgPath: ImageConstant.imgCheckmark)), Padding(padding: EdgeInsets.only(top: 16.v, bottom: 13.v), child: SizedBox(width: 54.h, child: Divider(color: theme.colorScheme.primary)))])), SizedBox(height: 6.v), Text("lbl_step_1".tr, style: CustomTextStyles.bodyLargeBluegray90001)]), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Padding(padding: EdgeInsets.only(top: 16.v, bottom: 13.v), child: SizedBox(width: 54.h, child: Divider())), CustomIconButton(height: 31.v, width: 32.h, padding: EdgeInsets.all(8.h), child: CustomImageView(svgPath: ImageConstant.imgCheckmark))]), SizedBox(height: 6.v), Align(alignment: Alignment.centerRight, child: Text("lbl_step_2".tr, style: CustomTextStyles.bodyLargeBluegray40003))])])), SizedBox(height: 44.v), Text("lbl_purpose2".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<AddCropTwoBloc, AddCropTwoState, AddCropTwoModel?>(selector: (state) => state.addCropTwoModelObj, builder: (context, addCropTwoModelObj) {return CustomDropDown(icon: Container(margin: EdgeInsets.only(left: 30.h), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.h)), child: CustomImageView(svgPath: ImageConstant.imgArrowdownPrimary)), hintText: "lbl_select".tr, items: addCropTwoModelObj?.dropdownItemList ?? [], onChanged: (value) {context.read<AddCropTwoBloc>().add(ChangeDropDownEvent(value: value));});}), SizedBox(height: 35.v), Text("msg_production_system".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<AddCropTwoBloc, AddCropTwoState, AddCropTwoModel?>(selector: (state) => state.addCropTwoModelObj, builder: (context, addCropTwoModelObj) {return CustomDropDown(icon: Container(margin: EdgeInsets.only(left: 30.h), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.h)), child: CustomImageView(svgPath: ImageConstant.imgArrowdownPrimary)), hintText: "lbl_select".tr, items: addCropTwoModelObj?.dropdownItemList1 ?? [], onChanged: (value) {context.read<AddCropTwoBloc>().add(ChangeDropDown1Event(value: value));});}), SizedBox(height: 35.v), Text("msg_water_source".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<AddCropTwoBloc, AddCropTwoState, AddCropTwoModel?>(selector: (state) => state.addCropTwoModelObj, builder: (context, addCropTwoModelObj) {return CustomDropDown(icon: Container(margin: EdgeInsets.only(left: 30.h), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.h)), child: CustomImageView(svgPath: ImageConstant.imgArrowdownPrimary)), hintText: "lbl_select".tr, items: addCropTwoModelObj?.dropdownItemList2 ?? [], onChanged: (value) {context.read<AddCropTwoBloc>().add(ChangeDropDown2Event(value: value));});}), SizedBox(height: 35.v), Text("msg_use_pesticide".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<AddCropTwoBloc, AddCropTwoState, AddCropTwoModel?>(selector: (state) => state.addCropTwoModelObj, builder: (context, addCropTwoModelObj) {return CustomDropDown(icon: Container(margin: EdgeInsets.only(left: 30.h), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.h)), child: CustomImageView(svgPath: ImageConstant.imgArrowdownPrimary)), hintText: "lbl_select".tr, items: addCropTwoModelObj?.dropdownItemList3 ?? [], onChanged: (value) {context.read<AddCropTwoBloc>().add(ChangeDropDown3Event(value: value));});}), SizedBox(height: 35.v), Text("msg_use_fertilizer".tr, style: CustomTextStyles.labelMediumPrimary_1), BlocSelector<AddCropTwoBloc, AddCropTwoState, AddCropTwoModel?>(selector: (state) => state.addCropTwoModelObj, builder: (context, addCropTwoModelObj) {return CustomDropDown(icon: Container(margin: EdgeInsets.fromLTRB(30.h, 11.v, 1.h, 14.v), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.h)), child: CustomImageView(svgPath: ImageConstant.imgArrowdownPrimary)), hintText: "lbl_select".tr, items: addCropTwoModelObj?.dropdownItemList4 ?? [], onChanged: (value) {context.read<AddCropTwoBloc>().add(ChangeDropDown4Event(value: value));});}), SizedBox(height: 36.v), Row(mainAxisAlignment: MainAxisAlignment.center, children: [Expanded(child: CustomOutlinedButton(text: "lbl_back".tr, margin: EdgeInsets.only(right: 1.h), buttonStyle: CustomButtonStyles.outlinePrimary, buttonTextStyle: CustomTextStyles.bodyLargePrimary_2, onTap: () {onTapBack(context);})), Expanded(child: CustomElevatedButton(text: "lbl_next".tr, margin: EdgeInsets.only(left: 1.h), buttonStyle: CustomButtonStyles.fillPrimaryTL10))]), SizedBox(height: 12.v), CustomElevatedButton(text: "lbl_save".tr, leftIcon: Container(margin: EdgeInsets.only(right: 10.h), child: CustomImageView(svgPath: ImageConstant.imgSaveWhiteA700)), onTap: () {onTapSave(context);})])))))); } 
/// Navigates to the addCropOneScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the addCropOneScreen.
onTapSortone(BuildContext context) { NavigatorService.pushNamed(AppRoutes.addCropOneScreen, ); } 
/// Navigates to the addCropOneScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the addCropOneScreen.
onTapBack(BuildContext context) { NavigatorService.pushNamed(AppRoutes.addCropOneScreen, ); } 
/// Navigates to the cropAgricultureScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the cropAgricultureScreen.
onTapSave(BuildContext context) { NavigatorService.pushNamed(AppRoutes.cropAgricultureScreen, ); } 
 }
