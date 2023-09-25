import 'bloc/enable_linked_accounts_bloc.dart';import 'models/enable_linked_accounts_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';import 'package:kiamis_app/widgets/app_bar/appbar_title.dart';import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';import 'package:kiamis_app/widgets/custom_icon_button.dart';import 'package:kiamis_app/widgets/custom_switch.dart';class EnableLinkedAccountsScreen extends StatelessWidget {const EnableLinkedAccountsScreen({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<EnableLinkedAccountsBloc>(create: (context) => EnableLinkedAccountsBloc(EnableLinkedAccountsState(enableLinkedAccountsModelObj: EnableLinkedAccountsModel()))..add(EnableLinkedAccountsInitialEvent()), child: EnableLinkedAccountsScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(backgroundColor: appTheme.gray5001, appBar: CustomAppBar(height: 48.v, leadingWidth: 40.h, leading: AppbarImage(svgPath: ImageConstant.imgArrowleftOnprimarycontainer, margin: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 11.v), onTap: () {onTapArrowleftone(context);}), centerTitle: true, title: AppbarTitle(text: "msg_enable_linked_accounts".tr)), body: SizedBox(width: mediaQueryData.size.width, child: SingleChildScrollView(padding: EdgeInsets.only(top: 28.v), child: Padding(padding: EdgeInsets.only(left: 13.h, right: 16.h, bottom: 5.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("msg_select_your_account".tr, style: CustomTextStyles.titleLargeInterOnPrimaryContainer), Padding(padding: EdgeInsets.only(left: 3.h, top: 27.v), child: Row(children: [CustomIconButton(height: 30.adaptSize, width: 30.adaptSize, padding: EdgeInsets.all(5.h), decoration: IconButtonStyleHelper.fillBlue, child: CustomImageView(svgPath: ImageConstant.imgInstagramoutline)), Padding(padding: EdgeInsets.only(left: 12.h, top: 6.v), child: Text("lbl_instagram".tr, style: CustomTextStyles.bodyLargeInterBlack900)), Spacer(), BlocSelector<EnableLinkedAccountsBloc, EnableLinkedAccountsState, bool?>(selector: (state) => state.isSelectedSwitch, builder: (context, isSelectedSwitch) {return CustomSwitch(margin: EdgeInsets.only(top: 3.v), value: isSelectedSwitch, onChange: (value) {context.read<EnableLinkedAccountsBloc>().add(ChangeSwitchEvent(value: value));});})])), Padding(padding: EdgeInsets.only(left: 3.h, top: 24.v), child: Row(children: [CustomIconButton(height: 30.adaptSize, width: 30.adaptSize, padding: EdgeInsets.all(5.h), decoration: IconButtonStyleHelper.fillBlue, child: CustomImageView(svgPath: ImageConstant.imgTwitteraltoutline)), Padding(padding: EdgeInsets.only(left: 12.h, top: 4.v, bottom: 3.v), child: Text("lbl_twitter".tr, style: CustomTextStyles.bodyLargeInterBlack900)), Spacer(), BlocSelector<EnableLinkedAccountsBloc, EnableLinkedAccountsState, bool?>(selector: (state) => state.isSelectedSwitch1, builder: (context, isSelectedSwitch1) {return CustomSwitch(margin: EdgeInsets.only(top: 3.v), value: isSelectedSwitch1, onChange: (value) {context.read<EnableLinkedAccountsBloc>().add(ChangeSwitch1Event(value: value));});})])), Padding(padding: EdgeInsets.only(left: 3.h, top: 24.v), child: Row(children: [CustomIconButton(height: 30.adaptSize, width: 30.adaptSize, padding: EdgeInsets.all(5.h), decoration: IconButtonStyleHelper.fillBlue, child: CustomImageView(svgPath: ImageConstant.imgFacebook)), Padding(padding: EdgeInsets.only(left: 12.h, top: 3.v, bottom: 4.v), child: Text("lbl_facebook".tr, style: CustomTextStyles.bodyLargeInterBlack900)), Spacer(), BlocSelector<EnableLinkedAccountsBloc, EnableLinkedAccountsState, bool?>(selector: (state) => state.isSelectedSwitch2, builder: (context, isSelectedSwitch2) {return CustomSwitch(margin: EdgeInsets.only(bottom: 3.v), value: isSelectedSwitch2, onChange: (value) {context.read<EnableLinkedAccountsBloc>().add(ChangeSwitch2Event(value: value));});})])), Padding(padding: EdgeInsets.only(left: 3.h, top: 24.v), child: Row(children: [CustomIconButton(height: 30.adaptSize, width: 30.adaptSize, padding: EdgeInsets.all(5.h), decoration: IconButtonStyleHelper.fillBlue, child: CustomImageView(svgPath: ImageConstant.imgLayoutube)), Padding(padding: EdgeInsets.only(left: 12.h, top: 4.v, bottom: 3.v), child: Text("lbl_youtube".tr, style: CustomTextStyles.bodyLargeInterBlack900)), Spacer(), BlocSelector<EnableLinkedAccountsBloc, EnableLinkedAccountsState, bool?>(selector: (state) => state.isSelectedSwitch3, builder: (context, isSelectedSwitch3) {return CustomSwitch(margin: EdgeInsets.only(top: 3.v), value: isSelectedSwitch3, onChange: (value) {context.read<EnableLinkedAccountsBloc>().add(ChangeSwitch3Event(value: value));});})])), Padding(padding: EdgeInsets.only(left: 3.h, top: 24.v), child: Row(children: [CustomIconButton(height: 30.adaptSize, width: 30.adaptSize, padding: EdgeInsets.all(5.h), decoration: IconButtonStyleHelper.fillBlue, child: CustomImageView(svgPath: ImageConstant.imgGroup2453)), Padding(padding: EdgeInsets.only(left: 12.h, top: 6.v), child: Text("lbl_telegram".tr, style: CustomTextStyles.bodyLargeInterBlack900)), Spacer(), BlocSelector<EnableLinkedAccountsBloc, EnableLinkedAccountsState, bool?>(selector: (state) => state.isSelectedSwitch4, builder: (context, isSelectedSwitch4) {return CustomSwitch(margin: EdgeInsets.only(top: 3.v), value: isSelectedSwitch4, onChange: (value) {context.read<EnableLinkedAccountsBloc>().add(ChangeSwitch4Event(value: value));});})]))])))))); } 


/// Navigates to the previous screen.
///
/// This function takes a [BuildContext] object as a parameter, which is
/// used to build the navigation stack. When the action is triggered, this
/// function uses the [NavigatorService] to navigate to the previous screen
/// in the navigation stack.
onTapArrowleftone(BuildContext context) { NavigatorService.goBack(); } 
 }