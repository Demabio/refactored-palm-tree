import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/dynamic_dialog_2.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import '../crop_agriculture_screen/widgets/cropdetails_item_widget.dart';
import 'bloc/crop_agriculture_bloc.dart';
import 'models/crop_agriculture_model.dart';
import 'models/cropdetails_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
              height: Device.orientation == Orientation.portrait
                  ? 15.w
                  : DeviceExt(15).h,
              leadingWidth: DeviceExt((60 / 841) * 100).h,
              leading: CustomImageView(
                  svgPath: ImageConstant.imgSort,
                  height: Device.orientation == Orientation.portrait
                      ? DeviceExt(5).h
                      : 5.w,
                  width: Device.orientation == Orientation.portrait
                      ? DeviceExt(5).h
                      : 5.w,
                  onTap: () {
                    onTapSortone(context);
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "msg_crop_agriculture".tr),
              actions: [
                CustomImageView(
                    svgPath: ImageConstant.imgFrame34WhiteA700,
                    height: Device.orientation == Orientation.portrait
                        ? DeviceExt(5).h
                        : 5.w,
                    width: Device.orientation == Orientation.portrait
                        ? DeviceExt(5).h
                        : 5.w,
                    onTap: () {
                      addorEdit(context, 0, 0);
                    }),
              ],
              styleType: Style.bgFill),
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
                horizontal: DeviceExt((11 / 841) * 100).h,
                vertical: ((2 / 411) * 100).w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        EdgeInsets.only(left: DeviceExt((9 / 841) * 100).h),
                    child: Row(children: [
                      Text(
                        "lbl_farmer_info".tr,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: Device.orientation == Orientation.portrait
                              ? DeviceExt(2).h
                              : DeviceExt(2.5).w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: DeviceExt((21 / 841) * 100).h),
                          child: Text(
                            PrefUtils().getFarmerName(),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize:
                                  Device.orientation == Orientation.portrait
                                      ? DeviceExt(2).h
                                      : DeviceExt(2.5).w,
                              color: Colors.black,
                            ),
                          ))
                    ])),
                Center(
                  child: BlocSelector<CropAgricultureBloc, CropAgricultureState,
                      List<CropdetailsItemModel>?>(
                    selector: (state) =>
                        state.cropAgricultureModelObj?.cropdetailsItemList,
                    builder: (context, models) {
                      return Visibility(
                        visible: models!.isEmpty,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: DeviceExt((24 / 841) * 100).h,
                                top: ((60 / 411) * 100).w),
                            child: Text(
                              "No Crops Found".tr,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: DeviceExt((9 / 841) * 100).h,
                        top: ((5 / 411) * 100).w),
                    child: BlocSelector<CropAgricultureBloc,
                        CropAgricultureState, CropAgricultureModel?>(
                      selector: (state) => state.cropAgricultureModelObj,
                      builder: (context, cropAgricultureModelObj) {
                        return ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: ((18 / 411) * 100).w);
                            },
                            itemCount: cropAgricultureModelObj
                                    ?.cropdetailsItemList.length ??
                                0,
                            itemBuilder: (context, index) {
                              CropdetailsItemModel model =
                                  cropAgricultureModelObj
                                          ?.cropdetailsItemList[index] ??
                                      CropdetailsItemModel();
                              return CropdetailsItemWidget(
                                model,
                                edit: () => addorEdit(
                                  context,
                                  1,
                                  model.id!,
                                ),
                                delete: () => delete(context, model.id!),
                              );
                            });
                      },
                    ),
                  ),
                ),
                SizedBox(height: ((20 / 411) * 100).w),
                BlocSelector<CropAgricultureBloc, CropAgricultureState,
                    CropAgricultureState>(
                  selector: (state) => state,
                  builder: (context, state) {
                    return Column(
                      children: [
                        Visibility(
                          visible: state.done,
                          child: CustomElevatedButton(
                            width: DeviceExt((344 / 841) * 100).h,
                            height: Device.orientation == Orientation.portrait
                                ? DeviceExt(6).h
                                : 8.w,
                            // width:
                            //     Device.orientation == Orientation.portrait
                            //         ? DeviceExt(50).h
                            //         : 50.w,
                            buttonTextStyle:
                                theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontSize:
                                  Device.orientation == Orientation.portrait
                                      ? DeviceExt(2).h
                                      : DeviceExt(2.5).w,
                            ),
                            margin: Device.orientation == Orientation.portrait
                                ? EdgeInsets.fromLTRB(DeviceExt(0.36).h, 6.w,
                                    DeviceExt(0.2).h, 1.2.w)
                                : EdgeInsets.fromLTRB(
                                    DeviceExt(0.36).w,
                                    DeviceExt(6).h,
                                    DeviceExt(0.2).w,
                                    DeviceExt(1.2).h),
                            text: "Next Section".tr,
                            onTap: () {
                              if (state.next) {
                                NavigatorService.popAndPushNamed(
                                  AppRoutes.addRearedLivestockOneScreen,
                                );
                              } else if (state.prev) {
                                NavigatorService.popAndPushNamed(
                                  AppRoutes.addAquacultureOneScreen,
                                );
                              } else {
                                NavigatorService.popAndPushNamed(
                                  AppRoutes.addFarmtechandassetsOneScreen,
                                );
                              }
                            },
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                        CustomElevatedButton(
                          width: DeviceExt((344 / 841) * 100).h,
                          text: "Previous Section".tr,
                          height: Device.orientation == Orientation.portrait
                              ? DeviceExt(6).h
                              : 8.w,
                          // width:
                          //     Device.orientation == Orientation.portrait
                          //         ? DeviceExt(50).h
                          //         : 50.w,
                          buttonTextStyle:
                              theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontSize: Device.orientation == Orientation.portrait
                                ? DeviceExt(2).h
                                : DeviceExt(2.5).w,
                          ),
                          margin: Device.orientation == Orientation.portrait
                              ? EdgeInsets.fromLTRB(DeviceExt(0.36).h, 6.w,
                                  DeviceExt(0.2).h, 1.2.w)
                              : EdgeInsets.fromLTRB(
                                  DeviceExt(0.36).w,
                                  DeviceExt(6).h,
                                  DeviceExt(0.2).w,
                                  DeviceExt(1.2).h),
                          onTap: () {
                            NavigatorService.popAndPushNamed(
                              AppRoutes.primaryFarmHoldingScreen,
                            );
                          },
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
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

  delete(BuildContext context, int id) async {
    String label = "Delete Crop Entry";
    String body = "Are you sure you want to perform this action?";

    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: DynamicDialog.builder(context, label, body),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
    context.read<CropAgricultureBloc>().add(
          DeleteEvent(
            value: id,
          ),
        );
  }

  closedialog(BuildContext context, String label, String body) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        //barrierColor: const Color.fromARGB(255, 50, 50, 50),
        builder: (_) => AlertDialog(
              content: DynamicDialogTwo.builder(context, label, body),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the farmerRegistrationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the farmerRegistrationScreen.
  onTapSortone(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmerRegistrationScreen,
    );
  }

  /// Navigates to the addCropOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the addCropOneScreen.
  onTapImage(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addCropOneScreen,
    );
  }
}
