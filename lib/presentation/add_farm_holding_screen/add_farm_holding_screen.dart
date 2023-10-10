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
              leadingWidth: 60.h,
              leading: AppbarImage(
                  svgPath: ImageConstant.imgSort,
                  margin: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 11.v),
                  onTap: () {
                    onTapSortone(context);
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "msg_other_farm_holdings".tr),
              actions: [
                AppbarImage1(
                    svgPath: ImageConstant.imgFrame34WhiteA70044x44,
                    margin: EdgeInsets.fromLTRB(11.h, 5.v, 11.h, 9.v),
                    onTap: () {
                      onTapImage(context);
                    })
              ],
              styleType: Style.bgFill),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 2.v),
              child: Padding(
                padding: EdgeInsets.only(left: 20.h, right: 14.h, bottom: 5.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text("lbl_farmer_info".tr,
                          style: CustomTextStyles.labelMediumPrimary),
                      Padding(
                          padding: EdgeInsets.only(left: 21.h),
                          child: Text("msg_farmer_felix_faro".tr,
                              style: theme.textTheme.labelMedium))
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 1.h, top: 7.v),
                        child: Text("Other Farms".tr,
                            style: CustomTextStyles.titleMediumSemiBold)),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 9.h, top: 5.v),
                        child: BlocSelector<AddFarmHoldingBloc,
                            AddFarmHoldingState, AddFarmHoldingModel?>(
                          selector: (state) => state.addFarmHoldingModelObj,
                          builder: (context, addFarmHoldingModelObj) {
                            return ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 18.v);
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
        ),
      );
    });
  }

  addorEdit(BuildContext context, int id, int crop) {
    context.read<AddFarmHoldingBloc>().add(
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
