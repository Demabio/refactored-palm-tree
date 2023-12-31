import 'bloc/add_liverstockinput_bloc.dart';
import 'models/add_liverstockinput_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class AddLiverstockinputScreen extends StatelessWidget {
  AddLiverstockinputScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddLiverstockinputBloc>(
      create: (context) => AddLiverstockinputBloc(AddLiverstockinputState(
        addLiverstockinputModelObj: AddLiverstockinputModel(),
      ))
        ..add(AddLiverstockinputInitialEvent()),
      child: AddLiverstockinputScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            leadingWidth: DeviceExt((60 / 841) * 100).h,
            leading: AppbarImage(
              onTap: () => goBack(context),
              svgPath: ImageConstant.imgSort,
              margin: EdgeInsets.only(
                left: DeviceExt((16 / 841) * 100).h,
                top: DeviceExt((3 / 411) * 100).w,
                bottom: DeviceExt((11 / 411) * 100).w,
              ),
            ),
            centerTitle: true,
            title: AppbarSubtitle1(
              text: "Livestock Input".tr,
            ),
            styleType: Style.bgFill,
          ),
          body: Form(
            key: _formKey,
            child: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: DeviceExt((27 / 411) * 100).w),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: DeviceExt((16 / 841) * 100).h,
                    right: DeviceExt((16 / 841) * 100).h,
                    bottom: DeviceExt((5 / 411) * 100).w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "msg_do_you_utilize_fertilizer2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<AddLiverstockinputBloc,
                          AddLiverstockinputState, AddLiverstockinputModel?>(
                        selector: (state) => state.addLiverstockinputModelObj,
                        builder: (context, addLiverstockinputModelObj) {
                          return CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(
                                  left: DeviceExt((30 / 841) * 100).h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DeviceExt((10 / 841) * 100).h,
                                ),
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPrimary,
                              ),
                            ),
                            hintText: "lbl_select".tr,
                            validator: (value) {
                              if (value == null) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            val: addLiverstockinputModelObj
                                ?.selectedDropDownValue1,
                            items:
                                addLiverstockinputModelObj?.dropdownItemList1 ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddLiverstockinputBloc>()
                                  .add(ChangeDropDown1Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((9 / 411) * 100).w),
                      Text(
                        "msg_do_you_utilize_fodder2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<AddLiverstockinputBloc,
                          AddLiverstockinputState, AddLiverstockinputModel?>(
                        selector: (state) => state.addLiverstockinputModelObj,
                        builder: (context, addLiverstockinputModelObj) {
                          return CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(
                                  left: DeviceExt((30 / 841) * 100).h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DeviceExt((10 / 841) * 100).h,
                                ),
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPrimary,
                              ),
                            ),
                            hintText: "lbl_select".tr,
                            validator: (value) {
                              if (value == null) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            val: addLiverstockinputModelObj
                                ?.selectedDropDownValue2,
                            items:
                                addLiverstockinputModelObj?.dropdownItemList2 ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddLiverstockinputBloc>()
                                  .add(ChangeDropDown2Event(value: value));
                            },
                          );
                        },
                      ),
                      Container(
                        width: DeviceExt((337 / 841) * 100).h,
                        margin: EdgeInsets.only(
                          top: DeviceExt((9 / 411) * 100).w,
                          right: DeviceExt((5 / 841) * 100).h,
                        ),
                        child: Text(
                          "msg_which_assisted_reproductive".tr,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelMediumPrimary_1,
                        ),
                      ),
                      SizedBox(height: DeviceExt((7 / 411) * 100).w),
                      Text(
                        "msg_artificial_insemination2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<AddLiverstockinputBloc,
                          AddLiverstockinputState, AddLiverstockinputModel?>(
                        selector: (state) => state.addLiverstockinputModelObj,
                        builder: (context, addLiverstockinputModelObj) {
                          return CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(
                                  left: DeviceExt((30 / 841) * 100).h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DeviceExt((10 / 841) * 100).h,
                                ),
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPrimary,
                              ),
                            ),
                            hintText: "lbl_select".tr,
                            validator: (value) {
                              if (value == null) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            val: addLiverstockinputModelObj
                                ?.selectedDropDownValue3,
                            items:
                                addLiverstockinputModelObj?.dropdownItemList3 ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddLiverstockinputBloc>()
                                  .add(ChangeDropDown3Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((9 / 411) * 100).w),
                      Text(
                        "msg_animal_hormones".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<AddLiverstockinputBloc,
                          AddLiverstockinputState, AddLiverstockinputModel?>(
                        selector: (state) => state.addLiverstockinputModelObj,
                        builder: (context, addLiverstockinputModelObj) {
                          return CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(
                                  left: DeviceExt((30 / 841) * 100).h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DeviceExt((10 / 841) * 100).h,
                                ),
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPrimary,
                              ),
                            ),
                            hintText: "lbl_select".tr,
                            validator: (value) {
                              if (value == null) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            val: addLiverstockinputModelObj
                                ?.selectedDropDownValue4,
                            items:
                                addLiverstockinputModelObj?.dropdownItemList4 ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddLiverstockinputBloc>()
                                  .add(ChangeDropDown4Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((9 / 411) * 100).w),
                      Text(
                        "msg_embryo_transfer".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<AddLiverstockinputBloc,
                          AddLiverstockinputState, AddLiverstockinputModel?>(
                        selector: (state) => state.addLiverstockinputModelObj,
                        builder: (context, addLiverstockinputModelObj) {
                          return CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(
                                  left: DeviceExt((30 / 841) * 100).h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DeviceExt((10 / 841) * 100).h,
                                ),
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPrimary,
                              ),
                            ),
                            hintText: "lbl_select".tr,
                            validator: (value) {
                              if (value == null) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            val: addLiverstockinputModelObj
                                ?.selectedDropDownValue5,
                            items:
                                addLiverstockinputModelObj?.dropdownItemList5 ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddLiverstockinputBloc>()
                                  .add(ChangeDropDown5Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((10 / 411) * 100).w),
                      Text(
                        "msg_which_animal_health".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      SizedBox(height: DeviceExt((29 / 411) * 100).w),
                      Text(
                        "msg_routine_vaccination2".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<AddLiverstockinputBloc,
                          AddLiverstockinputState, AddLiverstockinputModel?>(
                        selector: (state) => state.addLiverstockinputModelObj,
                        builder: (context, addLiverstockinputModelObj) {
                          return CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(
                                  left: DeviceExt((30 / 841) * 100).h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DeviceExt((10 / 841) * 100).h,
                                ),
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPrimary,
                              ),
                            ),
                            hintText: "lbl_select".tr,
                            validator: (value) {
                              if (value == null) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            val: addLiverstockinputModelObj
                                ?.selectedDropDownValue6,
                            items:
                                addLiverstockinputModelObj?.dropdownItemList6 ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddLiverstockinputBloc>()
                                  .add(ChangeDropDown6Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((9 / 411) * 100).w),
                      Text(
                        "msg_disease_control".tr,
                        style: CustomTextStyles.labelMediumPrimary_1,
                      ),
                      BlocSelector<AddLiverstockinputBloc,
                          AddLiverstockinputState, AddLiverstockinputModel?>(
                        selector: (state) => state.addLiverstockinputModelObj,
                        builder: (context, addLiverstockinputModelObj) {
                          return CustomDropDown(
                            icon: Container(
                              margin: EdgeInsets.only(
                                  left: DeviceExt((30 / 841) * 100).h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  DeviceExt((10 / 841) * 100).h,
                                ),
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdownPrimary,
                              ),
                            ),
                            hintText: "lbl_select".tr,
                            validator: (value) {
                              if (value == null) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            val: addLiverstockinputModelObj
                                ?.selectedDropDownValue7,
                            items:
                                addLiverstockinputModelObj?.dropdownItemList7 ??
                                    [],
                            onChanged: (value) {
                              context
                                  .read<AddLiverstockinputBloc>()
                                  .add(ChangeDropDown7Event(value: value));
                            },
                          );
                        },
                      ),
                      SizedBox(height: DeviceExt((51 / 411) * 100).w),
                      CustomElevatedButton(
                        text: "lbl_save".tr,
                        onTap: () => saveDraft(context),
                        leftIcon: Container(
                          margin: EdgeInsets.only(
                              right: DeviceExt((10 / 841) * 100).h),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgSaveWhiteA700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  nextPage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddLiverstockinputBloc>().add(
            NextTapEvent(
              createSuccessful: () {
                _success(context);
              },
              createFailed: () {
                _failed(context);
              },
            ),
          );
    }
  }

  _success(BuildContext context) {
    NavigatorService.popAndPushNamed(AppRoutes.livestockOneTabContainerScreen);
  }

  void _failed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Something went wrong, Kindly confirm all fields are filled.")));
  }

  saveDraft(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddLiverstockinputBloc>().add(
            SaveTapEvent(
              createSuccessful: () {
                _successSaved(context);
              },
              createFailed: () {
                _failed(context);
              },
            ),
          );
    }
  }

  _successSaved(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationScreen);
    Navigator.popAndPushNamed(
        context, AppRoutes.livestockOneTabContainerScreen);
  }

  goBack(BuildContext context) {
    //  NavigatorService.popAndPushNamed(AppRoutes.farmersIdentificationOneScreen);
    Navigator.popAndPushNamed(
        context, AppRoutes.livestockOneTabContainerScreen);
  }
}
