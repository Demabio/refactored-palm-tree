import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';

// ignore: must_be_immutable
class ProdSysItemWidget extends StatelessWidget {
  ProdSysItemWidget(
    this.enterpriseModel, {
    Key? key,
    this.height,
    this.width,
  }) : super(
          key: key,
        );

  CheckBoxList enterpriseModel;

  double? height;

  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: height,
      width: width,
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    "Production System:",
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Text(
                    enterpriseModel.title,
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Text(
                "No of active units",
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
              Spacer(),
              Text(
                enterpriseModel.var1 ?? "0",
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Active Volume(M3)",
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
              Spacer(),
              Text(
                enterpriseModel.var2 ?? "N/A",
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "No of inactive units",
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
              Spacer(),
              Text(
                enterpriseModel.var3 ?? "N/A",
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "InActive Volume(M3)",
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
              Spacer(),
              Text(
                enterpriseModel.var4 ?? "N/A",
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
