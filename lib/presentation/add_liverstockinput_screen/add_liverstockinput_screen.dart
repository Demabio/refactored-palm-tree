import 'bloc/add_liverstockinput_bloc.dart';
import 'models/add_liverstockinput_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

class AddLiverstockinputScreen extends StatelessWidget {
  const AddLiverstockinputScreen({Key? key})
      : super(
          key: key,
        );

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

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leadingWidth: 60.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgSort,
            margin: EdgeInsets.only(
              left: 16.h,
              top: 3.v,
              bottom: 11.v,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle1(
            text: "msg_add_livestock_input".tr,
          ),
          styleType: Style.bgFill,
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 27.v),
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                right: 16.h,
                bottom: 5.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_area_unit2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddLiverstockinputBloc, AddLiverstockinputState,
                      AddLiverstockinputModel?>(
                    selector: (state) => state.addLiverstockinputModelObj,
                    builder: (context, addLiverstockinputModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addLiverstockinputModelObj?.dropdownItemList ?? [],
                        onChanged: (value) {
                          context
                              .read<AddLiverstockinputBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "msg_do_you_utilize_fertilizer2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddLiverstockinputBloc, AddLiverstockinputState,
                      AddLiverstockinputModel?>(
                    selector: (state) => state.addLiverstockinputModelObj,
                    builder: (context, addLiverstockinputModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addLiverstockinputModelObj?.dropdownItemList1 ?? [],
                        onChanged: (value) {
                          context
                              .read<AddLiverstockinputBloc>()
                              .add(ChangeDropDown1Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "msg_do_you_utilize_fodder2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddLiverstockinputBloc, AddLiverstockinputState,
                      AddLiverstockinputModel?>(
                    selector: (state) => state.addLiverstockinputModelObj,
                    builder: (context, addLiverstockinputModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addLiverstockinputModelObj?.dropdownItemList2 ?? [],
                        onChanged: (value) {
                          context
                              .read<AddLiverstockinputBloc>()
                              .add(ChangeDropDown2Event(value: value));
                        },
                      );
                    },
                  ),
                  Container(
                    width: 337.h,
                    margin: EdgeInsets.only(
                      top: 9.v,
                      right: 5.h,
                    ),
                    child: Text(
                      "msg_which_assisted_reproductive".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Text(
                    "msg_artificial_insemination2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddLiverstockinputBloc, AddLiverstockinputState,
                      AddLiverstockinputModel?>(
                    selector: (state) => state.addLiverstockinputModelObj,
                    builder: (context, addLiverstockinputModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addLiverstockinputModelObj?.dropdownItemList3 ?? [],
                        onChanged: (value) {
                          context
                              .read<AddLiverstockinputBloc>()
                              .add(ChangeDropDown3Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "msg_animal_hormones".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddLiverstockinputBloc, AddLiverstockinputState,
                      AddLiverstockinputModel?>(
                    selector: (state) => state.addLiverstockinputModelObj,
                    builder: (context, addLiverstockinputModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addLiverstockinputModelObj?.dropdownItemList4 ?? [],
                        onChanged: (value) {
                          context
                              .read<AddLiverstockinputBloc>()
                              .add(ChangeDropDown4Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "msg_embryo_transfer".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddLiverstockinputBloc, AddLiverstockinputState,
                      AddLiverstockinputModel?>(
                    selector: (state) => state.addLiverstockinputModelObj,
                    builder: (context, addLiverstockinputModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addLiverstockinputModelObj?.dropdownItemList5 ?? [],
                        onChanged: (value) {
                          context
                              .read<AddLiverstockinputBloc>()
                              .add(ChangeDropDown5Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    "msg_which_animal_health".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 29.v),
                  Text(
                    "msg_routine_vaccination2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddLiverstockinputBloc, AddLiverstockinputState,
                      AddLiverstockinputModel?>(
                    selector: (state) => state.addLiverstockinputModelObj,
                    builder: (context, addLiverstockinputModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addLiverstockinputModelObj?.dropdownItemList6 ?? [],
                        onChanged: (value) {
                          context
                              .read<AddLiverstockinputBloc>()
                              .add(ChangeDropDown6Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "msg_disease_control".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<AddLiverstockinputBloc, AddLiverstockinputState,
                      AddLiverstockinputModel?>(
                    selector: (state) => state.addLiverstockinputModelObj,
                    builder: (context, addLiverstockinputModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.only(left: 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.h,
                            ),
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdownPrimary,
                          ),
                        ),
                        hintText: "lbl_select".tr,
                        items:
                            addLiverstockinputModelObj?.dropdownItemList7 ?? [],
                        onChanged: (value) {
                          context
                              .read<AddLiverstockinputBloc>()
                              .add(ChangeDropDown7Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 51.v),
                  CustomElevatedButton(
                    text: "lbl_save".tr,
                    leftIcon: Container(
                      margin: EdgeInsets.only(right: 10.h),
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
    );
  }
}
