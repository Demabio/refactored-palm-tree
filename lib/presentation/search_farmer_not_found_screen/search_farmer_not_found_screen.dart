import 'bloc/search_farmer_not_found_bloc.dart';
import 'models/search_farmer_not_found_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';

class SearchFarmerNotFoundScreen extends StatelessWidget {
  const SearchFarmerNotFoundScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchFarmerNotFoundBloc>(
      create: (context) => SearchFarmerNotFoundBloc(SearchFarmerNotFoundState(
        searchFarmerNotFoundModelObj: SearchFarmerNotFoundModel(),
      ))
        ..add(SearchFarmerNotFoundInitialEvent()),
      child: SearchFarmerNotFoundScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 7.v),
                decoration: AppDecoration.fillWhiteA,
                child: Column(
                  children: [
                    CustomAppBar(
                      height: 30.v,
                      leadingWidth: 48.h,
                      leading: AppbarImage(
                        svgPath: ImageConstant.imgMenu,
                        margin: EdgeInsets.only(
                          left: 24.h,
                          bottom: 5.v,
                        ),
                      ),
                      centerTitle: true,
                      title: AppbarSubtitle1(
                        text: "lbl_search_farmer".tr,
                      ),
                    ),
                    BlocSelector<SearchFarmerNotFoundBloc,
                        SearchFarmerNotFoundState, TextEditingController?>(
                      selector: (state) => state.searchController,
                      builder: (context, searchController) {
                        return CustomSearchView(
                          margin: EdgeInsets.fromLTRB(24.h, 24.v, 24.h, 12.v),
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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.h,
                  vertical: 22.v,
                ),
                child: Column(
                  children: [
                    Text(
                      "msg_farmer_not_found".tr,
                      style: CustomTextStyles.titleMediumSemiBold,
                    ),
                    SizedBox(height: 22.v),
                    CustomElevatedButton(
                      text: "lbl_add_farmer".tr,
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 9.h),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgVolume,
                        ),
                      ),
                      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                    ),
                    SizedBox(height: 5.v),
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
