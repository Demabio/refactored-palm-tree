// ignore_for_file: must_call_super

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

import 'bloc/livestock_one_bloc.dart';
import 'models/livestock_item_model.dart';
import 'models/livestock_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

import 'widgets/livestockdetails_item_widget.dart';

// ignore_for_file: must_be_immutable
class LivestockOnePage extends StatefulWidget {
  const LivestockOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  LivestockOnePageState createState() => LivestockOnePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<LivestockOneBloc>(
      create: (context) => LivestockOneBloc(LivestockOneState(
        livestockOneModelObj: LivestockOneModel(),
      ))
        ..add(LivestockOneInitialEvent()),
      child: LivestockOnePage(),
    );
  }
}

class LivestockOnePageState extends State<LivestockOnePage>
    with AutomaticKeepAliveClientMixin<LivestockOnePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<LivestockOneBloc, LivestockOneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: DeviceExt((21 / 841) * 100).h),
                        child: Text(
                          "lbl_farmer_info".tr,
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontSize:
                                  Device.orientation == Orientation.portrait
                                      ? DeviceExt(2).h
                                      : DeviceExt(2.5).w,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: DeviceExt((21 / 841) * 100).h),
                        child: Text(
                          PrefUtils().getFarmerName(),
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: Device.orientation == Orientation.portrait
                                ? DeviceExt(2).h
                                : DeviceExt(2.5).w,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13.v),
                  Center(
                    child: BlocSelector<LivestockOneBloc, LivestockOneState,
                        List<LSdetailsItemModel>?>(
                      selector: (state) => state.livestockOneModelObj?.lsmodels,
                      builder: (context, models) {
                        return Visibility(
                          visible: models!.isEmpty,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: DeviceExt((24 / 841) * 100).h,
                                  top: 60.v),
                              child: Text(
                                "No Livestock Found".tr,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontSize:
                                      Device.orientation == Orientation.portrait
                                          ? DeviceExt(1.8).h
                                          : DeviceExt(2).w,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: DeviceExt((9 / 841) * 100).h,
                          top: ((5 / 411) * 100).w),
                      child: BlocSelector<LivestockOneBloc, LivestockOneState,
                          LivestockOneModel?>(
                        selector: (state) => state.livestockOneModelObj,
                        builder: (context, addFarmHoldingModelObj) {
                          return Column(
                            children: [
                              ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 18.v);
                                  },
                                  itemCount:
                                      addFarmHoldingModelObj?.lsmodels.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    LSdetailsItemModel model =
                                        addFarmHoldingModelObj
                                                ?.lsmodels[index] ??
                                            LSdetailsItemModel();
                                    return LSdetailsItemWidget(
                                      model,
                                      edit: () => addorEdit(
                                        context,
                                        1,
                                        model.id!,
                                      ),
                                      delete: () => delete(context, model.id!),
                                    );
                                  }),
                              SizedBox(height: ((10 / 411) * 100).w),
                              Visibility(
                                visible: state.done,
                                child: CustomElevatedButton(
                                  height:
                                      Device.orientation == Orientation.portrait
                                          ? DeviceExt(6).h
                                          : 8.w,
                                  width: DeviceExt((343 / 841) * 100).h,
                                  buttonTextStyle:
                                      theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                  ),
                                  margin:
                                      Device.orientation == Orientation.portrait
                                          ? EdgeInsets.fromLTRB(
                                              DeviceExt(0.36).h,
                                              6.w,
                                              DeviceExt(0.2).h,
                                              1.2.w)
                                          : EdgeInsets.fromLTRB(
                                              DeviceExt(0.36).w,
                                              DeviceExt(6).h,
                                              DeviceExt(0.2).w,
                                              DeviceExt(1.2).h),
                                  text: "Next Section".tr,
                                  onTap: () {
                                    if (state.next) {
                                      NavigatorService.popAndPushNamed(
                                          AppRoutes.addAquacultureOneScreen);
                                    } else {
                                      NavigatorService.popAndPushNamed(AppRoutes
                                          .addFarmtechandassetsOneScreen);
                                    }
                                  },
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                              SizedBox(height: ((10 / 411) * 100).w),
                              CustomElevatedButton(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(6).h
                                        : 8.w,
                                width: DeviceExt((343 / 841) * 100).h,
                                buttonTextStyle:
                                    theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize:
                                      Device.orientation == Orientation.portrait
                                          ? DeviceExt(2).h
                                          : DeviceExt(2.5).w,
                                ),
                                margin:
                                    Device.orientation == Orientation.portrait
                                        ? EdgeInsets.fromLTRB(DeviceExt(0.36).h,
                                            6.w, DeviceExt(0.2).h, 1.2.w)
                                        : EdgeInsets.fromLTRB(
                                            DeviceExt(0.36).w,
                                            DeviceExt(6).h,
                                            DeviceExt(0.2).w,
                                            DeviceExt(1.2).h),
                                text: "Livestock Input".tr,
                                onTap: () {
                                  NavigatorService.popAndPushNamed(
                                    AppRoutes.addLiverstockinputScreen,
                                  );
                                },
                                alignment: Alignment.bottomCenter,
                              ),
                              SizedBox(height: ((10 / 411) * 100).w),
                              CustomElevatedButton(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(6).h
                                        : 8.w,
                                width: DeviceExt((343 / 841) * 100).h,
                                buttonTextStyle:
                                    theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize:
                                      Device.orientation == Orientation.portrait
                                          ? DeviceExt(2).h
                                          : DeviceExt(2.5).w,
                                ),
                                margin:
                                    Device.orientation == Orientation.portrait
                                        ? EdgeInsets.fromLTRB(DeviceExt(0.36).h,
                                            6.w, DeviceExt(0.2).h, 1.2.w)
                                        : EdgeInsets.fromLTRB(
                                            DeviceExt(0.36).w,
                                            DeviceExt(6).h,
                                            DeviceExt(0.2).w,
                                            DeviceExt(1.2).h),
                                text: "Add Livestock".tr,
                                onTap: () {
                                  addorEdit(context, 0, 0);
                                },
                                alignment: Alignment.bottomCenter,
                              ),
                              SizedBox(height: ((10 / 411) * 100).w),
                              CustomElevatedButton(
                                height:
                                    Device.orientation == Orientation.portrait
                                        ? DeviceExt(6).h
                                        : 8.w,
                                width: DeviceExt((343 / 841) * 100).h,
                                buttonTextStyle:
                                    theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize:
                                      Device.orientation == Orientation.portrait
                                          ? DeviceExt(2).h
                                          : DeviceExt(2.5).w,
                                ),
                                margin:
                                    Device.orientation == Orientation.portrait
                                        ? EdgeInsets.fromLTRB(DeviceExt(0.36).h,
                                            6.w, DeviceExt(0.2).h, 1.2.w)
                                        : EdgeInsets.fromLTRB(
                                            DeviceExt(0.36).w,
                                            DeviceExt(6).h,
                                            DeviceExt(0.2).w,
                                            DeviceExt(1.2).h),
                                text: "Previous Section".tr,
                                onTap: () {
                                  if (state.prev) {
                                    NavigatorService.popAndPushNamed(
                                        AppRoutes.cropAgricultureScreen);
                                  } else {
                                    NavigatorService.popAndPushNamed(
                                        AppRoutes.farmerRegistrationScreen);
                                  }
                                },
                                alignment: Alignment.bottomCenter,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  addorEdit(BuildContext context, int id, int crop) {
    context.read<LivestockOneBloc>().add(
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
    String label = "Delete Livestock Entry";
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
    context.read<LivestockOneBloc>().add(
          DeleteEvent(
            value: id,
          ),
        );
  }

  onTapImage(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addRearedLivestockOneScreen,
    );
  }
}
