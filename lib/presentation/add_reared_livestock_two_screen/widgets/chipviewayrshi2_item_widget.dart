import '../models/chipviewayrshi2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class Chipviewayrshi2ItemWidget extends StatelessWidget {
  Chipviewayrshi2ItemWidget(
    this.chipviewayrshi2ItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  Chipviewayrshi2ItemModel chipviewayrshi2ItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceExt((27 / 841) * 100).h,
        vertical: DeviceExt((11 / 411) * 100).w,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipviewayrshi2ItemModelObj.ayrshi,
        style: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 13.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: chipviewayrshi2ItemModelObj.isSelected,
      backgroundColor: theme.colorScheme.primary,
      selectedColor: theme.colorScheme.primary,
      shape: chipviewayrshi2ItemModelObj.isSelected
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.whiteA700.withOpacity(0.6),
                width: DeviceExt((1 / 841) * 100).h,
              ),
              borderRadius: BorderRadius.circular(
                DeviceExt((10 / 841) * 100).h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                DeviceExt((10 / 841) * 100).h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
