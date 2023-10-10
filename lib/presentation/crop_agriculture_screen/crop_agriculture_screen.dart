import '../crop_agriculture_screen/widgets/cropdetails_item_widget.dart';
import 'bloc/crop_agriculture_bloc.dart';
import 'models/crop_agriculture_model.dart';
import 'models/cropdetails_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

class CropAgricultureScreen extends StatelessWidget {
  const CropAgricultureScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CropAgricultureBloc>(
        create: (context) => CropAgricultureBloc(CropAgricultureState(
            cropAgricultureModelObj: CropAgricultureModel()))
          ..add(CropAgricultureInitialEvent()),
        child: CropAgricultureScreen());
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
            title: AppbarSubtitle1(text: "msg_crop_agriculture".tr),
            actions: [
              AppbarImage1(
                  svgPath: ImageConstant.imgFrame34WhiteA700,
                  margin: EdgeInsets.fromLTRB(11.h, 5.v, 11.h, 9.v),
                  onTap: () {
                    addorEdit(context, 0, 0);
                  })
            ],
            styleType: Style.bgFill),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 2.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 9.h),
                  child: Row(children: [
                    Text("lbl_farmer_info".tr,
                        style: CustomTextStyles.labelMediumPrimary),
                    Padding(
                        padding: EdgeInsets.only(left: 21.h),
                        child: Text("msg_farmer_felix_faro".tr,
                            style: theme.textTheme.labelMedium))
                  ])),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 9.h, top: 5.v),
                  child: BlocSelector<CropAgricultureBloc, CropAgricultureState,
                      CropAgricultureModel?>(
                    selector: (state) => state.cropAgricultureModelObj,
                    builder: (context, cropAgricultureModelObj) {
                      return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 18.v);
                          },
                          itemCount: cropAgricultureModelObj
                                  ?.cropdetailsItemList.length ??
                              0,
                          itemBuilder: (context, index) {
                            CropdetailsItemModel model = cropAgricultureModelObj
                                    ?.cropdetailsItemList[index] ??
                                CropdetailsItemModel();
                            return CropdetailsItemWidget(
                              model,
                              edit: () => addorEdit(
                                context,
                                1,
                                model.id!,
                              ),
                            );
                          });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addorEdit(BuildContext context, int id, int crop) {
    context.read<CropAgricultureBloc>().add(
          AddEditEvent(
            value: id,
            crop: crop,
            createSuccessful: () {
              onTapImage(context);
            },
            createFailed: () {
              onTapImage(context);
            },
          ),
        );
  }

  /// Navigates to the farmerRegistrationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmerRegistrationScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.farmerRegistrationScreen,
    );
  }

  /// Navigates to the addCropOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addCropOneScreen.
  onTapImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addCropOneScreen,
    );
  }
}
