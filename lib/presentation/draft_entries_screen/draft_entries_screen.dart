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

class DraftEntriesScreen extends StatelessWidget {
  const DraftEntriesScreen({Key? key}) : super(key: key);

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
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                height: 54.v,
                leadingWidth: 48.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgMenu,
                    margin:
                        EdgeInsets.only(left: 24.h, top: 12.v, bottom: 18.v)),
                centerTitle: true,
                title: AppbarSubtitle1(text: "lbl_draft_entries".tr),
                actions: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgFrame34,
                      margin:
                          EdgeInsets.symmetric(horizontal: 11.h, vertical: 5.v),
                      onTap: () {
                        onTapImage(context);
                      })
                ]),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("lbl_surname".tr,
                            style: CustomTextStyles.titleMediumSemiBold),
                        Text("lbl_id".tr,
                            style: CustomTextStyles.titleMediumSemiBold),
                        Text("lbl_actions".tr,
                            style: CustomTextStyles.titleMediumSemiBold)
                      ]),
                  SizedBox(height: 24.v),
                  Expanded(
                      child: BlocSelector<DraftEntriesBloc, DraftEntriesState,
                              DraftEntriesModel?>(
                          selector: (state) => state.draftEntriesModelObj,
                          builder: (context, draftEntriesModelObj) {
                            return ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 12.v);
                                },
                                itemCount: draftEntriesModelObj
                                        ?.balancehistoryItemList.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  BalancehistoryItemModel model =
                                      draftEntriesModelObj
                                              ?.balancehistoryItemList[index] ??
                                          BalancehistoryItemModel();
                                  return BalancehistoryItemWidget(model);
                                });
                          }))
                ]))));
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
}
