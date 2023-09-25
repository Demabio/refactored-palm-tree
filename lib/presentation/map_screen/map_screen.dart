import 'bloc/map_bloc.dart';import 'models/map_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/widgets/custom_elevated_button.dart';import 'package:kiamis_app/widgets/custom_outlined_button.dart';class MapScreen extends StatelessWidget {const MapScreen({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<MapBloc>(create: (context) => MapBloc(MapState(mapModelObj: MapModel()))..add(MapInitialEvent()), child: MapScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return BlocBuilder<MapBloc, MapState>(builder: (context, state) {return SafeArea(child: Scaffold(extendBody: true, extendBodyBehindAppBar: true, body: Container(width: mediaQueryData.size.width, height: mediaQueryData.size.height, decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.imgGroup332), fit: BoxFit.cover)), child: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 37.v), child: Column(children: [Spacer(), CustomImageView(svgPath: ImageConstant.imgLocation, height: 43.v, width: 36.h)]))), bottomNavigationBar: GestureDetector(onTap: () {onTapRowback(context);}, child: Padding(padding: EdgeInsets.only(left: 21.h, right: 21.h, bottom: 37.v), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [CustomOutlinedButton(width: 170.h, text: "lbl_back".tr, buttonStyle: CustomButtonStyles.outlinePrimaryTL10, buttonTextStyle: CustomTextStyles.bodyLargePrimary_1), CustomElevatedButton(width: 159.h, text: "lbl_set".tr)])))));}); } 
/// Navigates to the primaryFarmHoldingTwoScreen when the action is triggered.
///
/// The [BuildContext] parameter is used to build the navigation stack.
/// When the action is triggered, this function uses the [NavigatorService]
/// to push the named route for the primaryFarmHoldingTwoScreen.
onTapRowback(BuildContext context) { NavigatorService.pushNamed(AppRoutes.primaryFarmHoldingTwoScreen, ); } 
 }
