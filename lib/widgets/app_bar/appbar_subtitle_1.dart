import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class AppbarSubtitle1 extends StatelessWidget {
  AppbarSubtitle1({
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
          maxLines: 10,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: Device.orientation == Orientation.portrait
                ? DeviceExt(2.4).h
                : DeviceExt(2.5).w,
          ),
        ),
      ),
    );
  }
}
