import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.bold,
      );
  static get bodyLargeBluegray40003 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray40003,
        fontSize: DeviceExt(2).h,
      );
  static get bodyLargeBluegray90001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: DeviceExt(2).h,
      );
  static get bodyLargeInter => theme.textTheme.bodyLarge!.inter.copyWith(
        fontSize: DeviceExt(2).h,
      );
  static get bodyLargeInter16 => theme.textTheme.bodyLarge!.inter.copyWith(
        fontSize: DeviceExt(2).h,
      );
  static get bodyLargeInterBlack900 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeInterBlueA700 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.blueA700,
        fontSize: DeviceExt(2).h,
      );
  static get bodyLargeInterBluegray400 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.blueGray400,
        fontSize: DeviceExt(2).h,
      );
  static get bodyLargeInterGreen600 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.green600,
      );
  static get bodyLargeInterOnPrimaryContainer =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyLargeInterRed700 => theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.red700,
      );
  static get bodyLargeInter_1 => theme.textTheme.bodyLarge!.inter;
  static get bodyLargeLatoGray90001 => theme.textTheme.bodyLarge!.lato.copyWith(
        color: appTheme.gray90001,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.bold,
      );
  static get bodyLargePrimarywhite => theme.textTheme.bodyLarge!.copyWith(
        color: Colors.white,
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.bold,
      );
  static get bodyLargePrimary_1 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.62),
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.bold,
      );
  static get bodyLargePrimary_2 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.bold,
      );
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMedium14_1 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumBluegray10003 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray10003,
        fontSize: 14.fSize,
      );
  static get bodyMediumBluegray40001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray40001,
        fontSize: 14.fSize,
      );
  static get bodyMediumBluegray40002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray40002,
      );
  static get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600,
        fontSize: 14.fSize,
      );
  static get bodyMediumGray60001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60001,
      );
  static get bodyMediumGray6000114 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60001,
        fontSize: 14.fSize,
      );
  static get bodyMediumGray6000114_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60001,
        fontSize: 14.fSize,
      );
  static get bodyMediumGray60002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60002,
        fontSize: 14.fSize,
      );
  static get bodyMediumGray60003 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60003,
        fontSize: 14.fSize,
      );
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
        fontSize: 14.fSize,
      );
  static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 14.fSize,
      );
  static get bodyMediumGray90002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodyMediumGray90002_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodyMediumGray90014 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 14.fSize,
      );
  static get bodyMediumIndigoA200 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.indigoA200,
        fontSize: 14.fSize,
      );
  static get bodyMediumIndigoA200_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.indigoA200,
      );
  static get bodyMediumInterBluegray400 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.blueGray400,
        fontSize: 14.fSize,
      );
  static get bodyMediumInterBluegray40003 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.blueGray40003,
      );
  static get bodyMediumInterWhiteA700 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
      );
  static get bodyMediumMontserrat => theme.textTheme.bodyMedium!.montserrat;
  static get bodyMediumPoppinsBlack900 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
      );
  static get bodyMediumPoppinsBluegray40003 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.blueGray40003,
      );
  static get bodyMediumPoppinsGray500 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.gray500,
        fontSize: DeviceExt(1.8).h,
      );
  static get bodyMediumPoppinsWhiteA700 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumWhiteA700_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMedium_1 => theme.textTheme.bodyMedium!;
  static get bodySmallBluegray40003 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray40003,
      );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
        fontSize: 10.fSize,
      );
  static get bodySmallIndigoA100 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigoA100,
        fontSize: 10.fSize,
      );
  static get bodySmallLatoGray20001 => theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.gray20001,
      );
  static get bodySmallLatoGray50001 => theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.gray50001,
      );
  static get bodySmallLatoGray60001 => theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.gray60001,
      );
  static get bodySmallLatoGray90001 => theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.gray90001,
        fontSize: DeviceExt(1.8).h,
      );

  static get errorstyle => theme.textTheme.bodySmall!.lato.copyWith(
        color: const Color.fromARGB(255, 240, 16, 0),
        fontSize: DeviceExt(1.8).h,
      );
  static get bodySmallPoppinsGray500 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray500,
        fontSize: 10.fSize,
      );
  static get bodySmallPoppinsWhiteA700 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700.withOpacity(0.7),
      );
  static get bodySmallWhiteA70011 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700.withOpacity(0.7),
        fontSize: 11.fSize,
      );
  // Display text style
  static get displayMediumMontserratGray20001 =>
      theme.textTheme.displayMedium!.montserrat.copyWith(
        color: appTheme.gray20001,
      );
  static get displaySmallGray400 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.gray400,
        fontSize: 35.fSize,
        fontWeight: FontWeight.w400,
      );
  static get displaySmallInterWhiteA700 =>
      theme.textTheme.displaySmall!.inter.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w400,
      );
  static get displaySmallLatoGray20001 =>
      theme.textTheme.displaySmall!.lato.copyWith(
        color: appTheme.gray20001,
        fontWeight: FontWeight.w500,
      );
  // Headline text style
  static get headlineLargeBlack900 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 30.fSize,
        fontWeight: FontWeight.w500,
      );
  static get headlineLargeYellowA700 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.yellowA700,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallInterOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallLatoGray900 =>
      theme.textTheme.headlineSmall!.lato.copyWith(
        color: appTheme.gray900,
      );
  static get headlineSmallLatoGray90001 =>
      theme.textTheme.headlineSmall!.lato.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelLargeInterGreen600 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        fontSize: DeviceExt(2).h,
        color: appTheme.green600,
      );
  static get labelLargeInterRed700 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        fontSize: DeviceExt(2).h,
        color: appTheme.red700,
      );
  static get labelLargeLatoGray90001 =>
      theme.textTheme.labelLarge!.lato.copyWith(
        color: appTheme.gray90001,
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimaryBold => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumGray500 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray500,
        fontSize: DeviceExt(1.8).h,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumMedium => theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: DeviceExt(1.8).h,
      );
  static get labelMediumMedium10 => theme.textTheme.labelMedium!.copyWith(
        fontSize: DeviceExt(1.8).h,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumMedium10_1 => theme.textTheme.labelMedium!.copyWith(
        fontSize: DeviceExt(1.8).h,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: DeviceExt(1.8).h,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumPrimary_1 => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: DeviceExt(1.8).h,
      );
  static get labelMediumPrimary_1red => theme.textTheme.labelMedium!.copyWith(
        color: const Color.fromARGB(255, 252, 17, 0),
      );
  // Title text style
  static get titleLargeInterBluegray900 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleLargeInterOnPrimaryContainer =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeLatoIndigoA200 =>
      theme.textTheme.titleLarge!.lato.copyWith(
        color: appTheme.indigoA200,
        fontWeight: FontWeight.w400,
      );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: DeviceExt(1.8).h,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumBlack90018 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: DeviceExt(1.8).h,
      );
  static get titleMediumBlack900SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumBlack900SemiBold18 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: DeviceExt(1.8).h,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumBluegray40003 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray40003,
        fontSize: DeviceExt(1.8).h,
      );
  static get titleMediumBluegray90001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90001,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumInterBluegray800 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.blueGray800,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInterBluegray900 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInterIndigo600 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.indigo600,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInterPrimary =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumLatoWhiteA700 =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: appTheme.whiteA700,
        fontSize: DeviceExt(1.8).h,
      );
  static get titleMediumLatoWhiteA700_1 =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: appTheme.whiteA700,
        fontSize: DeviceExt(2).h,
      );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        fontSize: DeviceExt(2).h,
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPlayfairDisplayIndigoA200 =>
      theme.textTheme.titleMedium!.playfairDisplay.copyWith(
        fontSize: DeviceExt(2).h,
        color: appTheme.indigoA200,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        fontSize: DeviceExt(2).h,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimarySemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        fontSize: DeviceExt(2).h,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        fontSize: DeviceExt(2).h,
        color: theme.colorScheme.primary,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: DeviceExt(2).h,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleSmall15 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallInterBluegray800 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.blueGray800,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallInterBluegray900 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleSmallInterBluegray900Medium =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallInterIndigo600 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.indigo600,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallLatoGray60002 =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.gray60002,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallMontserratIndigoA200 =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: appTheme.indigoA200,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get playfairDisplay {
    return copyWith(
      fontFamily: 'Playfair Display',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
