import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';

// ignore: must_be_immutable
class EnterprisesItemWidget extends StatelessWidget {
  EnterprisesItemWidget(
    this.enterpriseModel, {
    Key? key,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  EnterpriseModel enterpriseModel;

  double? height;

  double? width;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: enterpriseModel.isSelected,
      child: Container(
        alignment: Alignment.centerLeft,
        height: height,
        width: width,
        child: Text(
          enterpriseModel.title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.black,
            fontSize: Device.orientation == Orientation.portrait
                ? DeviceExt(1.5).h
                : DeviceExt(2).w,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
