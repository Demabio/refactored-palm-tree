import '../models/productdetails1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore: must_be_immutable
class Productdetails1ItemWidget extends StatelessWidget {
  Productdetails1ItemWidget(
    this.productdetails1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Productdetails1ItemModel productdetails1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage236x171,
          height: 236.v,
          width: 171.h,
          radius: BorderRadius.circular(
            8.h,
          ),
        ),
        SizedBox(height: 10.v),
        Text(
          productdetails1ItemModelObj.productName!,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium!.copyWith(
            height: 1.50,
          ),
        ),
        SizedBox(height: 11.v),
        Text(
          productdetails1ItemModelObj.productPrice!,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.bodyMediumIndigoA200_1,
        ),
      ],
    );
  }
}
