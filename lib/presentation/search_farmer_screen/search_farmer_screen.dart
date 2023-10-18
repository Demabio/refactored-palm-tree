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
              height: 47.v,
              leadingWidth: 60.h,
              leading: AppbarImage(
                  svgPath: ImageConstant.imgMenu,
                  margin: EdgeInsets.only(
                    left: ResponsiveExtension(24).h,
                    top: 8.v,
                    bottom: 15.v,
                  ),
                  onTap: () {
                    onTapMenuone(context);
                  }),
              centerTitle: true,
              title: AppbarSubtitle1(text: "lbl_search_farmer".tr),
              actions: [
                AppbarImage1(
                    svgPath: ImageConstant.imgFrame34WhiteA700,
                    margin: EdgeInsets.fromLTRB(11.h, 5.v, 11.h, 9.v),
                    onTap: () {
                      addorEdit(context, 0, 0);
                    })
              ],
              styleType: Style.bgFill),
          drawer: SideMenuDraweritem(),
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 7.v),
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
                                    focusNode: _firstTextFieldFocus,
                                    margin: EdgeInsets.fromLTRB(
                                        24.h, 24.v, 24.h, 12.v),
                                    controller: searchController,
                                    hintText: "msg_search_id_number".tr,
                                    prefix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            16.h, 12.v, 10.h, 12.v),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgSearch)),
                                    prefixConstraints:
                                        BoxConstraints(maxHeight: 40.v),
                                    suffix: Padding(
                                        padding: EdgeInsets.only(right: 15.h),
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
                                padding: EdgeInsets.only(left: 21.h),
                                child: Text(
                                  "Farmer: ".tr,
                                  style: CustomTextStyles.labelMediumPrimary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 21.h),
                                child: Text(
                                  name ?? "Search Farmer",
                                  style: theme.textTheme.labelMedium,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h, top: 5.v, right: 9.h),
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
                                    return SizedBox(height: 18.v);
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.h, vertical: 69.v),
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 9.h),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgVolume)),
                          buttonTextStyle:
                              CustomTextStyles.titleMediumWhiteA700,
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
    if (crop > 0) {
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
