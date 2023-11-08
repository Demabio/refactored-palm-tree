import '../models/chipviewalbert_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class ChipviewalbertItemWidget extends StatelessWidget {
  ChipviewalbertItemWidget(
    this.chipviewalbertItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  ChipviewalbertItemModel chipviewalbertItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.all(DeviceExt((11 / 841) * 100).h),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipviewalbertItemModelObj.albertcrop,
        style: TextStyle(
          color: appTheme.whiteA700,
          fontSize: DeviceExt(1.8).h,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: chipviewalbertItemModelObj.isSelected,
      backgroundColor: theme.colorScheme.primary,
      selectedColor: theme.colorScheme.primary,
      shape: chipviewalbertItemModelObj.isSelected
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
