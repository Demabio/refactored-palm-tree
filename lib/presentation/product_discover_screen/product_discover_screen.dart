import '../product_discover_screen/widgets/productdetails1_item_widget.dart';import 'bloc/product_discover_bloc.dart';import 'models/product_discover_model.dart';import 'models/productdetails1_item_model.dart';import 'package:flutter/material.dart';import 'package:kiamis_app/core/app_export.dart';import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_3.dart';import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';class ProductDiscoverScreen extends StatelessWidget {const ProductDiscoverScreen({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<ProductDiscoverBloc>(create: (context) => ProductDiscoverBloc(ProductDiscoverState(productDiscoverModelObj: ProductDiscoverModel()))..add(ProductDiscoverInitialEvent()), child: ProductDiscoverScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(appBar: CustomAppBar(height: 56.v, leadingWidth: 40.h, leading: AppbarImage(svgPath: ImageConstant.imgArrowleftGray9000124x24, margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v), onTap: () {onTapArrowleftone(context);}), centerTitle: true, title: AppbarSubtitle3(text: "lbl_shopsie".tr)), body: Padding(padding: EdgeInsets.only(left: 16.h, top: 5.v, right: 16.h), child: BlocSelector<ProductDiscoverBloc, ProductDiscoverState, ProductDiscoverModel?>(selector: (state) => state.productDiscoverModelObj, builder: (context, productDiscoverModelObj) {return GridView.builder(shrinkWrap: true, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 309.v, crossAxisCount: 2, mainAxisSpacing: 16.h, crossAxisSpacing: 16.h), physics: BouncingScrollPhysics(), itemCount: productDiscoverModelObj?.productdetails1ItemList.length ?? 0, itemBuilder: (context, index) {Productdetails1ItemModel model = productDiscoverModelObj?.productdetails1ItemList[index] ?? Productdetails1ItemModel(); return Productdetails1ItemWidget(model);});})))); } 


/// Navigates to the previous screen.
///
/// This function takes a [BuildContext] object as a parameter, which is
/// used to build the navigation stack. When the action is triggered, this
/// function uses the [NavigatorService] to navigate to the previous screen
/// in the navigation stack.
onTapArrowleftone(BuildContext context) { NavigatorService.goBack(); } 
 }
