import '../history_screen/widgets/sectionlistdura_item_widget.dart';import 'bloc/history_bloc.dart';import 'models/history_model.dart';import 'models/sectionlistdura_item_model.dart';import 'package:flutter/material.dart';import 'package:grouped_list/grouped_list.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/widgets/app_bar/appbar_iconbutton.dart';import 'package:kiamis_app/widgets/app_bar/appbar_iconbutton_1.dart';import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_2.dart';import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';class HistoryScreen extends StatelessWidget {const HistoryScreen({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<HistoryBloc>(create: (context) => HistoryBloc(HistoryState(historyModelObj: HistoryModel()))..add(HistoryInitialEvent()), child: HistoryScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(appBar: CustomAppBar(height: 49.v, leadingWidth: 59.h, leading: AppbarIconbutton(svgPath: ImageConstant.imgArrowleftBlack900, margin: EdgeInsets.only(left: 24.h, top: 7.v, bottom: 7.v), onTap: () {onTapArrowleftone(context);}), centerTitle: true, title: AppbarSubtitle2(text: "lbl_history".tr), actions: [AppbarIconbutton1(svgPath: ImageConstant.imgSearchBlack900, margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 7.v))]), body: Padding(padding: EdgeInsets.fromLTRB(24.h, 26.v, 24.h, 5.v), child: BlocSelector<HistoryBloc, HistoryState, HistoryModel?>(selector: (state) => state.historyModelObj, builder: (context, historyModelObj) {return GroupedListView<SectionlistduraItemModel, String>(shrinkWrap: true, stickyHeaderBackgroundColor: Colors.transparent, elements: historyModelObj?.sectionlistduraItemList ?? [], groupBy: (element) => element.groupBy!, sort: false, groupSeparatorBuilder: (String value) {return Padding(padding: EdgeInsets.only(top: 22.v, bottom: 17.v), child: Text(value, style: CustomTextStyles.labelMediumGray500.copyWith(color: appTheme.gray500)));}, itemBuilder: (context, model) {return SectionlistduraItemWidget(model);}, separator: SizedBox(height: 15.v));})))); } 


/// Navigates to the previous screen.
///
/// This function takes a [BuildContext] object as a parameter, which is
/// used to build the navigation stack. When the action is triggered, this
/// function uses the [NavigatorService] to navigate to the previous screen
/// in the navigation stack.
onTapArrowleftone(BuildContext context) { NavigatorService.goBack(); } 
 }
