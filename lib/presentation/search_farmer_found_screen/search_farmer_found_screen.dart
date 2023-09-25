import 'bloc/search_farmer_found_bloc.dart';
import 'models/search_farmer_found_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';

class SearchFarmerFoundScreen extends StatelessWidget {
  const SearchFarmerFoundScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchFarmerFoundBloc>(
      create: (context) => SearchFarmerFoundBloc(SearchFarmerFoundState(
        searchFarmerFoundModelObj: SearchFarmerFoundModel(),
      ))
        ..add(SearchFarmerFoundInitialEvent()),
      child: SearchFarmerFoundScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: 45.v,
          leadingWidth: 48.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgMenu,
            margin: EdgeInsets.only(
              left: 24.h,
              top: 8.v,
              bottom: 13.v,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle1(
            text: "lbl_search_farmer".tr,
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 17.h,
            vertical: 16.v,
          ),
          child: Column(
            children: [
              BlocSelector<SearchFarmerFoundBloc, SearchFarmerFoundState,
                  TextEditingController?>(
                selector: (state) => state.searchController,
                builder: (context, searchController) {
                  return CustomSearchView(
                    margin: EdgeInsets.symmetric(horizontal: 7.h),
                    controller: searchController,
                    hintText: "msg_search_id_number".tr,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: 40.v,
                    ),
                    suffix: Padding(
                      padding: EdgeInsets.only(
                        right: 15.h,
                      ),
                      child: IconButton(
                        onPressed: () {
                          searchController!.clear();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.h,
                  vertical: 18.v,
                ),
                decoration: AppDecoration.outlinePrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_farmer_name".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "msg_farmer_felix_faro".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "msg_national_id_number".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "lbl_34598721".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "msg_date_of_registration".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "msg_2nd_september_2023".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 9.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text(
                            "lbl_email".tr,
                            style: CustomTextStyles.labelMediumPrimary,
                          ),
                        ),
                        Text(
                          "msg_ffelixf_gmail_com".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 9.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_year_of_birth".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "lbl_1990".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 11.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_postal_address".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "lbl_1111".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 11.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_postal_code".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "lbl_1001".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 11.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_mobile_number".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "lbl_0724087222".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 11.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_marital_status".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "lbl_yes".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 11.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_sex".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "lbl_male".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 11.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_status".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Text(
                          "lbl_created".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 11.v),
                    CustomImageView(
                      svgPath: ImageConstant.imgEdit,
                      height: 22.adaptSize,
                      width: 22.adaptSize,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
