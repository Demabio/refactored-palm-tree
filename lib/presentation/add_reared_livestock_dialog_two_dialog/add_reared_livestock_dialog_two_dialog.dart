import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/widgets/age_group_widget.dart';
import 'package:sizer/sizer.dart';

import 'bloc/add_reared_livestock_dialog_two_bloc.dart';
import 'models/add_reared_livestock_dialog_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AddRearedLivestockDialogTwoDialog extends StatelessWidget {
  AddRearedLivestockDialogTwoDialog({Key? key})
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
      width: ResponsiveExtension(344).h,
      height: SizerExt(75).h,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveExtension(13).h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: BlocSelector<
                  AddRearedLivestockDialogTwoBloc,
                  AddRearedLivestockDialogTwoState,
                  AddRearedLivestockDialogTwoModel?>(
                selector: (state) => state.addRearedLivestockDialogTwoModelObj,
                builder: (context, addRearedLivestockDialogTwoModelObj) {
                  return Column(
                    children: List<Widget>.generate(
                      addRearedLivestockDialogTwoModelObj
                              ?.ageGroupmModels.length ??
                          0,
                      (index) {
                        AgeGroupmModel model =
                            addRearedLivestockDialogTwoModelObj
                                    ?.ageGroupmModels[index] ??
                                AgeGroupmModel();

                        return AgeGroupItemWidget(
                          model,
                          onSelect: (value) {
                            context
                                .read<AddRearedLivestockDialogTwoBloc>()
                                .add(ChangeAgeGroupCheckbox(
                                  value: index,
                                ));
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ]),
    );
  }
}
