import 'bloc/add_financialandservices_one_bloc.dart';
import 'models/add_financialandservices_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_drop_down.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_icon_button.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

class AddFinancialandservicesOneScreen extends StatelessWidget {
  const AddFinancialandservicesOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFinancialandservicesOneBloc>(
      create: (context) =>
          AddFinancialandservicesOneBloc(AddFinancialandservicesOneState(
        addFinancialandservicesOneModelObj: AddFinancialandservicesOneModel(),
      ))
            ..add(AddFinancialandservicesOneInitialEvent()),
      child: AddFinancialandservicesOneScreen(),
    );
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
            margin: EdgeInsets.only(
              left: 16.h,
              top: 3.v,
              bottom: 11.v,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle4(
            text: "msg_financial_and_services2".tr,
          ),
          styleType: Style.bgFill,
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 5.v),
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                right: 16.h,
                bottom: 5.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 69.h),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomIconButton(
                                    height: 31.v,
                                    width: 32.h,
                                    padding: EdgeInsets.all(8.h),
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgCheckmark,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 16.v,
                                      bottom: 13.v,
                                    ),
                                    child: SizedBox(
                                      width: 54.h,
                                      child: Divider(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 6.v),
                            Text(
                              "lbl_step_1".tr,
                              style: CustomTextStyles.bodyLargeBluegray40003,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 16.v,
                                    bottom: 13.v,
                                  ),
                                  child: SizedBox(
                                    width: 54.h,
                                    child: Divider(),
                                  ),
                                ),
                                CustomIconButton(
                                  height: 31.v,
                                  width: 32.h,
                                  padding: EdgeInsets.all(8.h),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgCheckmark,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.v),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "lbl_step_2".tr,
                                style: CustomTextStyles.bodyLargeBluegray40003,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    "msg_financial_livelihood".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Container(
                    width: 297.h,
                    margin: EdgeInsets.only(
                      top: 20.v,
                      right: 45.h,
                    ),
                    child: Text(
                      "msg_what_are_your_main4".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "msg_add_financial_source".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 42.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  Container(
                    width: 306.h,
                    margin: EdgeInsets.only(
                      top: 17.v,
                      right: 36.h,
                    ),
                    child: Text(
                      "msg_percentage_of_household2".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelMediumPrimary_1,
                    ),
                  ),
                  SizedBox(height: 4.v),
                  BlocSelector<AddFinancialandservicesOneBloc,
                      AddFinancialandservicesOneState, TextEditingController?>(
                    selector: (state) => state.selectvalueoneController,
                    builder: (context, selectvalueoneController) {
                      return CustomTextFormField(
                        controller: selectvalueoneController,
                        hintText: "lbl_select".tr,
                        textInputAction: TextInputAction.done,
                      );
                    },
                  ),
                  SizedBox(height: 18.v),
                  Text(
                    "msg_cooperative_groups".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Container(
                    width: 270.h,
                    margin: EdgeInsets.only(
                      top: 17.v,
                      right: 72.h,
                    ),
                    child: Text(
                      "msg_do_you_belong_to2".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelMediumPrimary_1,
                    ),
                  ),
                  SizedBox(height: 3.v),
                  BlocSelector<
                      AddFinancialandservicesOneBloc,
                      AddFinancialandservicesOneState,
                      AddFinancialandservicesOneModel?>(
                    selector: (state) =>
                        state.addFinancialandservicesOneModelObj,
                    builder: (context, addFinancialandservicesOneModelObj) {
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
                        items: addFinancialandservicesOneModelObj
                                ?.dropdownItemList ??
                            [],
                        onChanged: (value) {
                          context
                              .read<AddFinancialandservicesOneBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        },
                      );
                    },
                  ),
                  Container(
                    width: 302.h,
                    margin: EdgeInsets.only(
                      top: 15.v,
                      right: 40.h,
                    ),
                    child: Text(
                      "msg_if_yes_which_groups_farmer".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "msg_add_cooperative".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 34.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "msg_financial_services".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  Container(
                    width: 332.h,
                    margin: EdgeInsets.only(
                      top: 16.v,
                      right: 11.h,
                    ),
                    child: Text(
                      "msg_where_do_you_access".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  CustomElevatedButton(
                    text: "msg_add_financial_services".tr,
                    margin: EdgeInsets.only(
                      left: 82.h,
                      top: 37.v,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 18.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomOutlinedButton(
                          text: "lbl_back".tr,
                          margin: EdgeInsets.only(right: 1.h),
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                          buttonTextStyle: CustomTextStyles.bodyLargePrimary_1,
                        ),
                      ),
                      Expanded(
                        child: CustomElevatedButton(
                          text: "lbl_next".tr,
                          margin: EdgeInsets.only(left: 1.h),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.v),
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
