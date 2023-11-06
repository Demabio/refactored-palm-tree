import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitle2 extends StatelessWidget {
  AppbarSubtitle2({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: Device.orientation == Orientation.portrait
                ? DeviceExt(2.4).h
                : DeviceExt(2.5).w,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
