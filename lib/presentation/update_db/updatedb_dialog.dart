import 'bloc/updatedb_bloc.dart';
import 'models/updatedb_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore_for_file: must_be_immutable
class UpdateDBDialog extends StatefulWidget {
  const UpdateDBDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<UpdateDBBloc>(
      create: (context) => UpdateDBBloc(UpdateDBState(
        homeFarmerNotFoundModelObj: UpdateDBModel(),
      ))
        ..add(UpdateDBInitialEvent()),
      child: UpdateDBDialog(),
    );
  }

  @override
  State<UpdateDBDialog> createState() => _UpdateDBDialogState();
}

class _UpdateDBDialogState extends State<UpdateDBDialog> {
  @override
  void initState() {
    super.initState();
    context.read<UpdateDBBloc>().add(InnitDBwithDataEvent(
          onSuccess: () {
            downloadComplete(context);
          },
          onFailed: () {
            downloadFailed(context);
          },
        ));

    context.read<UpdateDBBloc>().add(InnitDBwithDataEvent2(
          onSuccess2: () {
            downloadComplete2(context);
          },
          onFailed2: () {
            downloadFailed2(context);
          },
        ));
  }

//theme.colorScheme.primary
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child:
          BlocBuilder<UpdateDBBloc, UpdateDBState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            width: Device.orientation == Orientation.portrait
                ? DeviceExt(40).h
                : 50.w,
            padding: Device.orientation == Orientation.portrait
                ? EdgeInsets.symmetric(
                    horizontal: DeviceExt(0.8).h, vertical: 5.w)
                : EdgeInsets.symmetric(
                    horizontal: DeviceExt(1.8).w, vertical: DeviceExt(5).h),
            decoration: AppDecoration.fillWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    height: Device.orientation == Orientation.portrait
                        ? 2.4.w
                        : DeviceExt(2.4).h),
                Visibility(
                  visible: !state.failed &&
                      !state.success &&
                      !state.failed2 &&
                      !state.success2,
                  child: Text(
                    !state.visibility ? "Retry Update" : "Updating...",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                    ),
                  ),
                ),
                Visibility(
                  visible: !state.failed &&
                      state.success &&
                      !state.failed2 &&
                      state.success2,
                  child: Text(
                    "Updated",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                    ),
                  ),
                ),
                SizedBox(
                    height: Device.orientation == Orientation.portrait
                        ? 2.4.w
                        : DeviceExt(2.4).h),
                Visibility(
                  visible: !state.visibility,
                  child: SizedBox(
                    width: Device.orientation == Orientation.portrait
                        ? 19.w
                        : DeviceExt(19).h,
                    child: Text(
                      "Retry Database?",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontSize: Device.orientation == Orientation.portrait
                            ? DeviceExt(1.8).h
                            : DeviceExt(2).w,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !state.visibility2,
                  child: SizedBox(
                    width: Device.orientation == Orientation.portrait
                        ? 19.w
                        : DeviceExt(19).h,
                    child: Text(
                      "Retry Setups?",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontSize: Device.orientation == Orientation.portrait
                            ? DeviceExt(1.8).h
                            : DeviceExt(2).w,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: state.failed || state.failed2,
                  child: SizedBox(
                    width: Device.orientation == Orientation.portrait
                        ? 19.w
                        : DeviceExt(19).h,
                    child: Text(
                      "Update Failed, Retry?",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontSize: Device.orientation == Orientation.portrait
                            ? DeviceExt(1.8).h
                            : DeviceExt(2).w,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: Device.orientation == Orientation.portrait
                        ? 2.4.w
                        : DeviceExt(2.4).h),
                Visibility(
                  visible: state.visibility,
                  child: SizedBox(
                    width: Device.orientation == Orientation.portrait
                        ? DeviceExt(30).h
                        : DeviceExt(30).w,
                    height: Device.orientation == Orientation.portrait
                        ? 5.w
                        : DeviceExt(5).h,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),

                      semanticsLabel: "Progress",
                      semanticsValue: state.percentagedone.toString(),
                      value: state
                          .linebarvalue, // The value should be between 0.0 and 1.0, where 0.0 is 0% and 1.0 is 100%.
                      backgroundColor:
                          Colors.grey, // Background color of the progress bar.
                      valueColor: AlwaysStoppedAnimation<Color>(theme
                          .colorScheme.primary), // Color of the progress bar.
                    ),
                  ),
                ),
                SizedBox(
                    height: Device.orientation == Orientation.portrait
                        ? 2.4.w
                        : DeviceExt(2.4).h),
                Visibility(
                  visible: state.visibility && !state.failed && !state.success,
                  child: SizedBox(
                    width: Device.orientation == Orientation.portrait
                        ? 10.w
                        : DeviceExt(10).h,
                    height: Device.orientation == Orientation.portrait
                        ? 10.w
                        : DeviceExt(10).h,
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: state.visibility, child: SizedBox(height: 9.v)),
                Visibility(
                  visible: state.visibility,
                  child: SizedBox(
                    width: Device.orientation == Orientation.portrait
                        ? DeviceExt(30).h
                        : DeviceExt(30).w,
                    height: Device.orientation == Orientation.portrait
                        ? 10.w
                        : DeviceExt(10).h,
                    child: Text(
                      "Database update ${state.percentagedone}% Done",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: Device.orientation == Orientation.portrait
                            ? DeviceExt(1.8).h
                            : DeviceExt(2).w,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: state.visibility2,
                  child: SizedBox(
                    width: Device.orientation == Orientation.portrait
                        ? DeviceExt(30).h
                        : DeviceExt(30).w,
                    height: Device.orientation == Orientation.portrait
                        ? 5.w
                        : DeviceExt(5).h,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),

                      semanticsLabel: "Progress Setups",
                      semanticsValue: state.percentagedone2.toString(),
                      value: state
                          .linebarvalue2, // The value should be between 0.0 and 1.0, where 0.0 is 0% and 1.0 is 100%.
                      backgroundColor:
                          Colors.grey, // Background color of the progress bar.
                      valueColor: AlwaysStoppedAnimation<Color>(theme
                          .colorScheme.primary), // Color of the progress bar.
                    ),
                  ),
                ),
                SizedBox(
                    height: Device.orientation == Orientation.portrait
                        ? 2.4.w
                        : DeviceExt(2.4).h),
                Visibility(
                  visible:
                      state.visibility2 && !state.failed2 && !state.success2,
                  child: SizedBox(
                    width: Device.orientation == Orientation.portrait
                        ? 10.w
                        : DeviceExt(10).h,
                    height: Device.orientation == Orientation.portrait
                        ? 10.w
                        : DeviceExt(10).h,
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: state.visibility2, child: SizedBox(height: 9.v)),
                Visibility(
                  visible: state.visibility2,
                  child: SizedBox(
                    width: Device.orientation == Orientation.portrait
                        ? DeviceExt(30).h
                        : DeviceExt(30).w,
                    height: Device.orientation == Orientation.portrait
                        ? 10.w
                        : DeviceExt(10).h,
                    child: Text(
                      "Setups update ${state.percentagedone2}% done",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: Device.orientation == Orientation.portrait
                            ? DeviceExt(1.8).h
                            : DeviceExt(2).w,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: Device.orientation == Orientation.portrait
                        ? 5.w
                        : DeviceExt(5).h),
                CustomElevatedButton(
                  text: "Retry Database",
                  height: Device.orientation == Orientation.portrait
                      ? DeviceExt(6).h
                      : 8.w,
                  // width:
                  //     Device.orientation == Orientation.portrait
                  //         ? DeviceExt(50).h
                  //         : 50.w,

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
                  onTap: () => onTapDonwload(context, state),
                  isDisabled: state.visibility && !state.failed,
                ),
                SizedBox(
                    height: Device.orientation == Orientation.portrait
                        ? 5.w
                        : DeviceExt(5).h),
                CustomElevatedButton(
                  text: "Retry Setups",
                  height: Device.orientation == Orientation.portrait
                      ? DeviceExt(6).h
                      : 8.w,
                  // width:
                  //     Device.orientation == Orientation.portrait
                  //         ? DeviceExt(50).h
                  //         : 50.w,

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
                  onTap: () => onTapDonwload2(context, state),
                  isDisabled: state.visibility2 && !state.failed2,
                ),
                SizedBox(
                    height: Device.orientation == Orientation.portrait
                        ? 5.w
                        : DeviceExt(5).h),
                Visibility(
                  visible: !state.failed && state.success,
                  child: CustomElevatedButton(
                    text: "Close",
                    height: Device.orientation == Orientation.portrait
                        ? DeviceExt(6).h
                        : 8.w,
                    // width:
                    //     Device.orientation == Orientation.portrait
                    //         ? DeviceExt(50).h
                    //         : 50.w,

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
                    onTap: () => closeDialog(context),
                    isDisabled: !state.success,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  onTapadd(BuildContext context, UpdateDBState state) {
    context.read<UpdateDBBloc>().add(FetchGetOrdersEvent());
    print(state.count);
  }

  onTapDonwload(BuildContext context, UpdateDBState state) {
    context.read<UpdateDBBloc>().add(InnitDBwithDataEvent(
          onSuccess: () {
            downloadComplete(context);
          },
          onFailed: () {
            downloadFailed(context);
          },
        ));
  }

  onTapDonwload2(BuildContext context, UpdateDBState state) {
    context.read<UpdateDBBloc>().add(InnitDBwithDataEvent2(
          onSuccess2: () {
            downloadComplete2(context);
          },
          onFailed2: () {
            downloadFailed2(context);
          },
        ));
  }

  downloadComplete(BuildContext context) {
    context.read<UpdateDBBloc>().add(InnitDBwithDataSuccessEvent());
  }

  downloadFailed(BuildContext context) {
    context.read<UpdateDBBloc>().add(InnitDBwithDataFailedEvent());
  }

  downloadComplete2(BuildContext context) {
    context.read<UpdateDBBloc>().add(InnitDBwithDataSuccessEvent2());
  }

  downloadFailed2(BuildContext context) {
    context.read<UpdateDBBloc>().add(InnitDBwithDataFailedEvent2());
  }

  closeDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
