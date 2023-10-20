import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/dynamic_dialog.dart';
import 'package:kiamis_app/presentation/side_menu_draweritem/side_menu_draweritem.dart';

import '../draft_entries_screen/widgets/balancehistory_item_widget.dart';
import 'bloc/draft_entries_bloc.dart';
import 'models/balancehistory_item_model.dart';
import 'models/draft_entries_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/dynamic_dialog_2.dart';

// ignore: must_be_immutable
class DraftEntriesScreen extends StatelessWidget {
  DraftEntriesScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<DraftEntriesBloc>(
        create: (context) => DraftEntriesBloc(
            DraftEntriesState(draftEntriesModelObj: DraftEntriesModel()))
          ..add(DraftEntriesInitialEvent()),
        child: DraftEntriesScreen());
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
              drawer: SideMenuDraweritem(),
              key: _scaffoldKey,
              appBar: CustomAppBar(
                  height: 54.v,
                  leadingWidth: 48.h,
                  leading: AppbarImage(
                      onTap: () => onTapMenuone(context),
                      svgPath: ImageConstant.imgMenu,
                      margin:
                          EdgeInsets.only(left: 24.h, top: 12.v, bottom: 18.v)),
                  centerTitle: true,
                  title: AppbarSubtitle1(
                      text: "${PrefUtils().getAction()} Farmers".tr),
                  actions: [
                    AppbarImage1(
                        svgPath: ImageConstant.imgFrame34,
                        margin: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 5.v),
                        onTap: () {
                          onTapImage(context);
                        })
                  ]),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("lbl_surname".tr,
                              style: CustomTextStyles.titleMediumSemiBold),
                          Spacer(),
                          Text("ID Number".tr,
                              style: CustomTextStyles.titleMediumSemiBold),
                          Spacer(),
                          Text("lbl_actions".tr,
                              style: CustomTextStyles.titleMediumSemiBold)
                        ]),
                    SizedBox(height: 24.v),
                    Center(
                      child: BlocSelector<DraftEntriesBloc, DraftEntriesState,
                          List<BalancehistoryItemModel>?>(
                        selector: (state) =>
                            state.draftEntriesModelObj?.balancehistoryItemList,
                        builder: (context, models) {
                          return Visibility(
                            visible: models!.isEmpty,
                            child: Padding(
                                padding: EdgeInsets.only(left: 24.h, top: 60.v),
                                child: Text("No Farmers Found".tr,
                                    style:
                                        CustomTextStyles.titleMediumSemiBold)),
                          );
                        },
                      ),
                    ),
                    Expanded(
                        child: BlocSelector<DraftEntriesBloc, DraftEntriesState,
                                DraftEntriesModel?>(
                            selector: (state) => state.draftEntriesModelObj,
                            builder: (context, draftEntriesModelObj) {
                              return ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 5.v);
                                  },
                                  itemCount: draftEntriesModelObj
                                          ?.balancehistoryItemList.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    BalancehistoryItemModel model =
                                        draftEntriesModelObj
                                                    ?.balancehistoryItemList[
                                                index] ??
                                            BalancehistoryItemModel();
                                    return BalancehistoryItemWidget(
                                      model,
                                      edit: () => addorEdit(
                                        context,
                                        1,
                                        model.id!,
                                        model.name!,
                                      ),
                                      delete: () => delete(context, model.id!),
                                    );
                                  });
                            }))
                  ])))),
    );
  }

  /// Displays an [AlertDialog] with a custom content widget using the
  /// provided [BuildContext].
  ///
  /// The custom content widget is created by calling
  /// [DraftEntriesClearDraftsModalDialog.builder] method.
  onTapImage(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: DynamicDialogTwo.builder(context, "", ""),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  addorEdit(BuildContext context, int id, int crop, String name) {
    context.read<DraftEntriesBloc>().add(
          AddEditEvent(
            value: id,
            crop: crop,
            name: name,
            createSuccessful: () {
              onTapSearchfarmer(context);
            },
            createFailed: () {
              onTapSearchfarmer(context);
            },
          ),
        );
  }

  onTapMenuone(BuildContext context) {
    _scaffoldKey.currentState?.openDrawer();
  }

  delete(BuildContext context, int id) async {
    String label = "Delete Farmer Entry";
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

    context.read<DraftEntriesBloc>().add(
          DeleteEvent(
            value: id,
          ),
        );
  }

  onTapSearchfarmer(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.farmerRegistrationScreen,
    );
  }
}
