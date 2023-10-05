import 'bloc/primary_farm_holding_two_bloc.dart';
import 'models/primary_farm_holding_two_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

class PrimaryFarmHoldingTwoScreen extends StatelessWidget {
  const PrimaryFarmHoldingTwoScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PrimaryFarmHoldingTwoBloc>(
        create: (context) => PrimaryFarmHoldingTwoBloc(
            PrimaryFarmHoldingTwoState(
                primaryFarmHoldingTwoModelObj: PrimaryFarmHoldingTwoModel()))
          ..add(PrimaryFarmHoldingTwoInitialEvent()),
        child: PrimaryFarmHoldingTwoScreen());
  }

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
                title: AppbarSubtitle1(text: "msg_primary_farm_holding".tr),
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
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 14.h, top: 15.v),
                                  child: Text("msg_main_farm_enterprises".tr,
                                      style: CustomTextStyles
                                          .titleMediumSemiBold)),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 14.h, top: 16.v),
                                  child: Row(children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 1.v),
                                        child: Text("lbl_accuracy".tr,
                                            style: CustomTextStyles
                                                .labelLargePrimary)),
                                    Padding(
                                        padding: EdgeInsets.only(left: 87.h),
                                        child: Text("lbl_20_00".tr,
                                            style: CustomTextStyles
                                                .labelLargePrimary))
                                  ])),
                              SizedBox(height: 15.v),
                              Row(children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_longitude2".tr,
                                          style: CustomTextStyles
                                              .labelMediumPrimary_1),
                                      BlocSelector<
                                              PrimaryFarmHoldingTwoBloc,
                                              PrimaryFarmHoldingTwoState,
                                              TextEditingController?>(
                                          selector: (state) =>
                                              state.titleoneController,
                                          builder:
                                              (context, titleoneController) {
                                            return CustomTextFormField(
                                                width: 95.h,
                                                controller: titleoneController,
                                                hintText: "lbl_longitude3".tr,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.h,
                                                        vertical: 11.v));
                                          })
                                    ]),
                                Padding(
                                    padding: EdgeInsets.only(left: 13.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("lbl_latitude2".tr,
                                              style: CustomTextStyles
                                                  .labelMediumPrimary_1),
                                          BlocSelector<
                                                  PrimaryFarmHoldingTwoBloc,
                                                  PrimaryFarmHoldingTwoState,
                                                  TextEditingController?>(
                                              selector: (state) =>
                                                  state.titlethreeController,
                                              builder: (context,
                                                  titlethreeController) {
                                                return CustomTextFormField(
                                                    width: 95.h,
                                                    controller:
                                                        titlethreeController,
                                                    hintText:
                                                        "lbl_latitude3".tr,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.h,
                                                            vertical: 11.v));
                                              })
                                        ])),
                                CustomElevatedButton(
                                    height: 64.v,
                                    width: 95.h,
                                    text: "lbl_set_location".tr,
                                    margin: EdgeInsets.only(left: 45.h),
                                    buttonTextStyle: CustomTextStyles
                                        .bodySmallPoppinsWhiteA700,
                                    onTap: () {
                                      onTapSetlocation(context);
                                    })
                              ]),
                              SizedBox(height: 37.v),
                              Text("msg_legal_status_of2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState,
                                      PrimaryFarmHoldingTwoModel?>(
                                  selector: (state) =>
                                      state.primaryFarmHoldingTwoModelObj,
                                  builder:
                                      (context, primaryFarmHoldingTwoModelObj) {
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
                                        items: primaryFarmHoldingTwoModelObj
                                                ?.dropdownItemList ??
                                            [],
                                        onChanged: (value) {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(ChangeDropDownEvent(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 37.v),
                              Text("msg_lr_no_certificate_lease2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState,
                                      TextEditingController?>(
                                  selector: (state) =>
                                      state.titlesevenController,
                                  builder: (context, titlesevenController) {
                                    return CustomTextFormField(
                                        controller: titlesevenController,
                                        hintText: "lbl_info".tr,
                                        textInputAction: TextInputAction.done);
                                  }),
                              SizedBox(height: 37.v),
                              Text("msg_do_you_have_another2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState,
                                      PrimaryFarmHoldingTwoModel?>(
                                  selector: (state) =>
                                      state.primaryFarmHoldingTwoModelObj,
                                  builder:
                                      (context, primaryFarmHoldingTwoModelObj) {
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
                                        items: primaryFarmHoldingTwoModelObj
                                                ?.dropdownItemList1 ??
                                            [],
                                        onChanged: (value) {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(ChangeDropDown1Event(
                                                  value: value));
                                        });
                                  }),
                              Container(
                                  width: 266.h,
                                  margin: EdgeInsets.only(
                                      left: 14.h, top: 13.v, right: 60.h),
                                  child: Text("msg_what_enterprises".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles
                                          .labelMediumPrimary_1)),
                              SizedBox(height: 12.v),
                              BlocSelector<PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState, bool?>(
                                  selector: (state) => state.aquacultureForS,
                                  builder: (context, aquacultureForS) {
                                    return CustomCheckboxButton(
                                        text: "msg_aquaculture_for".tr,
                                        value: aquacultureForS,
                                        onChange: (value) {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(ChangeCheckBoxEvent(
                                                  value: value));
                                        });
                                  }),
                              BlocSelector<PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState, bool?>(
                                  selector: (state) => state.trash,
                                  builder: (context, trash) {
                                    return CustomCheckboxButton(
                                        text: "msg_aquaculture_for2".tr,
                                        value: trash,
                                        margin: EdgeInsets.only(
                                            top: 16.v, right: 80.h),
                                        onChange: (value) {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(ChangeCheckBox1Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 16.v),
                              BlocSelector<PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState, bool?>(
                                  selector: (state) => state.growingCropsFor,
                                  builder: (context, growingCropsFor) {
                                    return CustomCheckboxButton(
                                        text: "msg_growing_crops_for3".tr,
                                        value: growingCropsFor,
                                        onChange: (value) {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(ChangeCheckBox2Event(
                                                  value: value));
                                        });
                                  }),
                              BlocSelector<PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState, bool?>(
                                  selector: (state) => state.trashone,
                                  builder: (context, trashone) {
                                    return CustomCheckboxButton(
                                        text: "msg_growing_crops_for4".tr,
                                        value: trashone,
                                        margin: EdgeInsets.only(
                                            top: 16.v, right: 63.h),
                                        onChange: (value) {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(ChangeCheckBox3Event(
                                                  value: value));
                                        });
                                  }),
                              BlocSelector<PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState, bool?>(
                                  selector: (state) => state.trashtwo,
                                  builder: (context, trashtwo) {
                                    return CustomCheckboxButton(
                                        text: "msg_rearing_livestock".tr,
                                        value: trashtwo,
                                        margin: EdgeInsets.only(
                                            top: 16.v, right: 97.h),
                                        onChange: (value) {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(ChangeCheckBox4Event(
                                                  value: value));
                                        });
                                  }),
                              BlocSelector<PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState, bool?>(
                                  selector: (state) => state.trashthree,
                                  builder: (context, trashthree) {
                                    return CustomCheckboxButton(
                                        text: "msg_rearing_livestock2".tr,
                                        value: trashthree,
                                        margin: EdgeInsets.only(
                                            top: 16.v, right: 42.h),
                                        onChange: (value) {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(ChangeCheckBox5Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 16.v),
                              BlocSelector<PrimaryFarmHoldingTwoBloc,
                                      PrimaryFarmHoldingTwoState, bool?>(
                                  selector: (state) => state.treeFarming,
                                  builder: (context, treeFarming) {
                                    return CustomCheckboxButton(
                                        text: "lbl_tree_farming".tr,
                                        value: treeFarming,
                                        onChange: (value) {
                                          context
                                              .read<PrimaryFarmHoldingTwoBloc>()
                                              .add(ChangeCheckBox6Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 12.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: CustomOutlinedButton(
                                            text: "lbl_back".tr,
                                            margin: EdgeInsets.only(right: 1.h),
                                            buttonStyle: CustomButtonStyles
                                                .outlinePrimary,
                                            buttonTextStyle: CustomTextStyles
                                                .bodyLargePrimary_2,
                                            onTap: () {
                                              onTapBack(context);
                                            })),
                                    Expanded(
                                        child: CustomElevatedButton(
                                            text: "lbl_next".tr,
                                            margin: EdgeInsets.only(left: 1.h),
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryTL10))
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

  /// Navigates to the primaryFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingOneScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.primaryFarmHoldingOneScreen,
    );
  }

  /// Navigates to the mapScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the mapScreen.
  onTapSetlocation(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mapScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingOneScreen.
  onTapBack(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.primaryFarmHoldingOneScreen,
    );
  }

  /// Navigates to the primaryFarmHoldingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the primaryFarmHoldingScreen.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.primaryFarmHoldingScreen,
    );
  }
}
