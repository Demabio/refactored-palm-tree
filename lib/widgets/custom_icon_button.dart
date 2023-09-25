import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.margin,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: SizedBox(
          height: height ?? 0,
          width: width ?? 0,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              padding: padding ?? EdgeInsets.zero,
              decoration: decoration ??
                  BoxDecoration(
                    color: appTheme.blueGray40003,
                    borderRadius: BorderRadius.circular(15.h),
                  ),
              child: child,
            ),
            onPressed: onTap,
          ),
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(22.h),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(15.h),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(
          color: appTheme.gray20001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(16.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue50,
        borderRadius: BorderRadius.circular(15.h),
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        borderRadius: BorderRadius.circular(17.h),
        border: Border.all(
          color: appTheme.blueGray100,
          width: 1.h,
        ),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray10001,
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA70026,
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillGreenA => BoxDecoration(
        color: appTheme.greenA70026,
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillPink => BoxDecoration(
        color: appTheme.pink400.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillBlueA => BoxDecoration(
        color: appTheme.blueA70001.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue800.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillAmber => BoxDecoration(
        color: appTheme.amber600.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillLightBlueTL13 => BoxDecoration(
        color: appTheme.lightBlue500.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillGrayTL13 => BoxDecoration(
        color: appTheme.gray40001.withOpacity(0.15),
        borderRadius: BorderRadius.circular(13.h),
      );
  static BoxDecoration get fillGrayTL7 => BoxDecoration(
        color: appTheme.gray50,
        borderRadius: BorderRadius.circular(7.h),
      );
  static BoxDecoration get fillDeepPurple => BoxDecoration(
        color: appTheme.deepPurple50,
        borderRadius: BorderRadius.circular(5.h),
      );
  static BoxDecoration get fillPrimaryContainerTL12 => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12.h),
      );
  static BoxDecoration get fillBlueTL5 => BoxDecoration(
        color: appTheme.blue50,
        borderRadius: BorderRadius.circular(5.h),
      );
}
