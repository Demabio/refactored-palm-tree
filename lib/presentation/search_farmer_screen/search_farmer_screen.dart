import 'package:kiamis_app/presentation/search_farmer_screen/models/farm_item_model.dart';
import 'package:kiamis_app/presentation/search_farmer_screen/widgets/farmdetails_item_widget.dart';

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
    return SafeArea(
      child: Scaffold(
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
                        CustomAppBar(
                            height: 30.v,
                            leadingWidth: 48.h,
                            leading: AppbarImage(
                                svgPath: ImageConstant.imgMenu,
                                margin:
                                    EdgeInsets.only(left: 24.h, bottom: 5.v)),
                            centerTitle: true,
                            title:
                                AppbarSubtitle1(text: "lbl_search_farmer".tr)),
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
                        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<SearchFarmerBloc>()
                                .add(FarmerSearchEvent(
                                  onError: () => onTapSearchfarmer(context),
                                  onSuccess: () => onTapSearchfarmer(context),
                                  idNo: searchController?.text,
                                ));
                          }
                        },
                      );
                    },
                  ),
                  BlocSelector<SearchFarmerBloc, SearchFarmerState, String?>(
                    selector: (state) => state.name,
                    builder: (context, name) {
                      return Visibility(
                        visible: PrefUtils().getFound(),
                        child: Row(
                          children: [
                            Text(
                              "Farmer Name: ".tr,
                              style: CustomTextStyles.labelMediumPrimary,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 21.h),
                              child: Text(
                                name ?? "N/A",
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  BlocSelector<SearchFarmerBloc, SearchFarmerState,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addorEdit(BuildContext context, int id, int crop) {
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
  }

  delete(BuildContext context, int id) {
    context.read<SearchFarmerBloc>().add(
          DeleteEvent(
            value: id,
          ),
        );
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
