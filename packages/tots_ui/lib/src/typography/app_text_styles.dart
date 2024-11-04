import 'package:flutter/material.dart';
import 'package:tots_ui/src/colors/app_colors.dart';

/// The app consists of two main text style definitions: UI and Content.
///
/// Content text style is primarily used for all content-based components,
/// e.g. news feed including articles and sections, while the UI text style
/// is used for the rest of UI components.
///
/// The default app's [TextTheme] is [AppTheme.uiTextTheme].
///
/// Use [ContentThemeOverrideBuilder] to override the default [TextTheme]
/// to [AppTheme.contentTextTheme].

/// UI Text Style Definitions
// ignore_for_file: library_private_types_in_public_api

/// Textstyles height is calculated by dividing the line height by the font size.
/// This line height is given in the UI styleguide.

class UITextStyle {
  UITextStyle._();

  static _Titles get titles => _Titles();
  static _Paragraphs get paragraphs => _Paragraphs();
  static _Captions get captions => _Captions();
  static _Labels get labels => _Labels();
  static _Links get links => _Links();
  static _Errors get errors => _Errors();
  static _Body get body => _Body();
}

class _Errors {
  TextStyle errorMessage = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 18 / 12,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.error,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );
}

class _Titles {
  TextStyle headline1mobile = const TextStyle(
    fontSize: 24,
    fontFamily: 'DrukTextWide',
    package: 'klg_ui',
    color: Colors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle headline2mobile = const TextStyle(
    fontSize: 20,
    fontFamily: 'Archivo-Bold',
    package: 'klg_ui',
    color: Colors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle headline3mobile = const TextStyle(
    fontSize: 16,
    fontFamily: 'Archivo-Bold',
    package: 'klg_ui',
    color: Colors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle title1Medium = const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w500,
    height: 38 / 34,
    fontFamily: 'DrukTextWide',
    package: 'klg_ui',
    color: AppColors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle title1Light = const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w300,
    height: 38 / 34,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle title2Medium = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 28 / 24,
    fontFamily: 'DrukTextWide',
    package: 'klg_ui',
    color: AppColors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle title3Medium = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 24 / 18,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle subTitle1 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 24 / 18,
    fontFamily: 'Archivo', //Debe cambiar a fuente ARCHIVO
    package: 'klg_ui',
    color: Colors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle subTitle2 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 24 / 18,
    fontFamily: 'Archivo', //Debe cambiar a fuente ARCHIVO
    package: 'klg_ui',
    color: Colors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );
}

class _Paragraphs {
  TextStyle paragraph1Regular = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 20 / 16,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle paragraph1SemiBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 20 / 16,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle paragraph2Regular = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 18 / 14,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle paragraph2Medium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 18 / 14,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle paragraph2SemiBold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 18 / 14,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );
}

class _Captions {
  TextStyle captionMedium = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 18 / 12,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );
}

class _Labels {
  TextStyle label = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );
}

class _Links {
  TextStyle link = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    fontFamily: 'Archivo',
    package: 'klg_ui',
    color: AppColors.fullblack,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );
}

class _Body {
  TextStyle body1mobile = const TextStyle(
    fontSize: 16,
    fontFamily: 'Archivo-Regular',
    package: 'klg_ui',
    color: Colors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle body2mobile = const TextStyle(
    fontSize: 14,
    fontFamily: 'Archivo-Regular',
    package: 'klg_ui',
    color: Colors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );

  TextStyle body3mobile = const TextStyle(
    fontSize: 12,
    fontFamily: 'Archivo-Regular',
    package: 'klg_ui',
    color: Colors.black,
    fontStyle: FontStyle.normal,
    fontFeatures: [FontFeature.liningFigures()],
  );
}
