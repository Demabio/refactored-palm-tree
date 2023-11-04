import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.margin,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: PinCodeTextField(
          appContext: context,
          controller: controller,
          length: 4,
          backgroundColor: Colors.white,
          keyboardType: TextInputType.number,
          textStyle: textStyle ?? theme.textTheme.headlineMedium,
          hintStyle: hintStyle ?? theme.textTheme.headlineMedium,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          enableActiveFill: true,
          pinTheme: PinTheme(
            fieldHeight: Device.orientation == Orientation.portrait
                ? DeviceExt(8).h
                : 8.w,
            fieldWidth: Device.orientation == Orientation.portrait
                ? DeviceExt(8).h
                : 8.w,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(
              Device.orientation == Orientation.portrait ? DeviceExt(2).h : 2.w,
            ),
            inactiveColor: theme.colorScheme.primary,
            activeColor: Colors.white,
            inactiveFillColor: Colors.white,
            activeFillColor: Colors.white,
            selectedColor: Colors.white,
          ),
          onChanged: (value) => onChanged(value),
          validator: validator,
        ),
      );
}
