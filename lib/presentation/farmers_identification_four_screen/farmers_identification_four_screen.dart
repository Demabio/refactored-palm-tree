import 'bloc/farmers_identification_four_bloc.dart';
import 'models/farmers_identification_four_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';

class FarmersIdentificationFourScreen extends StatelessWidget {
  const FarmersIdentificationFourScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FarmersIdentificationFourBloc>(
        create: (context) => FarmersIdentificationFourBloc(
            FarmersIdentificationFourState(
                farmersIdentificationFourModelObj:
                    FarmersIdentificationFourModel()))
          ..add(FarmersIdentificationFourInitialEvent()),
        child: FarmersIdentificationFourScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                leadingWidth: 60.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgSort,
                    margin: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                    onTap: () {
                      onTapSortone(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle1(text: "msg_farmers_identification".tr),
                styleType: Style.bgFill),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 9.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("msg_respondent_details".tr,
                                  style: CustomTextStyles.titleMediumSemiBold),
                              SizedBox(height: 18.v),
                              Text("msg_is_the_farmer_the".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationFourBloc,
                                      FarmersIdentificationFourState,
                                      FarmersIdentificationFourModel?>(
                                  selector: (state) =>
                                      state.farmersIdentificationFourModelObj,
                                  builder: (context,
                                      farmersIdentificationFourModelObj) {
                                    return CustomDropDown(
                                        autofocus: false,
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 10.v, 9.h, 15.v),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: farmersIdentificationFourModelObj
                                                ?.dropdownItemList ??
                                            [],
                                        onChanged: (value) {
                                          context
                                              .read<
                                                  FarmersIdentificationFourBloc>()
                                              .add(ChangeDropDownEvent(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 19.v),
                              Text("msg_relationship_to".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationFourBloc,
                                      FarmersIdentificationFourState,
                                      FarmersIdentificationFourModel?>(
                                  selector: (state) =>
                                      state.farmersIdentificationFourModelObj,
                                  builder: (context,
                                      farmersIdentificationFourModelObj) {
                                    return CustomDropDown(
                                        autofocus: false,
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 10.v, 9.h, 15.v),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: farmersIdentificationFourModelObj
                                                ?.dropdownItemList1 ??
                                            [],
                                        onChanged: (value) {
                                          context
                                              .read<
                                                  FarmersIdentificationFourBloc>()
                                              .add(ChangeDropDown1Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 21.v),
                              Text("lbl_production_type".tr,
                                  style: CustomTextStyles.titleMediumSemiBold),
                              SizedBox(height: 18.v),
                              Text("msg_crop_production2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationFourBloc,
                                      FarmersIdentificationFourState,
                                      FarmersIdentificationFourModel?>(
                                  selector: (state) =>
                                      state.farmersIdentificationFourModelObj,
                                  builder: (context,
                                      farmersIdentificationFourModelObj) {
                                    return CustomDropDown(
                                        autofocus: false,
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 10.v, 9.h, 15.v),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: farmersIdentificationFourModelObj
                                                ?.dropdownItemList2 ??
                                            [],
                                        onChanged: (value) {
                                          context
                                              .read<
                                                  FarmersIdentificationFourBloc>()
                                              .add(ChangeDropDown2Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 19.v),
                              Text("msg_livestock_production2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationFourBloc,
                                      FarmersIdentificationFourState,
                                      FarmersIdentificationFourModel?>(
                                  selector: (state) =>
                                      state.farmersIdentificationFourModelObj,
                                  builder: (context,
                                      farmersIdentificationFourModelObj) {
                                    return CustomDropDown(
                                        autofocus: false,
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 10.v, 9.h, 15.v),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: farmersIdentificationFourModelObj
                                                ?.dropdownItemList3 ??
                                            [],
                                        onChanged: (value) {
                                          context
                                              .read<
                                                  FarmersIdentificationFourBloc>()
                                              .add(ChangeDropDown3Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 19.v),
                              Text("msg_aquaculture_production2".tr,
                                  style: CustomTextStyles.labelMediumPrimary_1),
                              BlocSelector<
                                      FarmersIdentificationFourBloc,
                                      FarmersIdentificationFourState,
                                      FarmersIdentificationFourModel?>(
                                  selector: (state) =>
                                      state.farmersIdentificationFourModelObj,
                                  builder: (context,
                                      farmersIdentificationFourModelObj) {
                                    return CustomDropDown(
                                        autofocus: false,
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 10.v, 9.h, 15.v),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.h)),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdownPrimary)),
                                        hintText: "lbl_select".tr,
                                        items: farmersIdentificationFourModelObj
                                                ?.dropdownItemList4 ??
                                            [],
                                        onChanged: (value) {
                                          context
                                              .read<
                                                  FarmersIdentificationFourBloc>()
                                              .add(ChangeDropDown4Event(
                                                  value: value));
                                        });
                                  }),
                              SizedBox(height: 20.v),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowback(context);
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: CustomOutlinedButton(
                                                text: "lbl_back".tr,
                                                margin:
                                                    EdgeInsets.only(right: 1.h),
                                                buttonStyle: CustomButtonStyles
                                                    .outlinePrimary,
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .bodyLargePrimary_2)),
                                        Expanded(
                                            child: CustomElevatedButton(
                                                text: "lbl_next".tr,
                                                margin:
                                                    EdgeInsets.only(left: 1.h),
                                                buttonStyle: CustomButtonStyles
                                                    .fillPrimaryTL10))
                                      ])),
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

  /// Navigates to the farmersIdentificationThreeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationThreeScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationThreeScreen,
    );
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapImgArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the farmersIdentificationThreeScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationThreeScreen.
  onTapRowback(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationThreeScreen,
    );
  }

  /// Navigates to the farmersIdentificationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmersIdentificationScreen.
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmersIdentificationScreen,
    );
  }
}
