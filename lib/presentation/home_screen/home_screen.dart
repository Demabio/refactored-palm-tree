import '../home_screen/widgets/userprofile_item_widget.dart';
import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_title.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          leadingWidth: 73.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgMenu,
            margin: EdgeInsets.only(
              left: 49.h,
              top: 8.v,
              bottom: 15.v,
            ),
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "lbl_dashboard".tr,
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 14.v),
            child: Padding(
              padding: EdgeInsets.only(
                right: 1.h,
                bottom: 5.v,
              ),
              child: Column(
                children: [
                  BlocSelector<HomeBloc, HomeState, TextEditingController?>(
                    selector: (state) => state.searchController,
                    builder: (context, searchController) {
                      return CustomSearchView(
                        margin: EdgeInsets.only(
                          left: 24.h,
                          right: 23.h,
                        ),
                        controller: searchController,
                        hintText: "lbl_search_for_menu".tr,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 24.h,
                        top: 7.v,
                      ),
                      child: Text(
                        "msg_farmers_overview".tr,
                        style: CustomTextStyles.titleMediumPrimarySemiBold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 23.h,
                      top: 12.v,
                      right: 23.h,
                    ),
                    child: BlocSelector<HomeBloc, HomeState, HomeModel?>(
                      selector: (state) => state.homeModelObj,
                      builder: (context, homeModelObj) {
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 86.v,
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 16.h,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              homeModelObj?.userprofileItemList.length ?? 0,
                          itemBuilder: (context, index) {
                            UserprofileItemModel model =
                                homeModelObj?.userprofileItemList[index] ??
                                    UserprofileItemModel();
                            return UserprofileItemWidget(
                              model,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.v),
                  SizedBox(
                    height: 352.v,
                    width: 374.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(top: 15.v),
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.h,
                              vertical: 32.v,
                            ),
                            decoration: AppDecoration.fillOnPrimary,
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 8.v,
                                right: 1.h,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 67.h,
                                vertical: 12.v,
                              ),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgVolume,
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 9.h),
                                    child: Text(
                                      "lbl_search_farmer".tr,
                                      style:
                                          CustomTextStyles.titleMediumOnPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BlocSelector<HomeBloc, HomeState,
                                    TextEditingController?>(
                                  selector: (state) => state.searchController1,
                                  builder: (context, searchController1) {
                                    return CustomSearchView(
                                      controller: searchController1,
                                      hintText: "msg_search_id_number".tr,
                                      prefix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            16.h, 12.v, 10.h, 12.v),
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
                                            searchController1!.clear();
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
                                SizedBox(height: 91.v),
                                Text(
                                  "msg_registration_accuracy".tr,
                                  style: CustomTextStyles
                                      .titleMediumPrimarySemiBold,
                                ),
                                SizedBox(height: 46.v),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 150.adaptSize,
                                    width: 150.adaptSize,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            height: 150.adaptSize,
                                            width: 150.adaptSize,
                                            child: CircularProgressIndicator(
                                              value: 0.5,
                                              backgroundColor: appTheme.gray300
                                                  .withOpacity(0.6),
                                              color: appTheme.yellowA700,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "lbl_60".tr,
                                            style: CustomTextStyles
                                                .headlineLargeYellowA700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 24.h,
                        top: 60.v,
                      ),
                      child: Text(
                        "msg_verification_statistics".tr,
                        style: CustomTextStyles.titleMediumPrimarySemiBold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 85.h,
                      top: 31.v,
                      right: 89.h,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: fs.Svg(
                          ImageConstant.imgGroup9879,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 95.h,
                          margin: EdgeInsets.only(right: 95.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.h,
                            vertical: 26.v,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: fs.Svg(
                                ImageConstant.imgGroup9880,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 12.v),
                              SizedBox(
                                width: 58.h,
                                child: Text(
                                  "lbl_verified_20".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles.labelLargeOnPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 72.h,
                            margin: EdgeInsets.only(
                              top: 17.v,
                              right: 29.h,
                              bottom: 47.v,
                            ),
                            child: Text(
                              "msg_unverified_80".tr,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.labelLargeOnPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 24.h,
                        top: 46.v,
                      ),
                      child: Text(
                        "lbl_weekly_activity".tr,
                        style: CustomTextStyles.titleMediumPrimarySemiBold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 23.h,
                      top: 9.v,
                      right: 23.h,
                    ),
                    decoration: AppDecoration.fillOnPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 29.v),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 22.h,
                            vertical: 16.v,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.v),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "lbl_100".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 24.v),
                                    Text(
                                      "lbl_75".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 23.v),
                                    Text(
                                      "lbl_50".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 24.v),
                                    Text(
                                      "lbl_25".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 24.v),
                                    Text(
                                      "lbl_0".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 5.h,
                                    top: 12.v,
                                  ),
                                  child: Column(
                                    children: [
                                      CustomImageView(
                                        svgPath: ImageConstant.imgGroup1045,
                                        height: 157.v,
                                        width: 232.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 5.h,
                                          top: 7.v,
                                          right: 5.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "lbl_sat".tr,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 19.h),
                                              child: Text(
                                                "lbl_sun".tr,
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 17.h),
                                              child: Text(
                                                "lbl_mon".tr,
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 17.h),
                                              child: Text(
                                                "lbl_tue".tr,
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.h),
                                              child: Text(
                                                "lbl_wed".tr,
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.h),
                                              child: Text(
                                                "lbl_thu".tr,
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                            ),
                                          ],
                                        ),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 24.h,
                        top: 26.v,
                      ),
                      child: Text(
                        "msg_registration_overview".tr,
                        style: CustomTextStyles.titleMediumPrimarySemiBold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 23.h,
                      top: 9.v,
                      right: 23.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 21.h,
                      vertical: 16.v,
                    ),
                    decoration: AppDecoration.fillOnPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 2.v,
                            right: 1.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 12.adaptSize,
                                width: 12.adaptSize,
                                margin: EdgeInsets.only(bottom: 2.v),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(
                                    4.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: Text(
                                  "lbl_rejected".tr,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                              Container(
                                height: 12.adaptSize,
                                width: 12.adaptSize,
                                margin: EdgeInsets.only(
                                  left: 11.h,
                                  bottom: 2.v,
                                ),
                                decoration: BoxDecoration(
                                  color: appTheme.green200,
                                  borderRadius: BorderRadius.circular(
                                    4.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: Text(
                                  "lbl_approved".tr,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 15.v,
                            right: 1.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgGroup514,
                                  height: 153.v,
                                  width: 25.h,
                                  margin: EdgeInsets.only(right: 9.h),
                                ),
                              ),
                              Expanded(
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgGroup514,
                                  height: 120.v,
                                  width: 25.h,
                                  margin: EdgeInsets.only(
                                    left: 9.h,
                                    top: 33.v,
                                    right: 9.h,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdown,
                                  height: 75.v,
                                  width: 25.h,
                                  margin: EdgeInsets.only(
                                    left: 9.h,
                                    top: 78.v,
                                    right: 9.h,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgGroup514,
                                  height: 129.v,
                                  width: 25.h,
                                  margin: EdgeInsets.only(
                                    left: 9.h,
                                    top: 24.v,
                                    right: 9.h,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgGroup514,
                                  height: 136.v,
                                  width: 25.h,
                                  margin: EdgeInsets.only(
                                    left: 9.h,
                                    top: 17.v,
                                    right: 9.h,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdown,
                                  height: 96.v,
                                  width: 25.h,
                                  margin: EdgeInsets.only(
                                    left: 9.h,
                                    top: 57.v,
                                    right: 9.h,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgGroup514,
                                  height: 143.v,
                                  width: 25.h,
                                  margin: EdgeInsets.only(
                                    left: 9.h,
                                    top: 10.v,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.v,
                            right: 1.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "lbl_jul".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                              Text(
                                "lbl_aug".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                              Text(
                                "lbl_sep".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                              Text(
                                "lbl_oct".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                              Text(
                                "lbl_nov".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                              Text(
                                "lbl_dec".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                              Text(
                                "lbl_jan".tr,
                                style: theme.textTheme.bodySmall,
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
      ),
    );
  }
}
