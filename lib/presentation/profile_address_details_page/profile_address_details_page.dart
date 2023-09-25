import 'bloc/profile_address_details_bloc.dart';
import 'models/profile_address_details_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/widgets/custom_outlined_button.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfileAddressDetailsPage extends StatefulWidget {
  const ProfileAddressDetailsPage({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileAddressDetailsPageState createState() =>
      ProfileAddressDetailsPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileAddressDetailsBloc>(
      create: (context) => ProfileAddressDetailsBloc(ProfileAddressDetailsState(
        profileAddressDetailsModelObj: ProfileAddressDetailsModel(),
      ))
        ..add(ProfileAddressDetailsInitialEvent()),
      child: ProfileAddressDetailsPage(),
    );
  }
}

class ProfileAddressDetailsPageState extends State<ProfileAddressDetailsPage>
    with AutomaticKeepAliveClientMixin<ProfileAddressDetailsPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 36.v,
                    right: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_address_1".tr,
                        style: CustomTextStyles.bodyMediumGray90002_1,
                      ),
                      SizedBox(height: 7.v),
                      BlocSelector<ProfileAddressDetailsBloc,
                          ProfileAddressDetailsState, TextEditingController?>(
                        selector: (state) => state.addressController,
                        builder: (context, addressController) {
                          return CustomTextFormField(
                            controller: addressController,
                            hintText: "lbl_enter_address".tr,
                            hintStyle: CustomTextStyles.bodyMediumBluegray40001,
                            borderDecoration: TextFormFieldStyleHelper.fillGray,
                            fillColor: appTheme.gray5004,
                          );
                        },
                      ),
                      SizedBox(height: 24.v),
                      Text(
                        "lbl_address_2".tr,
                        style: CustomTextStyles.bodyMediumGray90002_1,
                      ),
                      SizedBox(height: 7.v),
                      BlocSelector<ProfileAddressDetailsBloc,
                          ProfileAddressDetailsState, TextEditingController?>(
                        selector: (state) => state.addressController1,
                        builder: (context, addressController1) {
                          return CustomTextFormField(
                            controller: addressController1,
                            hintText: "lbl_enter_address".tr,
                            hintStyle: CustomTextStyles.bodyMediumBluegray40001,
                            borderDecoration: TextFormFieldStyleHelper.fillGray,
                            fillColor: appTheme.gray5004,
                          );
                        },
                      ),
                      SizedBox(height: 25.v),
                      Text(
                        "lbl_city".tr,
                        style: CustomTextStyles.bodyMediumGray90002_1,
                      ),
                      SizedBox(height: 6.v),
                      BlocSelector<ProfileAddressDetailsBloc,
                          ProfileAddressDetailsState, TextEditingController?>(
                        selector: (state) => state.cityController,
                        builder: (context, cityController) {
                          return CustomTextFormField(
                            controller: cityController,
                            hintText: "lbl_enter_your_city".tr,
                            hintStyle: CustomTextStyles.bodyMediumBluegray40001,
                            borderDecoration: TextFormFieldStyleHelper.fillGray,
                            fillColor: appTheme.gray5004,
                          );
                        },
                      ),
                      SizedBox(height: 24.v),
                      Text(
                        "lbl_postal_code2".tr,
                        style: CustomTextStyles.bodyMediumGray90002_1,
                      ),
                      SizedBox(height: 7.v),
                      BlocSelector<ProfileAddressDetailsBloc,
                          ProfileAddressDetailsState, TextEditingController?>(
                        selector: (state) => state.enterpostalController,
                        builder: (context, enterpostalController) {
                          return CustomTextFormField(
                            controller: enterpostalController,
                            hintText: "msg_enter_postal_code".tr,
                            hintStyle: CustomTextStyles.bodyMediumBluegray40001,
                            borderDecoration: TextFormFieldStyleHelper.fillGray,
                            fillColor: appTheme.gray5004,
                          );
                        },
                      ),
                      SizedBox(height: 24.v),
                      Text(
                        "lbl_phone_number".tr,
                        style: CustomTextStyles.bodyMediumGray90002_1,
                      ),
                      SizedBox(height: 7.v),
                      BlocSelector<ProfileAddressDetailsBloc,
                          ProfileAddressDetailsState, TextEditingController?>(
                        selector: (state) => state.phoneNumberController,
                        builder: (context, phoneNumberController) {
                          return CustomTextFormField(
                            controller: phoneNumberController,
                            hintText: "msg_enter_phone_number".tr,
                            hintStyle: CustomTextStyles.bodyMediumBluegray40001,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (!isValidPhone(value)) {
                                return "Please enter valid phone number";
                              }
                              return null;
                            },
                            borderDecoration: TextFormFieldStyleHelper.fillGray,
                            fillColor: appTheme.gray5004,
                          );
                        },
                      ),
                      SizedBox(height: 24.v),
                      CustomOutlinedButton(
                        height: 48.v,
                        text: "msg_add_another_address".tr,
                        buttonStyle: CustomButtonStyles.outlineIndigoA,
                        buttonTextStyle:
                            CustomTextStyles.bodyMediumIndigoA200_1,
                      ),
                      SizedBox(height: 24.v),
                      Text(
                        "msg_current_addresses".tr,
                        style: CustomTextStyles.bodyMedium_1,
                      ),
                      SizedBox(height: 23.v),
                      SizedBox(
                        height: 224.v,
                        width: 358.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 79.v),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.h,
                                  vertical: 18.v,
                                ),
                                decoration: AppDecoration.fillGray5003.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 92.v),
                                      child: Text(
                                        "lbl_home_address".tr,
                                        style: CustomTextStyles.bodyMedium_1,
                                      ),
                                    ),
                                    Spacer(),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgEditIndigoA200,
                                      height: 10.v,
                                      width: 16.h,
                                      margin: EdgeInsets.only(bottom: 98.v),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 13.h,
                                        bottom: 92.v,
                                      ),
                                      child: Text(
                                        "lbl_edit".tr,
                                        style: CustomTextStyles
                                            .bodyMediumIndigoA200_1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: Text(
                                            "lbl_address_1".tr,
                                            style: CustomTextStyles
                                                .bodyMediumGray60001,
                                          ),
                                        ),
                                        Text(
                                          "lbl_amoy_st_592".tr,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.v),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 14.v),
                                          child: Text(
                                            "lbl_address_2".tr,
                                            style: CustomTextStyles
                                                .bodyMediumGray60001,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 14.v),
                                          child: Text(
                                            "lbl_amoy_st_592".tr,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 21.v),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "lbl_los_angeles".tr,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    SizedBox(height: 1.v),
                                    Text(
                                      "lbl_city".tr,
                                      style:
                                          CustomTextStyles.bodyMediumGray60001,
                                    ),
                                    SizedBox(height: 18.v),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "lbl_0000000".tr,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    SizedBox(height: 2.v),
                                    Text(
                                      "lbl_postal_code3".tr,
                                      style:
                                          CustomTextStyles.bodyMediumGray60001,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.v),
                      SizedBox(
                        height: 224.v,
                        width: 358.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 79.v),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.h,
                                  vertical: 18.v,
                                ),
                                decoration: AppDecoration.fillGray5003.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 92.v),
                                      child: Text(
                                        "lbl_home_address".tr,
                                        style: CustomTextStyles.bodyMedium_1,
                                      ),
                                    ),
                                    Spacer(),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgEditIndigoA200,
                                      height: 10.v,
                                      width: 16.h,
                                      margin: EdgeInsets.only(bottom: 98.v),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 13.h,
                                        bottom: 92.v,
                                      ),
                                      child: Text(
                                        "lbl_edit".tr,
                                        style: CustomTextStyles
                                            .bodyMediumIndigoA200_1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: Text(
                                            "lbl_address_1".tr,
                                            style: CustomTextStyles
                                                .bodyMediumGray60001,
                                          ),
                                        ),
                                        Text(
                                          "lbl_amoy_st_592".tr,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.v),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 14.v),
                                          child: Text(
                                            "lbl_address_2".tr,
                                            style: CustomTextStyles
                                                .bodyMediumGray60001,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 14.v),
                                          child: Text(
                                            "lbl_amoy_st_592".tr,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 21.v),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "lbl_los_angeles".tr,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    SizedBox(height: 1.v),
                                    Text(
                                      "lbl_city".tr,
                                      style:
                                          CustomTextStyles.bodyMediumGray60001,
                                    ),
                                    SizedBox(height: 18.v),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "lbl_0000000".tr,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    SizedBox(height: 2.v),
                                    Text(
                                      "lbl_postal_code3".tr,
                                      style:
                                          CustomTextStyles.bodyMediumGray60001,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
