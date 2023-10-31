import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/widgets/custom_column_checkboxes.dart';

import 'bloc/add_aquaculture_three_bloc.dart';
import 'models/add_aquaculture_three_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class AddAquacultureThreeDialog extends StatelessWidget {
  AddAquacultureThreeDialog({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAquacultureThreeBloc>(
      create: (context) => AddAquacultureThreeBloc(AddAquacultureThreeState(
        addAquacultureThreeModelObj: AddAquacultureThreeModel(),
      ))
        ..add(AddAquacultureThreeInitialEvent()),
      child: AddAquacultureThreeDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Form(
      key: _formKey,
      child: Container(
        width: 344.h,
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 15.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: Text(
              "msg_add_farm_structure".tr,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: BlocSelector<AddAquacultureThreeBloc,
                    AddAquacultureThreeState, AddAquacultureThreeModel?>(
                  selector: (state) => state.addAquacultureThreeModelObj,
                  builder: (context, addRearedLivestockDialogTwoModelObj) {
                    return Column(
                      children: List<Widget>.generate(
                        addRearedLivestockDialogTwoModelObj?.models.length ?? 0,
                        (index) {
                          CheckBoxList model =
                              addRearedLivestockDialogTwoModelObj
                                      ?.models[index] ??
                                  CheckBoxList();

                          return CBListWidget(
                            model,
                            onSelect: (value) {
                              context.read<AddAquacultureThreeBloc>().add(
                                  ChangeCheckbox(
                                      value: index, selected: value));
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          BlocSelector<AddAquacultureThreeBloc, AddAquacultureThreeState,
              AddAquacultureThreeModel?>(
            selector: (state) => state.addAquacultureThreeModelObj,
            builder: (context, addRearedLivestockDialogOneModelObj) {
              return Padding(
                padding: EdgeInsets.fromLTRB(ResponsiveExtension(5).h, 44.v,
                    ResponsiveExtension(4).h, 16.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      width: ResponsiveExtension(95).h,
                      text: "lbl_reset".tr,
                      buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                      buttonTextStyle: CustomTextStyles.bodyLarge16,
                      onTap: () {
                        context.read<AddAquacultureThreeBloc>().add(ResetCBs());
                      },
                    ),
                    CustomElevatedButton(
                      width: ResponsiveExtension(95).h,
                      text: "lbl_add".tr,
                      buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                      buttonTextStyle: CustomTextStyles.bodyLarge16,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AddAquacultureThreeBloc>().add(AddCBs(
                                models:
                                    addRearedLivestockDialogOneModelObj!.models,
                                createSuccessful: () {
                                  _success(context);
                                },
                                createFailed: () {
                                  _failed(context);
                                },
                              ));
                        }
                      },
                    ),
                    CustomOutlinedButton(
                      width: ResponsiveExtension(95).h,
                      text: "lbl_close".tr,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ]),
      ),
    );
  }

  _success(BuildContext context) {
    Navigator.pop(context);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  }
}
