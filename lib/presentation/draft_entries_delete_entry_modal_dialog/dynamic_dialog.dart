import 'bloc/draft_entries_delete_entry_modal_bloc.dart';
import 'models/draft_entries_delete_entry_modal_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
          width: Device.orientation == Orientation.portrait
              ? DeviceExt(40).h
              : 50.w,
          padding: Device.orientation == Orientation.portrait
              ? EdgeInsets.symmetric(
                  horizontal: DeviceExt(0.8).h, vertical: 5.w)
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
            SizedBox(
                height: Device.orientation == Orientation.portrait
                    ? 2.4.w
                    : DeviceExt(2.4).h),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: CustomOutlinedButton(
                      text: "lbl_no".tr,
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
                      margin: EdgeInsets.only(
                          left: Device.orientation == Orientation.portrait
                              ? DeviceExt(1).h
                              : 1.w),
                      buttonTextStyle: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: Device.orientation == Orientation.portrait
                            ? DeviceExt(2).h
                            : DeviceExt(2.5).w,
                      ),
                      onTap: () {
                        onTapNo(context);
                      })),
              Expanded(
                  child: CustomElevatedButton(
                      text: "lbl_yes".tr,
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
