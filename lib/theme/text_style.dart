import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
      );
  static get bodyLargeExo2Gray70099 => theme.textTheme.bodyLarge!.exo2.copyWith(
        color: appTheme.gray70099,
        fontSize: 18.fSize,
      );
  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyLargeGray60017 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
        fontSize: 17.fSize,
      );
  static get bodyLargeGray60018 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
        fontSize: 18.fSize,
      );
  static get bodyLargeGray70099 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray70099,
        fontSize: 18.fSize,
      );
  static get bodyLargeMavenProBlack900 =>
      theme.textTheme.bodyLarge!.mavenPro.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeRedA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.redA700,
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600.withOpacity(0.4),
      );
  static get bodyMedium => theme.textTheme.bodyMedium!;
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 10.fSize,
      );
  static get bodySmallBlack90012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get bodySmallBlue500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue500,
      );
  static get bodySmallBlue800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue800,
      );
  static get bodySmallExo2Black900 => theme.textTheme.bodySmall!.exo2.copyWith(
        color: appTheme.black900,
        fontSize: 10.fSize,
      );
  static get bodySmallExo2Black90012 =>
      theme.textTheme.bodySmall!.exo2.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get bodySmallExtraLight => theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w200,
      );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
        fontSize: 12.fSize,
      );
  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 12.fSize,
      );
  static get bodySmallGray700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray700,
      );
  static get bodySmallOnPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get bodySmallRobotoBluegray900 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.blueGray900,
        fontSize: 12.fSize,
      );
  // Headline text style
  static get headlineLargeBold => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeOnPrimaryContainer =>
      theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeSemiBold => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get headlineLarge_1 => theme.textTheme.headlineLarge!;
  static get headlineSmallBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallExo2OnPrimaryContainer =>
      theme.textTheme.headlineSmall!.exo2.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 25.fSize,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmall => theme.textTheme.headlineSmall!;
  // Title style
  static get titleLargeMavenPro => theme.textTheme.titleLarge!.mavenPro;
  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get titleLargePrimaryContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get titleLarge => theme.textTheme.titleLarge!;
  static get titleMediumGray600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumGray600SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get mavenPro {
    return copyWith(
      fontFamily: 'Maven Pro',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get exo2 {
    return copyWith(
      fontFamily: 'Exo 2',
    );
  }
}
