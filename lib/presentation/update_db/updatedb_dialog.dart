import 'bloc/updatedb_bloc.dart';
import 'models/updatedb_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

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
                visible: !state.failed &&
                    !state.success &&
                    !state.failed2 &&
                    !state.success2,
                child: Text(
                  !state.visibility ? "Retry Update" : "Updating...",
                  style: CustomTextStyles.bodyLargePrimary_2,
                ),
              ),
              Visibility(
                visible: !state.failed &&
                    state.success &&
                    !state.failed2 &&
                    state.success2,
                child: Text(
                  "Updated",
                  style: CustomTextStyles.bodyLargePrimary_2,
                ),
              ),
              SizedBox(height: 9.v),
              Visibility(
                visible: !state.visibility,
                child: SizedBox(
                  width: 161.h,
                  child: Text(
                    "Retry Database?",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumPoppinsBlack900.copyWith(
                      height: 1.57,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !state.visibility2,
                child: SizedBox(
                  width: 161.h,
                  child: Text(
                    "Retry Setups?",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumPoppinsBlack900.copyWith(
                      height: 1.57,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: state.failed || state.failed2,
                child: SizedBox(
                  width: 161.h,
                  child: Text(
                    "Update Failed, Retry?",
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
                  width: 250.h,
                  child: Text(
                    "Database update ${state.percentagedone}% Done",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleSmall15,
                  ),
                ),
              ),
              Visibility(
                visible: state.visibility2,
                child: SizedBox(
                  width: 250.h,
                  height: 30.v,
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
              SizedBox(height: 9.v),
              Visibility(
                visible: state.visibility2 && !state.failed2 && !state.success2,
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
                  visible: state.visibility2, child: SizedBox(height: 9.v)),
              Visibility(
                visible: state.visibility2,
                child: SizedBox(
                  width: 250.h,
                  child: Text(
                    "Setups update ${state.percentagedone2}% done",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleSmall15,
                  ),
                ),
              ),
              SizedBox(height: 21.v),
              SizedBox(
                height: 50.v,
                child: CustomElevatedButton(
                  text: "Retry Database",
                  margin: EdgeInsets.only(left: 4.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                  buttonTextStyle: CustomTextStyles.bodyLarge16,
                  onTap: () => onTapDonwload(context, state),
                  isDisabled: state.visibility && !state.failed,
                ),
              ),
              SizedBox(height: 21.v),
              SizedBox(
                height: 50.v,
                child: CustomElevatedButton(
                  text: "Retry Setups",
                  margin: EdgeInsets.only(left: 4.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                  buttonTextStyle: CustomTextStyles.bodyLarge16,
                  onTap: () => onTapDonwload2(context, state),
                  isDisabled: state.visibility2 && !state.failed2,
                ),
              ),
              SizedBox(height: 21.v),
              Visibility(
                visible: !state.failed &&
                    state.success &&
                    !state.failed2 &&
                    state.success2,
                child: SizedBox(
                  height: 50.v,
                  child: CustomElevatedButton(
                    text: "Close",
                    margin: EdgeInsets.only(left: 4.h),
                    buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                    buttonTextStyle: CustomTextStyles.bodyLarge16,
                    onTap: () => closeDialog(context),
                    isDisabled: !state.success,
                  ),
                ),
              ),
            ],
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
    NavigatorService.popAndPushNamed(AppRoutes.homeScreen);
  }
}
