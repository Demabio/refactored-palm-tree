import 'package:kiamis_app/presentation/add_farm_holding_screen/widgets/farndetails_item_widget.dart';

import 'bloc/add_farm_holding_bloc.dart';
import 'models/add_farm_holding_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';

import 'models/farm_item_model.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AddFarmHoldingScreen extends StatelessWidget {
  const AddFarmHoldingScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AddFarmHoldingBloc>(
        create: (context) => AddFarmHoldingBloc(
            AddFarmHoldingState(addFarmHoldingModelObj: AddFarmHoldingModel()))
          ..add(AddFarmHoldingInitialEvent()),
        child: AddFarmHoldingScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<AddFarmHoldingBloc, AddFarmHoldingState>(
        builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
              leadingWidth: DeviceExt((60 / 841) * 100).h,
              leading: AppbarImage(
                  svgPath: ImageConstant.imgSort,
                  margin: EdgeInsets.only(
                      left: DeviceExt((16 / 841) * 100).h,
                      top: DeviceExt((3 / 411) * 100).w,
                      bottom: DeviceExt((11 / 411) * 100).w),
                  onTap: () {
                    onTapSortone(context);
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "msg_other_farm_holdings".tr),
              actions: [
                AppbarImage1(
                    svgPath: ImageConstant.imgFrame34WhiteA70044x44,
                    margin: EdgeInsets.fromLTRB(
                        DeviceExt((11 / 841) * 100).h,
                        DeviceExt((5 / 411) * 100).w,
                        DeviceExt((11 / 841) * 100).h,
                        DeviceExt((9 / 411) * 100).w),
                    onTap: () {
                      onTapImage(context);
                    })
              ],
              styleType: Style.bgFill),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: Padding(
              padding: EdgeInsets.only(
                  left: DeviceExt((20 / 841) * 100).h,
                  right: DeviceExt((14 / 841) * 100).h,
                  bottom: DeviceExt((5 / 411) * 100).w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text("lbl_farmer_info".tr,
                        style: CustomTextStyles.labelMediumPrimary),
                    Padding(
                        padding: EdgeInsets.only(
                            left: DeviceExt((21 / 841) * 100).h),
                        child: Text("msg_farmer_felix_faro".tr,
                            style: theme.textTheme.labelMedium))
                  ]),
                  Padding(
                      padding: EdgeInsets.only(
                          left: DeviceExt((1 / 841) * 100).h,
                          top: DeviceExt((7 / 411) * 100).w),
                      child: Text("Other Farms".tr,
                          style: CustomTextStyles.titleMediumSemiBold)),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: DeviceExt((9 / 841) * 100).h,
                          top: DeviceExt((5 / 411) * 100).w),
                      child: BlocSelector<AddFarmHoldingBloc,
                          AddFarmHoldingState, AddFarmHoldingModel?>(
                        selector: (state) => state.addFarmHoldingModelObj,
                        builder: (context, addFarmHoldingModelObj) {
                          return ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                    height: DeviceExt((18 / 411) * 100).w);
                              },
                              itemCount:
                                  addFarmHoldingModelObj?.farms.length ?? 0,
                              itemBuilder: (context, index) {
                                FarmdetailsItemModel model =
                                    addFarmHoldingModelObj?.farms[index] ??
                                        FarmdetailsItemModel();
                                return FarmdetailsItemWidget(
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
        ),
      );
    });
  }

  addorEdit(BuildContext context, int id, int val) {
    context.read<AddFarmHoldingBloc>().add(
          AddEditEvent(
            value: id,
            id: val,
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

  /// Navigates to the addFarmHoldingOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addFarmHoldingOneScreen.
  onTapImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addFarmHoldingOneScreen,
    );
  }
}
