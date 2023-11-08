import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomSearchView extends StatelessWidget {
  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.enabled = false,
    this.onChanged,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final bool? enabled;

  final Function(String)? onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchViewWidget,
          )
        : searchViewWidget;
  }

  Widget get searchViewWidget => Container(
        width: width ?? double.maxFinite,
        margin: margin,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus!,
          style: textStyle ?? CustomTextStyles.bodyMediumPoppinsBluegray40003,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          enabled: enabled,
          onChanged: (value) {
            onChanged!(value);
          },
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyMediumPoppinsGray500,
        prefixIcon: prefix,
        errorStyle: CustomTextStyles.errorstyle,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix ??
            Padding(
              padding: EdgeInsets.only(
                right: DeviceExt((15 / 841) * 100).h,
              ),
              child: IconButton(
                onPressed: () => controller!.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.only(
              left: DeviceExt((13 / 841) * 100).h,
              top: DeviceExt((13 / 411) * 100).w,
              bottom: DeviceExt((13 / 411) * 100).w,
            ),
        fillColor: fillColor ?? theme.colorScheme.primaryContainer,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(DeviceExt((13 / 841) * 100).h),
              borderSide: BorderSide(
                color: appTheme.gray200,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(DeviceExt((13 / 841) * 100).h),
              borderSide: BorderSide(
                color: appTheme.gray200,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(DeviceExt((13 / 841) * 100).h),
              borderSide: BorderSide(
                color: appTheme.gray200,
                width: 1,
              ),
            ),
      );
}

/// Extension on [CustomSearchView] to facilitate inclusion of all types of border style etc
extension SearchViewStyleHelper on CustomSearchView {
  static OutlineInputBorder get fillPrimaryContainerTL20 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(DeviceExt((20 / 841) * 100).h),
        borderSide: BorderSide.none,
      );
}
