import 'bloc/draft_entries_clear_drafts_modal_bloc.dart';
import 'models/draft_entries_clear_drafts_modal_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
        width:
            Device.orientation == Orientation.portrait ? DeviceExt(40).h : 50.w,
        padding: Device.orientation == Orientation.portrait
            ? EdgeInsets.symmetric(horizontal: DeviceExt(0.8).h, vertical: 5.w)
            : EdgeInsets.symmetric(
                horizontal: DeviceExt(1.8).w, vertical: DeviceExt(5).h),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            label,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: Device.orientation == Orientation.portrait
                  ? DeviceExt(1.8).h
                  : DeviceExt(2).w,
            ),
          ),
          SizedBox(
              height: Device.orientation == Orientation.portrait
                  ? 2.4.w
                  : DeviceExt(2.4).h),
          Text(
            body,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontSize: Device.orientation == Orientation.portrait
                  ? DeviceExt(1.8).h
                  : DeviceExt(2).w,
            ),
          ),
          Padding(
              padding: Device.orientation == Orientation.portrait
                  ? EdgeInsets.fromLTRB(
                      DeviceExt(1).h, 6.w, DeviceExt(1).h, 1.2.w)
                  : EdgeInsets.fromLTRB(DeviceExt(1).w, DeviceExt(6).h,
                      DeviceExt(1).w, DeviceExt(1.2).h),
              child: CustomElevatedButton(
                  height: Device.orientation == Orientation.portrait
                      ? DeviceExt(6).h
                      : 8.w,
                  // width:
                  //     Device.orientation == Orientation.portrait
                  //         ? DeviceExt(50).h
                  //         : 50.w,
                  width: Device.orientation == Orientation.portrait
                      ? DeviceExt(17).h
                      : 17.w,
                  text: "Close".tr,
                  margin: EdgeInsets.only(
                      left: Device.orientation == Orientation.portrait
                          ? DeviceExt(1).h
                          : 1.w),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                  buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(2).h
                        : DeviceExt(2.5).w,
                  ),
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
