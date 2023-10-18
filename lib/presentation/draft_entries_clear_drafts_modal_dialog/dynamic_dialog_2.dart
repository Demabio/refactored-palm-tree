import 'bloc/draft_entries_clear_drafts_modal_bloc.dart';
import 'models/draft_entries_clear_drafts_modal_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class DynamicDialogTwo extends StatelessWidget {
  final String label;
  final String body;
  const DynamicDialogTwo({
    Key? key,
    required this.label,
    required this.body,
  }) : super(key: key);

  static Widget builder(BuildContext context, String label, String body) {
    return BlocProvider<DraftEntriesClearDraftsModalBloc>(
        create: (context) => DraftEntriesClearDraftsModalBloc(
            DraftEntriesClearDraftsModalState(
                draftEntriesClearDraftsModalModelObj:
                    DraftEntriesClearDraftsModalModel()))
          ..add(DraftEntriesClearDraftsModalInitialEvent()),
        child: DynamicDialogTwo(
          label: label,
          body: body,
        ));
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 330.h,
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 22.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(label, style: CustomTextStyles.bodyLargePrimary_2),
          SizedBox(height: 10.v),
          Text(body, style: CustomTextStyles.bodyMediumPoppinsBlack900),
          Padding(
              padding: EdgeInsets.fromLTRB(8.h, 24.v, 8.h, 5.v),
              child: CustomElevatedButton(
                  width: 145.h,
                  text: "Close".tr,
                  margin: EdgeInsets.only(left: 8.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                  buttonTextStyle: CustomTextStyles.bodyLarge16,
                  onTap: () {
                    Navigator.pop(context);
                  }))
        ]));
  }

  /// Navigates to the draftEntriesScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the draftEntriesScreen.
  onTapNo(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.draftEntriesScreen,
    );
  }

  /// Navigates to the draftEntriesScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the draftEntriesScreen.
  onTapYes(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.draftEntriesScreen,
    );
  }
}
