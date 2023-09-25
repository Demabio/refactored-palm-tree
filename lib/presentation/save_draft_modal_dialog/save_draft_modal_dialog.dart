import 'bloc/save_draft_modal_bloc.dart';import 'models/save_draft_modal_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/widgets/custom_elevated_button.dart';import 'package:kiamis_app/widgets/custom_outlined_button.dart';class SaveDraftModalDialog extends StatelessWidget {const SaveDraftModalDialog({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<SaveDraftModalBloc>(create: (context) => SaveDraftModalBloc(SaveDraftModalState(saveDraftModalModelObj: SaveDraftModalModel()))..add(SaveDraftModalInitialEvent()), child: SaveDraftModalDialog()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return Container(width: 330.h, padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 29.v), decoration: AppDecoration.fillWhiteA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10), child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.end, children: [SizedBox(height: 9.v), Text("msg_entry_cancellation".tr, style: CustomTextStyles.bodyLargePrimary_2), SizedBox(height: 8.v), Text("msg_are_you_sure_you".tr, style: CustomTextStyles.bodyMediumPoppinsBlack900), SizedBox(height: 18.v), Row(mainAxisAlignment: MainAxisAlignment.center, children: [Expanded(child: CustomOutlinedButton(text: "lbl_no".tr, margin: EdgeInsets.only(right: 4.h), onTap: () {onTapNo(context);})), Expanded(child: CustomElevatedButton(text: "lbl_yes".tr, margin: EdgeInsets.only(left: 4.h), buttonStyle: CustomButtonStyles.fillPrimaryTL6, buttonTextStyle: CustomTextStyles.bodyLarge16, onTap: () {onTapYes(context);}))]), SizedBox(height: 20.v), CustomElevatedButton(height: 45.v, text: "lbl_save_to_drafts".tr, leftIcon: Container(margin: EdgeInsets.only(right: 12.h), child: CustomImageView(svgPath: ImageConstant.imgSaveWhiteA700)), buttonTextStyle: CustomTextStyles.bodyLarge16, onTap: () {onTapSavetodrafts(context);})])); } 
/// Navigates to the farmerRegistrationScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the farmerRegistrationScreen.
onTapNo(BuildContext context) { NavigatorService.pushNamed(AppRoutes.farmerRegistrationScreen, ); } 
/// Navigates to the homeScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the homeScreen.
onTapYes(BuildContext context) { NavigatorService.pushNamed(AppRoutes.homeScreen, ); } 
/// Navigates to the homeScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the homeScreen.
onTapSavetodrafts(BuildContext context) { NavigatorService.pushNamed(AppRoutes.homeScreen, ); } 
 }
