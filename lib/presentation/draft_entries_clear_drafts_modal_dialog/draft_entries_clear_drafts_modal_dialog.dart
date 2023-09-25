import 'bloc/draft_entries_clear_drafts_modal_bloc.dart';import 'models/draft_entries_clear_drafts_modal_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/widgets/custom_elevated_button.dart';import 'package:kiamis_app/widgets/custom_outlined_button.dart';class DraftEntriesClearDraftsModalDialog extends StatelessWidget {const DraftEntriesClearDraftsModalDialog({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<DraftEntriesClearDraftsModalBloc>(create: (context) => DraftEntriesClearDraftsModalBloc(DraftEntriesClearDraftsModalState(draftEntriesClearDraftsModalModelObj: DraftEntriesClearDraftsModalModel()))..add(DraftEntriesClearDraftsModalInitialEvent()), child: DraftEntriesClearDraftsModalDialog()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return Container(width: 330.h, padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 22.v), decoration: AppDecoration.fillWhiteA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10), child: Column(mainAxisSize: MainAxisSize.min, children: [Text("lbl_clear_drafts".tr, style: CustomTextStyles.bodyLargePrimary_2), SizedBox(height: 10.v), Text("msg_are_you_sure_you3".tr, style: CustomTextStyles.bodyMediumPoppinsBlack900), Padding(padding: EdgeInsets.fromLTRB(8.h, 24.v, 8.h, 5.v), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [CustomOutlinedButton(width: 145.h, text: "lbl_no".tr, onTap: () {onTapNo(context);}), CustomElevatedButton(width: 145.h, text: "lbl_yes".tr, margin: EdgeInsets.only(left: 8.h), buttonStyle: CustomButtonStyles.fillPrimaryTL6, buttonTextStyle: CustomTextStyles.bodyLarge16, onTap: () {onTapYes(context);})]))])); } 
/// Navigates to the draftEntriesScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the draftEntriesScreen.
onTapNo(BuildContext context) { NavigatorService.pushNamed(AppRoutes.draftEntriesScreen, ); } 
/// Navigates to the draftEntriesScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the draftEntriesScreen.
onTapYes(BuildContext context) { NavigatorService.pushNamed(AppRoutes.draftEntriesScreen, ); } 
 }
