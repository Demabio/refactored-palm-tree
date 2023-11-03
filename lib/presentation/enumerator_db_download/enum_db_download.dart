import 'bloc/enum_db_download_bloc.dart';
import 'models/enum_db_download_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class EnumDbDownloadDialog extends StatelessWidget {
  const EnumDbDownloadDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<EnumDbDownloadBloc>(
      create: (context) => EnumDbDownloadBloc(EnumDbDownloadState(
        homeFarmerNotFoundModelObj: EnumDbDownloadModel(),
      ))
        ..add(EnumDbDownloadInitialEvent()),
      child: EnumDbDownloadDialog(),
    );
  }

//theme.colorScheme.primary
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: BlocBuilder<EnumDbDownloadBloc, EnumDbDownloadState>(
          builder: (context, state) {
        return Container(
          width: 330.h,
          padding: EdgeInsets.all(16.h),
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20.v),
              Visibility(
                visible: !state.failed && !state.success,
                child: Text(
                  !state.visibility
                      ? "Retrieve Previous Entries"
                      : "Downloading...",
                  style: CustomTextStyles.bodyLargePrimary_2,
                ),
              ),
              Visibility(
                visible: !state.failed && state.success,
                child: Text(
                  "Downloaded",
                  style: CustomTextStyles.bodyLargePrimary_2,
                ),
              ),
              SizedBox(height: 9.v),
              Visibility(
                visible: !state.visibility,
                child: SizedBox(
                  width: 200.h,
                  child: Text(
                    "This action will cause any entries entered to be lost. Only to be used when setting up on a new device, are you sure?",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumPoppinsBlack900.copyWith(
                      height: 1.57,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: state.failed,
                child: SizedBox(
                  width: 161.h,
                  child: Text(
                    "Download Failed, Retry?",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumPoppinsBlack900.copyWith(
                      height: 1.57,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 9.v),
              Visibility(
                visible: state.visibility,
                child: SizedBox(
                  width: 250.h,
                  height: 30.v,
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
              SizedBox(height: 9.v),
              Visibility(
                visible: state.visibility && !state.failed && !state.success,
                child: SizedBox(
                  width: 30.v,
                  height: 30.v,
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
                  width: 161.h,
                  child: Text(
                    "${state.percentagedone}%",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyLargePrimary_2,
                  ),
                ),
              ),
              // Visibility(
              //   visible: state.visibility,
              //   child: SizedBox(
              //     width: 161.h,
              //     child: Text(
              //       "Count ${state.count}",
              //       maxLines: 1,
              //       overflow: TextOverflow.ellipsis,
              //       textAlign: TextAlign.center,
              //       style: CustomTextStyles.bodyMediumPoppinsBlack900.copyWith(
              //         height: 1.57,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 21.v),
              SizedBox(
                height: 50.v,
                child: CustomElevatedButton(
                  text: "Download",
                  margin: EdgeInsets.only(left: 4.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                  buttonTextStyle: CustomTextStyles.bodyLarge16,
                  onTap: () => onTapDonwload(context, state),
                  isDisabled: state.visibility && !state.failed,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: CustomOutlinedButton(
              //         text: "lbl_no".tr,
              //         margin: EdgeInsets.only(right: 4.h),
              //         onTap: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //     ),
              //     Expanded(
              //       child: CustomElevatedButton(
              //         text: "lbl_yes".tr,
              //         margin: EdgeInsets.only(left: 4.h),
              //         buttonStyle: CustomButtonStyles.fillPrimaryTL6,
              //         buttonTextStyle: CustomTextStyles.bodyLarge16,
              //         onTap: () => onTapadd(context, state),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 21.v),

              SizedBox(
                height: 50.v,
                child: CustomElevatedButton(
                  text: "Close",
                  margin: EdgeInsets.only(left: 4.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                  buttonTextStyle: CustomTextStyles.bodyLarge16,
                  onTap: () => closeDialog(context),
                  isDisabled: state.downing,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  onTapadd(BuildContext context, EnumDbDownloadState state) {
    context.read<EnumDbDownloadBloc>().add(FetchGetOrdersEvent());
    print(state.count);
  }

  onTapDonwload(BuildContext context, EnumDbDownloadState state) {
    context.read<EnumDbDownloadBloc>().add(InnitDBwithDataEvent(
          onSuccess: () {
            downloadComplete(context);
          },
          onFailed: () {
            downloadFailed(context);
          },
        ));
  }

  downloadComplete(BuildContext context) {
    context.read<EnumDbDownloadBloc>().add(InnitDBwithDataSuccessEvent());
  }

  downloadFailed(BuildContext context) {
    context.read<EnumDbDownloadBloc>().add(InnitDBwithDataFailedEvent());
  }

  closeDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
