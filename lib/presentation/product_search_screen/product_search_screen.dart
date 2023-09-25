import '../product_search_screen/widgets/gridproductname_item_widget.dart';
import 'bloc/product_search_bloc.dart';
import 'models/gridproductname_item_model.dart';
import 'models/product_search_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_text_form_field.dart';

class ProductSearchScreen extends StatelessWidget {
  const ProductSearchScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ProductSearchBloc>(
      create: (context) => ProductSearchBloc(ProductSearchState(
        productSearchModelObj: ProductSearchModel(),
      ))
        ..add(ProductSearchInitialEvent()),
      child: ProductSearchScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: 390.h,
          padding: EdgeInsets.symmetric(
            horizontal: 11.h,
            vertical: 24.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 5.v),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      BlocSelector<ProductSearchBloc, ProductSearchState,
                          TextEditingController?>(
                        selector: (state) => state.searchoneController,
                        builder: (context, searchoneController) {
                          return CustomTextFormField(
                            controller: searchoneController,
                            hintText: "lbl_sl_iders".tr,
                            textInputAction: TextInputAction.done,
                            prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(10.h, 18.v, 6.h, 18.v),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgSearch1,
                              ),
                            ),
                            prefixConstraints: BoxConstraints(
                              maxHeight: 56.v,
                            ),
                            suffix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(30.h, 19.v, 10.h, 17.v),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgClose,
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              maxHeight: 56.v,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 17.v),
                            borderDecoration:
                                TextFormFieldStyleHelper.fillWhiteA1,
                            fillColor: appTheme.whiteA700,
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 5.h,
                            top: 29.v,
                            right: 5.h,
                          ),
                          child: BlocSelector<ProductSearchBloc,
                              ProductSearchState, ProductSearchModel?>(
                            selector: (state) => state.productSearchModelObj,
                            builder: (context, productSearchModelObj) {
                              return GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 199.v,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16.h,
                                  crossAxisSpacing: 16.h,
                                ),
                                physics: BouncingScrollPhysics(),
                                itemCount: productSearchModelObj
                                        ?.gridproductnameItemList.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  GridproductnameItemModel model =
                                      productSearchModelObj
                                                  ?.gridproductnameItemList[
                                              index] ??
                                          GridproductnameItemModel();
                                  return GridproductnameItemWidget(
                                    model,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
