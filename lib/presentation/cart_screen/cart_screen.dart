import '../cart_screen/widgets/productdetails_item_widget.dart';
import 'bloc/cart_bloc.dart';
import 'models/cart_model.dart';
import 'models/productdetails_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_image.dart';
import 'package:kiamis_app/widgets/app_bar/appbar_subtitle_3.dart';
import 'package:kiamis_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc(CartState(
        cartModelObj: CartModel(),
      ))
        ..add(CartInitialEvent()),
      child: CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 64.v,
          leadingWidth: 39.h,
          leading: AppbarImage(
            svgPath: ImageConstant.imgMenuBlueGray10004,
            margin: EdgeInsets.only(
              left: 15.h,
              top: 18.v,
              bottom: 22.v,
            ),
          ),
          centerTitle: true,
          title: AppbarSubtitle3(
            text: "lbl_shopsie".tr,
          ),
          styleType: Style.bgFill,
        ),
        body: SizedBox(
          width: 390.h,
          child: Column(
            children: [
              SizedBox(height: 24.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.v),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 26.h),
                            child: Text(
                              "lbl_my_cart".tr,
                              style: CustomTextStyles.bodyLargeLatoGray90001,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.h,
                            top: 26.v,
                            right: 16.h,
                          ),
                          child: BlocSelector<CartBloc, CartState, CartModel?>(
                            selector: (state) => state.cartModelObj,
                            builder: (context, cartModelObj) {
                              return ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (
                                  context,
                                  index,
                                ) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0.v),
                                    child: SizedBox(
                                      width: 358.h,
                                      child: Divider(
                                        height: 1.v,
                                        thickness: 1.v,
                                        color: appTheme.gray20001,
                                      ),
                                    ),
                                  );
                                },
                                itemCount: cartModelObj
                                        ?.productdetailsItemList.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  ProductdetailsItemModel model = cartModelObj
                                          ?.productdetailsItemList[index] ??
                                      ProductdetailsItemModel();
                                  return ProductdetailsItemWidget(
                                    model,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 98.v),
                        Divider(
                          color: appTheme.gray20001,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.h,
                            top: 21.v,
                            right: 16.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.v),
                                child: Text(
                                  "lbl_sub_total".tr,
                                  style: CustomTextStyles.bodyMedium14,
                                ),
                              ),
                              Text(
                                "lbl_111_80".tr,
                                style: CustomTextStyles.bodyLargeLatoGray90001,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 21.v),
                        Divider(
                          color: appTheme.gray20001,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          height: 48.v,
          text: "lbl_pay_111_80".tr,
          margin: EdgeInsets.only(
            left: 32.h,
            right: 32.h,
            bottom: 64.v,
          ),
          buttonStyle: CustomButtonStyles.fillIndigoA,
          buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
        ),
      ),
    );
  }
}
