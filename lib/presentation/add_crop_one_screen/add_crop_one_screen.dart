import 'package:cupertino_stepper/cupertino_stepper.dart';

import '../add_crop_one_screen/widgets/chipviewalbert_item_widget.dart';
import 'bloc/add_crop_one_bloc.dart';
import 'models/add_crop_one_model.dart';
import 'models/chipviewalbert_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AddCropOneScreen extends StatelessWidget {
  AddCropOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AddCropOneBloc>(
        create: (context) => AddCropOneBloc(
            AddCropOneState(addCropOneModelObj: AddCropOneModel()))
          ..add(AddCropOneInitialEvent()),
        child: AddCropOneScreen());
  }

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();
  FocusNode node6 = FocusNode();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: 60.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgSort,
                    margin: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                    onTap: () {
                      onTapSortone(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_add_new_crop".tr),
                styleType: Style.bgFill),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 5.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocSelector<AddCropOneBloc, AddCropOneState,
                                      AddCropOneModel?>(
                                  selector: (state) => state.addCropOneModelObj,
                                  builder: ((context,
                                      farmersIdentificationOneModelObj) {
                                    return SizedBox(
                                      height: 150.v,
                                      width: double.infinity,
                                      child: _buildStepper(
                                          StepperType.horizontal,
                                          context,
                                          farmersIdentificationOneModelObj),
                                    );
                                  })),
                              Align(
                                  alignment: Alignment.center,
                                  child: BlocSelector<
                                          AddCropOneBloc,
                                          AddCropOneState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.searchController,
                                      builder: (context, searchController) {
                                        return CustomSearchView(
                                            margin: EdgeInsets.only(
                                                left: 13.h,
                                                top: 7.v,
                                                right: 18.h),
                                            controller: searchController,
                                            autofocus: false,
                                            focusNode: node1,
                                            hintText: "lbl_search_crop".tr,
                                            alignment: Alignment.center,
                                            prefix: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    15.h, 12.v, 9.h, 12.v),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgSearch)),
                                            prefixConstraints:
                                                BoxConstraints(maxHeight: 40.v),
                                            suffix: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15.h),
                                                child: IconButton(
                                                    onPressed: () {
                                                      searchController!.clear();
                                                    },
                                                    icon: Icon(Icons.clear,
                                                        color: Colors
                                                            .grey.shade600))));
                                      })),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 13.h, top: 7.v),
                                  child: Text("lbl_common_crops".tr,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1)),
                              SizedBox(height: 18.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: BlocSelector<AddCropOneBloc,
                                          AddCropOneState, AddCropOneModel?>(
                                      selector: (state) =>
                                          state.addCropOneModelObj,
                                      builder: (context, addCropOneModelObj) {
                                        return Wrap(
                                            runSpacing: 14.v,
                                            spacing: 14.h,
                                            children: List<Widget>.generate(
                                                addCropOneModelObj
                                                        ?.chipviewalbertItemList
                                                        .length ??
                                                    0, (index) {
                                              ChipviewalbertItemModel model =
                                                  addCropOneModelObj
                                                              ?.chipviewalbertItemList[
                                                          index] ??
                                                      ChipviewalbertItemModel();
                                              return ChipviewalbertItemWidget(
                                                  model,
                                                  onSelectedChipView: (value) {
                                                context
                                                    .read<AddCropOneBloc>()
                                                    .add(UpdateChipViewEvent(
                                                        index: index,
                                                        isSelected: value));
                                              });
                                            }));
                                      })),
                              SizedBox(height: 24.v),
                              Text("lbl_crop2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<AddCropOneBloc, AddCropOneState,
                                      AddCropOneModel?>(
                                  selector: (state) => state.addCropOneModelObj,
                                  builder: (context, addCropOneModelObj) {
                                    return CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.only(left: 30.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: addCropOneModelObj
                                                ?.dropdownItemList ??
                                            [],
                                        onChanged: (value) {
                                          context.read<AddCropOneBloc>().add(
                                              ChangeDropDownEvent(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 9.v),
                              Text("msg_total_acreage".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<AddCropOneBloc, AddCropOneState,
                                      TextEditingController?>(
                                  selector: (state) =>
                                      state.areavalueoneController,
                                  builder: (context, areavalueoneController) {
                                    return CustomTextFormField(
                                        autofocus: false,
                                        focusNode: node2,
                                        controller: areavalueoneController,
                                        hintText: "lbl_area".tr,
                                        textInputAction: TextInputAction.done);
                                  }),
                              SizedBox(height: 9.v),
                              Text("msg_unit_of_area".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<AddCropOneBloc, AddCropOneState,
                                      AddCropOneModel?>(
                                  selector: (state) => state.addCropOneModelObj,
                                  builder: (context, addCropOneModelObj) {
                                    return CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.only(left: 30.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: addCropOneModelObj
                                                ?.dropdownItemList1 ??
                                            [],
                                        onChanged: (value) {
                                          context.read<AddCropOneBloc>().add(
                                              ChangeDropDown1Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 9.v),
                              Text("msg_use_of_certified".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<AddCropOneBloc, AddCropOneState,
                                      AddCropOneModel?>(
                                  selector: (state) => state.addCropOneModelObj,
                                  builder: (context, addCropOneModelObj) {
                                    return CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.only(left: 30.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: addCropOneModelObj
                                                ?.dropdownItemList2 ??
                                            [],
                                        onChanged: (value) {
                                          context.read<AddCropOneBloc>().add(
                                              ChangeDropDown2Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 10.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: CustomOutlinedButton(
                                            text: "lbl_back".tr,
                                            margin: EdgeInsets.only(right: 1.h),
                                            buttonStyle: CustomButtonStyles
                                                .outlinePrimaryTL10,
                                            buttonTextStyle: CustomTextStyles
                                                .bodyLargePrimary_1)),
                                    Expanded(
                                        child: CustomElevatedButton(
                                            text: "lbl_next".tr,
                                            margin: EdgeInsets.only(left: 1.h),
                                            onTap: () {
                                              onTapNext(context);
                                            }))
                                  ]),
                              SizedBox(height: 12.v),
                              CustomElevatedButton(
                                  text: "lbl_save".tr,
                                  leftIcon: Container(
                                      margin: EdgeInsets.only(right: 10.h),
                                      child: CustomImageView(
                                          svgPath:
                                              ImageConstant.imgSaveWhiteA700)),
                                  onTap: () {
                                    onTapSave(context);
                                  })
                            ]))))));
  }

  CupertinoStepper _buildStepper(StepperType type, BuildContext context,
      AddCropOneModel? addCropOneModel) {
    final canCancel = addCropOneModel!.stepped > 0;
    final canContinue = addCropOneModel.stepped < 3;
    return CupertinoStepper(
      type: type,
      currentStep: addCropOneModel.stepped,
      onStepTapped: (step) {
        //Best place to save and get scope identity and store in pref
        //Validation checks

        // context
        //     .read<FarmersIdentificationFourBloc>()
        //     .add(OnSteppedEvent(value: step));

        //chosen
        onTapNextC(context, step);
      },
      onStepCancel: canCancel
          ? () {
              // context
              //     .read<FarmersIdentificationFourBloc>()
              //     .add(StepDownEvent());
              //Chosen
              onTapNextC(context, addCropOneModel.stepped - 1);
            }
          : null,
      onStepContinue: canContinue
          ? () {
              //   context.read<FarmersIdentificationFourBloc>().add(StepUpEvent());
              //Chosen
              onTapNextC(context, addCropOneModel.stepped + 1);
            }
          : null,
      steps: [
        _buildStep(
          title: Text('1'),
          state: addCropOneModel.page1!,
          addcallback: () {},
        ),
        _buildStep(
          title: Text('2'),
          state: addCropOneModel.page2!,
        ),
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
    VoidCallback? addcallback,
    VoidCallback? editcallback,
  }) {
    return Step(
      title: title,
      // subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
          maxWidth: double.infinity,
          maxHeight: 1,
          child: SizedBox(
            height: 1,
            width: 1,
          )),
    );
  }

  onTapNextC(BuildContext context, int step) {
    if (step == 0) {
      NavigatorService.popAndPushNamed(
        AppRoutes.primaryFarmHoldingOneScreen,
      );
      // } else if (step == 1) {
      //   NavigatorService.popAndPushNamed(
      //     AppRoutes.primaryFarmHoldingTwoScreen,
      //   );
      // } else if (step == 2) {
      //   NavigatorService.popAndPushNamed(
      //     AppRoutes.farmersIdentificationThreeScreen,
      //   );
    } else {
      NavigatorService.popAndPushNamed(
        AppRoutes.primaryFarmHoldingTwoScreen,
      );
    }
  }

  /// Navigates to the cropAgricultureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cropAgricultureScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cropAgricultureScreen,
    );
  }

  /// Navigates to the addCropTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addCropTwoScreen.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addCropTwoScreen,
    );
  }

  /// Navigates to the cropAgricultureScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cropAgricultureScreen.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cropAgricultureScreen,
    );
  }
}
