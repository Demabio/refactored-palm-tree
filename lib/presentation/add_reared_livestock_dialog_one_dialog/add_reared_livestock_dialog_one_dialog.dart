import 'bloc/add_reared_livestock_dialog_one_bloc.dart';import 'models/add_reared_livestock_dialog_one_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/widgets/custom_checkbox_button.dart';import 'package:kiamis_app/widgets/custom_elevated_button.dart';import 'package:kiamis_app/widgets/custom_outlined_button.dart';class AddRearedLivestockDialogOneDialog extends StatelessWidget {const AddRearedLivestockDialogOneDialog({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<AddRearedLivestockDialogOneBloc>(create: (context) => AddRearedLivestockDialogOneBloc(AddRearedLivestockDialogOneState(addRearedLivestockDialogOneModelObj: AddRearedLivestockDialogOneModel()))..add(AddRearedLivestockDialogOneInitialEvent()), child: AddRearedLivestockDialogOneDialog()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return Container(width: 344.h, padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 15.v), decoration: AppDecoration.fillWhiteA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder6), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.only(left: 1.h, top: 8.v), child: Text("msg_add_livestock_feeds".tr, style: CustomTextStyles.titleMediumSemiBold)), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.calfPellets, builder: (context, calfPellets) {return CustomCheckboxButton(text: "lbl_calf_pellets2".tr, value: calfPellets, margin: EdgeInsets.only(left: 3.h, top: 38.v), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBoxEvent(value: value));});}), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.chickMarsh, builder: (context, chickMarsh) {return CustomCheckboxButton(text: "lbl_chick_marsh".tr, value: chickMarsh, margin: EdgeInsets.only(left: 3.h, top: 14.v), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBox1Event(value: value));});}), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.homeMadeFeedMix, builder: (context, homeMadeFeedMix) {return CustomCheckboxButton(text: "msg_home_made_feed_mix".tr, value: homeMadeFeedMix, margin: EdgeInsets.only(left: 3.h, top: 16.v), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBox2Event(value: value));});}), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.improvedPasture, builder: (context, improvedPasture) {return CustomCheckboxButton(text: "msg_improved_pasture".tr, value: improvedPasture, margin: EdgeInsets.only(left: 3.h, top: 17.v, right: 34.h), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBox3Event(value: value));});}), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.manufacturedMea, builder: (context, manufacturedMea) {return CustomCheckboxButton(text: "msg_manufactured_meals".tr, value: manufacturedMea, margin: EdgeInsets.only(left: 3.h, top: 16.v), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBox4Event(value: value));});}), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.mineralSalts, builder: (context, mineralSalts) {return CustomCheckboxButton(text: "lbl_mineral_salts".tr, value: mineralSalts, margin: EdgeInsets.only(left: 3.h, top: 16.v), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBox5Event(value: value));});}), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.ownGrownHay, builder: (context, ownGrownHay) {return CustomCheckboxButton(text: "lbl_own_grown_hay".tr, value: ownGrownHay, margin: EdgeInsets.only(left: 3.h, top: 17.v), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBox6Event(value: value));});}), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.trash, builder: (context, trash) {return CustomCheckboxButton(text: "msg_pig_starter_finisher".tr, value: trash, margin: EdgeInsets.only(left: 3.h, top: 14.v), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBox7Event(value: value));});}), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.purchasedFodder, builder: (context, purchasedFodder) {return CustomCheckboxButton(text: "msg_purchased_fodder2".tr, value: purchasedFodder, margin: EdgeInsets.only(left: 3.h, top: 15.v), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBox8Event(value: value));});}), BlocSelector<AddRearedLivestockDialogOneBloc, AddRearedLivestockDialogOneState, bool?>(selector: (state) => state.purchasedHay, builder: (context, purchasedHay) {return CustomCheckboxButton(text: "lbl_purchased_hay".tr, value: purchasedHay, margin: EdgeInsets.only(left: 3.h, top: 16.v), onChange: (value) {context.read<AddRearedLivestockDialogOneBloc>().add(ChangeCheckBox9Event(value: value));});}), Padding(padding: EdgeInsets.only(left: 1.h, top: 35.v), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 12.v), decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.roundedBorder6), child: Text("lbl_reset".tr, style: CustomTextStyles.bodyLarge16)), CustomElevatedButton(width: 95.h, text: "lbl_add".tr, buttonStyle: CustomButtonStyles.fillPrimaryTL6, buttonTextStyle: CustomTextStyles.bodyLarge16, onTap: () {onTapAdd(context);}), CustomOutlinedButton(width: 95.h, text: "lbl_close".tr, onTap: () {onTapClose(context);})]))])); } 
/// Navigates to the addRearedLivestockTwoScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the addRearedLivestockTwoScreen.
onTapAdd(BuildContext context) { NavigatorService.pushNamed(AppRoutes.addRearedLivestockTwoScreen, ); } 
/// Navigates to the addRearedLivestockOneScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the addRearedLivestockOneScreen.
onTapClose(BuildContext context) { NavigatorService.pushNamed(AppRoutes.addRearedLivestockOneScreen, ); } 
 }