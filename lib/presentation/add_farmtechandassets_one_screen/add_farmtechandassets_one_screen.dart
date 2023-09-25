import 'bloc/add_farmtechandassets_one_bloc.dart';
import 'models/add_farmtechandassets_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

class AddFarmtechandassetsOneScreen extends StatelessWidget {
  const AddFarmtechandassetsOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFarmtechandassetsOneBloc>(
      create: (context) =>
          AddFarmtechandassetsOneBloc(AddFarmtechandassetsOneState(
        addFarmtechandassetsOneModelObj: AddFarmtechandassetsOneModel(),
      ))
            ..add(AddFarmtechandassetsOneInitialEvent()),
      child: AddFarmtechandassetsOneScreen(),
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
          title: AppbarSubtitle4(
            text: "msg_farm_technology3".tr,
          ),
          styleType: Style.bgFill,
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 8.v),
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
                    "msg_source_of_power2".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    "msg_what_types_of_aquaculture2".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  CustomElevatedButton(
                    text: "msg_add_powersource".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 65.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 33.v),
                  Text(
                    "lbl_labour_source2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddFarmtechandassetsOneBloc,
                      AddFarmtechandassetsOneState,
                      AddFarmtechandassetsOneModel?>(
                    selector: (state) => state.addFarmtechandassetsOneModelObj,
                    builder: (context, addFarmtechandassetsOneModelObj) {
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
                            addFarmtechandassetsOneModelObj?.dropdownItemList ??
                                [],
                        onChanged: (value) {
                          context
                              .read<AddFarmtechandassetsOneBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 33.v),
                  Text(
                    "msg_farmer_machinery2".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  CustomElevatedButton(
                    text: "msg_add_farmer_marchinery".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 106.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 33.v),
                  Text(
                    "msg_who_owns_most_of2".tr,
                    style: CustomTextStyles.labelMediumPrimary_1,
                  ),
                  BlocSelector<
                      AddFarmtechandassetsOneBloc,
                      AddFarmtechandassetsOneState,
                      AddFarmtechandassetsOneModel?>(
                    selector: (state) => state.addFarmtechandassetsOneModelObj,
                    builder: (context, addFarmtechandassetsOneModelObj) {
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
                        items: addFarmtechandassetsOneModelObj
                                ?.dropdownItemList1 ??
                            [],
                        onChanged: (value) {
                          context
                              .read<AddFarmtechandassetsOneBloc>()
                              .add(ChangeDropDown1Event(value: value));
                        },
                      );
                    },
                  ),
                  SizedBox(height: 33.v),
                  Text(
                    "msg_which_farm_structures2".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  CustomElevatedButton(
                    text: "msg_add_aquatic_species".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 106.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 34.v),
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
