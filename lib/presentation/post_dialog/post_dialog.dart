import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/dynamic_dialog_2.dart';

import 'bloc/post_modal_bloc.dart';
import 'models/post_modal_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class PostDialog extends StatelessWidget {
  PostDialog({
    Key? key,
  }) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PostModalBloc>(
        create: (context) => PostModalBloc(PostModalState(
            draftEntriesDeleteEntryModalModelObj: PostModalModel()))
          ..add(PostModalInitialEvent()),
        child: PostDialog());
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
            Text("Post to KIAMIS", style: CustomTextStyles.bodyLargePrimary_2),
            SizedBox(height: 8.v),
            Text("Post farmers/farms data to KIAMIS?",
                style: CustomTextStyles.bodyMediumPoppinsBlack900),
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
    Navigator.pop(context);
  }

  /// Navigates to the draftEntriesScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the draftEntriesScreen.
  onTapYes(BuildContext context) {
    context.read<PostModalBloc>().add(PostEvent(
          createSuccessful: () => onTapNo(context),
          createFailed: () => closedialog(context),
        ));
  }

  closedialog(BuildContext context) async {
    Navigator.pop(context);
    String label = "Failed";
    String body = "Posting failed, kindly try again";

    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: DynamicDialogTwo.builder(context, label, body),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
