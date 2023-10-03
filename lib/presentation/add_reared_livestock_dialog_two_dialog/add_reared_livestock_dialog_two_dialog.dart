import 'bloc/add_reared_livestock_dialog_two_bloc.dart';
import 'models/add_reared_livestock_dialog_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AddRearedLivestockDialogTwoDialog extends StatelessWidget {
  const AddRearedLivestockDialogTwoDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddRearedLivestockDialogTwoBloc>(
      create: (context) =>
          AddRearedLivestockDialogTwoBloc(AddRearedLivestockDialogTwoState(
        addRearedLivestockDialogTwoModelObj: AddRearedLivestockDialogTwoModel(),
      ))
            ..add(AddRearedLivestockDialogTwoInitialEvent()),
      child: AddRearedLivestockDialogTwoDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 344.h,
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
    );
  }
}
