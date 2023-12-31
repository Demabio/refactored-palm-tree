import 'package:kiamis_app/core/utils/validation_functions.dart';
import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/dynamic_dialog_2.dart';
import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';
import 'package:kiamis_app/presentation/home_farmer_found_dialog/home_farmer_found_dialog.dart';
import 'package:kiamis_app/presentation/search_farmer_screen/models/farm_item_model.dart';
import 'package:kiamis_app/presentation/search_farmer_screen/widgets/farmdetails_item_widget.dart';
import 'package:kiamis_app/presentation/side_menu_draweritem/side_menu_draweritem.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';

import 'bloc/search_farmer_bloc.dart';
import 'models/search_farmer_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';
import 'package:kiamis_app/widgets/custom_search_view.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class SearchFarmerScreen extends StatelessWidget {
  SearchFarmerScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchFarmerBloc>(
        create: (context) => SearchFarmerBloc(
            SearchFarmerState(searchFarmerModelObj: SearchFarmerModel()))
          ..add(SearchFarmerInitialEvent()),
        child: SearchFarmerScreen());
  }

  FocusNode _firstTextFieldFocus = FocusNode();

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
              height: ((47 / 411) * 100).w,
              leadingWidth: DeviceExt((48 / 841) * 100).h,
              leading: AppbarImage(
                onTap: () {
                  onTapMenuone(context);
                },
                svgPath: ImageConstant.imgMenu,
                margin: EdgeInsets.only(
                  left: DeviceExt((24 / 841) * 100).h,
                  top: ((8 / 411) * 100).w,
                  bottom: ((15 / 411) * 100).w,
                ),
              ),
              centerTitle: true,
              title: AppbarSubtitle1(text: "lbl_search_farmer".tr),
              actions: [
                AppbarImage1(
                    svgPath: ImageConstant.imgFrame34WhiteA700,
                    margin: EdgeInsets.fromLTRB(
                        DeviceExt((11 / 841) * 100).h,
                        ((5 / 411) * 100).w,
                        DeviceExt((11 / 841) * 100).h,
                        ((9 / 411) * 100).w),
                    onTap: () {
                      addorEdit(context, 0, 0);
                    })
              ],
              styleType: Style.bgFill),
          drawer: SideMenuDraweritem(),
          key: _scaffoldKey,
          resizeToAvoidBottomInset: true,
          body: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: ((7 / 411) * 100).w),
                        decoration: AppDecoration.fillWhiteA,
                        child: Column(children: [
                          BlocSelector<SearchFarmerBloc, SearchFarmerState,
                                  TextEditingController?>(
                              selector: (state) => state.searchController,
                              builder: (context, searchController) {
                                return CustomSearchView(
                                    onChanged: (p0) {
                                      return null;
                                    },
                                    enabled: true,
                                    autofocus: false,
                                    validator: (value) {
                                      if (!isID(value, isRequired: true)) {
                                        return "Provide a valid ID Number";
                                      } else {
                                        return null;
                                      }
                                    },
                                    textStyle:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: Colors.black,
                                      fontSize: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(1.8).h
                                          : DeviceExt(2.5).w,
                                    ),
                                    hintStyle:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontSize: Device.orientation ==
                                              Orientation.portrait
                                          ? DeviceExt(1.8).h
                                          : DeviceExt(2.5).w,
                                    ),
                                    focusNode: _firstTextFieldFocus,
                                    textInputType: TextInputType.number,
                                    margin: EdgeInsets.fromLTRB(
                                        DeviceExt((24 / 841) * 100).h,
                                        ((24 / 411) * 100).w,
                                        DeviceExt((24 / 841) * 100).h,
                                        ((12 / 411) * 100).w),
                                    controller: searchController,
                                    hintText: "msg_search_id_number".tr,
                                    prefix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            DeviceExt((16 / 841) * 100).h,
                                            ((12 / 411) * 100).w,
                                            DeviceExt((10 / 841) * 100).h,
                                            ((12 / 411) * 100).w),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgSearch)),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: ((40 / 411) * 100).w),
                                    suffix: Padding(
                                        padding: EdgeInsets.only(
                                            right:
                                                DeviceExt((15 / 841) * 100).h),
                                        child: IconButton(
                                            onPressed: () {
                                              searchController!.clear();
                                            },
                                            icon: Icon(Icons.clear,
                                                color: Colors.grey.shade600))));
                              })
                        ])),
                    Visibility(
                      visible: PrefUtils().getFound(),
                      child: BlocSelector<SearchFarmerBloc, SearchFarmerState,
                          String?>(
                        selector: (state) => state.name,
                        builder: (context, name) {
                          return Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((21 / 841) * 100).h),
                                child: Text(
                                  "Farmer: ".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((21 / 841) * 100).h),
                                child: Text(
                                  PrefUtils().getFarmerName(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.black,
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Center(
                      child: BlocSelector<SearchFarmerBloc, SearchFarmerState,
                          List<FdetailsItemModel>?>(
                        selector: (state) => state.fmodel,
                        builder: (context, models) {
                          return Visibility(
                            visible: models!.isEmpty,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: DeviceExt((24 / 841) * 100).h,
                                    top: ((60 / 411) * 100).w),
                                child: Text(
                                  "No Farms Found".tr,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontSize: Device.orientation ==
                                            Orientation.portrait
                                        ? DeviceExt(2).h
                                        : DeviceExt(2.5).w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: DeviceExt((9 / 841) * 100).h,
                          top: ((5 / 411) * 100).w,
                          right: DeviceExt((9 / 841) * 100).h),
                      child: BlocSelector<SearchFarmerBloc, SearchFarmerState,
                          List<FdetailsItemModel>?>(
                        selector: (state) => state.fmodel,
                        builder: (context, models) {
                          return Column(
                            children: [
                              ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: ((18 / 411) * 100).w);
                                  },
                                  itemCount: models?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    FdetailsItemModel model =
                                        models?[index] ?? FdetailsItemModel();
                                    return FdetailsItemWidget(
                                      model,
                                      edit: () => addorEdit(
                                        context,
                                        1,
                                        model.id!,
                                      ),
                                      delete: () => delete(context, model.id!),
                                    );
                                  }),
                            ],
                          );
                        },
                      ),
                    ),
                    BlocSelector<SearchFarmerBloc, SearchFarmerState,
                        TextEditingController?>(
                      selector: (state) => state.searchController,
                      builder: (context, searchController) {
                        return CustomElevatedButton(
                          text: "lbl_search_farmer".tr,
                          height: Device.orientation == Orientation.portrait
                              ? DeviceExt(6).h
                              : 8.w,
                          width: DeviceExt((450 / 841) * 100).h,
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
                            if (_formKey.currentState!.validate()) {
                              _firstTextFieldFocus.unfocus();
                              context
                                  .read<SearchFarmerBloc>()
                                  .add(FarmerSearchEvent(
                                    idNo: searchController?.text,
                                    onError: () => farmerNotFound(context),
                                  ));
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  addorEdit(BuildContext context, int id, int crop) {
    if (PrefUtils().getFound()) {
      context.read<SearchFarmerBloc>().add(
            AddEditEvent(
              value: id,
              crop: crop,
              createSuccessful: () {
                onTapSearchfarmer(context);
              },
              createFailed: () {
                onTapSearchfarmer(context);
              },
            ),
          );
    } else {
      closedialog(context, "Search Farmer First",
          "Kindly search a farmer to add a new farm");
    }
  }

  delete(BuildContext context, int id) async {
    String label = "Delete Farm Entry";
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

    context.read<SearchFarmerBloc>().add(
          DeleteEvent(
            value: id,
          ),
        );
  }

  farmerNotFound(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              content: HomeFarmerFoundDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
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

  onTapMenuone(BuildContext context) {
    _scaffoldKey.currentState?.openDrawer();
  }

  /// Navigates to the searchFarmerFoundScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the searchFarmerFoundScreen.
  onTapSearchfarmer(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmerRegistrationScreen,
    );
  }
}
