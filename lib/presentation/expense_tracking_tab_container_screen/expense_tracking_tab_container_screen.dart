import 'bloc/expense_tracking_tab_container_bloc.dart';import 'models/expense_tracking_tab_container_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/presentation/expense_tracking_page/expense_tracking_page.dart';import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';import 'package:kiamis_app/widgets/app_bar/appbar_image_1.dart';import 'package:kiamis_app/widgets/app_bar/appbar_title.dart';import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';class ExpenseTrackingTabContainerScreen extends StatefulWidget {const ExpenseTrackingTabContainerScreen({Key? key}) : super(key: key);

@override ExpenseTrackingTabContainerScreenState createState() =>  ExpenseTrackingTabContainerScreenState();
static Widget builder(BuildContext context) { return BlocProvider<ExpenseTrackingTabContainerBloc>(create: (context) => ExpenseTrackingTabContainerBloc(ExpenseTrackingTabContainerState(expenseTrackingTabContainerModelObj: ExpenseTrackingTabContainerModel()))..add(ExpenseTrackingTabContainerInitialEvent()), child: ExpenseTrackingTabContainerScreen()); } 
 }

// ignore_for_file: must_be_immutable
class ExpenseTrackingTabContainerScreenState extends State<ExpenseTrackingTabContainerScreen> with  TickerProviderStateMixin {late TabController tabviewController;

@override void initState() { super.initState(); tabviewController = TabController(length: 2, vsync: this); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return BlocBuilder<ExpenseTrackingTabContainerBloc, ExpenseTrackingTabContainerState>(builder: (context, state) {return SafeArea(child: Scaffold(backgroundColor: appTheme.gray5001, appBar: CustomAppBar(height: 53.v, leadingWidth: 40.h, leading: AppbarImage(svgPath: ImageConstant.imgArrowleftOnprimarycontainer, margin: EdgeInsets.only(left: 16.h, top: 12.v, bottom: 17.v), onTap: () {onTapArrowleftone(context);}), centerTitle: true, title: AppbarTitle(text: "msg_expense_tracking".tr), actions: [AppbarImage1(svgPath: ImageConstant.imgMorevertical, margin: EdgeInsets.fromLTRB(16.h, 12.v, 16.h, 17.v))]), body: SizedBox(width: mediaQueryData.size.width, child: SingleChildScrollView(padding: EdgeInsets.only(top: 20.v), child: Column(children: [SizedBox(height: 52.v, width: 396.h, child: TabBar(controller: tabviewController, labelPadding: EdgeInsets.zero, labelColor: appTheme.blueGray400, labelStyle: TextStyle(fontSize: 16.fSize, fontFamily: 'Inter', fontWeight: FontWeight.w400), unselectedLabelColor: appTheme.blueA700, unselectedLabelStyle: TextStyle(fontSize: 16.fSize, fontFamily: 'Inter', fontWeight: FontWeight.w400), indicatorPadding: EdgeInsets.all(1.5.h), indicator: BoxDecoration(color: appTheme.gray5001, border: Border.all(color: appTheme.blueGray10001, width: 1.h)), tabs: [Tab(child: Text("lbl_this_month".tr)), Tab(child: Text("lbl_last_month".tr))])), SizedBox(height: 753.v, child: TabBarView(controller: tabviewController, children: [ExpenseTrackingPage.builder(context), ExpenseTrackingPage.builder(context)]))])))));}); } 


/// Navigates to the previous screen.
///
/// This function takes a [BuildContext] object as a parameter, which is
/// used to build the navigation stack. When the action is triggered, this
/// function uses the [NavigatorService] to navigate to the previous screen
/// in the navigation stack.
onTapArrowleftone(BuildContext context) { NavigatorService.goBack(); } 
 }
