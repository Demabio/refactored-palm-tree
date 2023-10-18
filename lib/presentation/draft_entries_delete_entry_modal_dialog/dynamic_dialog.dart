import 'bloc/draft_entries_delete_entry_modal_bloc.dart';
import 'models/draft_entries_delete_entry_modal_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class DynamicDialog extends StatelessWidget {
  final String label;
  final String body;

  DynamicDialog({Key? key, required this.label, required this.body})
      : super(key: key);

  static Widget builder(BuildContext context, String label, String body) {
    return BlocProvider<DraftEntriesDeleteEntryModalBloc>(
        create: (context) => DraftEntriesDeleteEntryModalBloc(
            DraftEntriesDeleteEntryModalState(
                draftEntriesDeleteEntryModalModelObj:
                    DraftEntriesDeleteEntryModalModel()))
          ..add(DraftEntriesDeleteEntryModalInitialEvent()),
        child: DynamicDialog(
          label: label,
          body: body,
        ));
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
          width: 330.h,
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 26.v),
          decoration: AppDecoration.fillWhiteA
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(label, style: CustomTextStyles.bodyLargePrimary_2),
            SizedBox(height: 8.v),
            Text(body, style: CustomTextStyles.bodyMediumPoppinsBlack900),
            SizedBox(height: 23.v),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: CustomOutlinedButton(
                      text: "lbl_no".tr,
                      margin: EdgeInsets.only(right: 4.h),
                      onTap: () {
                        onTapNo(context);
                      })),
              Expanded(
                  child: CustomElevatedButton(
                      text: "lbl_yes".tr,
                      margin: EdgeInsets.only(left: 4.h),
                      buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                      buttonTextStyle: CustomTextStyles.bodyLarge16,
                      onTap: () {
                        onTapYes(context);
                      }))
            ])
          ])),
    );
  }

  /// Navigates to the draftEntriesScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the draftEntriesScreen.
  onTapNo(BuildContext context) {
    PrefUtils().setYesNo(false);
    Navigator.pop(context);
  }

  /// Navigates to the draftEntriesScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the draftEntriesScreen.
  onTapYes(BuildContext context) {
    PrefUtils().setYesNo(true);
    Navigator.pop(context);
  }
}
