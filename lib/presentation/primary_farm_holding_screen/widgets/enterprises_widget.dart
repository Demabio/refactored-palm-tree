import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import 'package:kiamis_app/widgets/custom_checkbox_button.dart';

// ignore: must_be_immutable
class EnterprisesItemWidget extends StatelessWidget {
  EnterprisesItemWidget(
    this.enterpriseModel, {
    Key? key,
    this.onSelect,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  EnterpriseModel enterpriseModel;

  Function(bool)? onSelect;

  double? height;

  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Text(
        enterpriseModel.title,
        style: theme.textTheme.labelMedium,
      ),
    );
  }
}
