import 'package:flutter/material.dart';

/// Defines the color palette for the App UI Kit.
abstract class AppColors {
  /// primary
  static const Color primaryYello1 = Color(0xFFFEF5D2);
  static const Color primaryYello2 = Color(0xFFFEE9A6);
  static const Color primaryYello3 = Color(0xFFFCD979);
  static const Color primaryYello4 = Color(0xFFFAC958);
  static const Color primaryYello = Color(0xFFF4AF23);
  static const Color marketCoinsYellow = Color(0xFFF9B814);

  /// texts colors
  static const Color yelllowText = Color(0XFFC97E0E);
  static const Color yelllowText2 = Color(0XFFF7B022);
  static const Color blackowText = Color(0xFF212121);

  /// cards colors
  static const Color redCard = Color(0XFFF58787);
  static const Color bordercard = Color(0XFFFF5555);
  static const Color pointcard = Color(0XFFFF0000);

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// White
  static const Color whiteCard = Color(0xFFF9F9F9);

  /// Black
  static const Color black = Color(0xFF2D2D2B);

  /// Full Black
  static const Color fullblack = Color(0xFF000000);

  /// blackTransparent
  static const Color blackTransparent = Color(0x0000001A);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// The grey primary color and swatch.
  static const Color green = Color(0XFF179517);
  static const Color green1 = Color(0XFFB2EFB2);
  static const Color green2 = Color(0XFF4BC274);
  static const Color green3 = Color(0XFFD6D6D6);
  static const Color black1 = Color(0XFFF2F2F2);
  static const Color black2 = Color(0XFFE5E5E5);
  static const Color black3 = Color(0XFFB2B2B2);
  static const Color black4 = Color(0XFF666666);
  static const Color gray1 = Color(0XFF787878);
  static const Color gray20 = Color(0XFFCCCCCB);
  static const Color grisBanerDiscord = Color(0XFF424549);
  static const Color grisBannerTercerT = Color(0XFF262626);
  static const Color azulBannerLearn = Color(0XFF313E5F);
  static const Color textlanding = Color(0XFFCCCCCC);

  static const Color background = Color(0XFF1E1E1E);

  // Loaders colors
  static const Color placeHolder1 = Color(0XFFF2F3F4);
  static const Color placeHolder2 = Color.fromARGB(255, 227, 227, 227);

  /// Secondary
  static const Color secondaryOrange = Color(0xFFE35205);
  static const Color secondaryHumo = Color(0xFF3D3935);
  static const Color secondaryHueso = Color(0xFFEFDBB2);

  /// Gradient
  static const LinearGradient gradientFuria = LinearGradient(
    colors: [
      Color(0xFFE35205),
      Color(0x0ff00000),
    ],
  );
  static const LinearGradient gradientBannerTopThreeHome = LinearGradient(
    colors: [
      Color(0xFF575CA5),
      Color(0xFF5A86B9),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static const LinearGradient gradientGloriaHueso = LinearGradient(
    colors: [
      Color(0xFFF4AF23),
      Color(0xFFEFDBB2),
    ],
  );
  static const LinearGradient gradientGloriaHueso2 = LinearGradient(
    colors: [
      Color(0xFFF4AF23),
      Color(0xFFEFDBB2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient gradientHuesoSombra = LinearGradient(
    colors: [
      Color(0xFFEFDBB2),
      Color(0x0ff00000),
    ],
  );
  static const LinearGradient gradientHumo = LinearGradient(
    colors: [
      Color(0xFF3D3935),
      Color(0x0ff00000),
    ],
  );
  static const LinearGradient gradientGloria = LinearGradient(
    colors: [
      Color(0xFFF4AF23),
      Color(0xFFE35205),
      Color(0x0ff00000),
    ],
  );

  /// Fantasy points
  static const Color fantasyPoints100 = Color(0XFF34C587);
  static const Color fantasyPoints80 = Color(0XFF6FDDC6);
  static const Color fantasyPoints60 = Color(0XFFEDD353);
  static const Color fantasyPoints40 = Color(0XFFF5BD70);
  static const Color fantasyPoints20 = Color(0XFFFFAF82);
  static const Color fantasyPoints01 = Color(0XFFFF999A);
  static const Color fantasyPointError = Color(0XFFF67C7C);
  static const Color fantasyPoints101 = Color(0XFF2A694E);

  /// Rasca y gana
  static const LinearGradient gradientMagenta = LinearGradient(
    colors: [
      Color(0xFF672B61),
      Color(0xFFE859A9),
    ],
  );
  static const LinearGradient gradientAzul = LinearGradient(
    colors: [
      Color(0xFF3A409B),
      Color(0xFF70A6E7),
    ],
  );
  static const LinearGradient gradientGris = LinearGradient(
    colors: [
      Color(0xFF545454),
      Color(0xFFB5AAB0),
    ],
  );
  static const LinearGradient gradientRosaCeleste = LinearGradient(
    colors: [
      Color(0xFFCB49BE),
      Color(0xFF59BEF5),
    ],
  );
  static const LinearGradient gradientRojo = LinearGradient(
    colors: [
      Color(0xFF321424),
      Color(0xFF74313C),
      Color(0xFFBA5160),
      Color(0xFFDF5763),
    ],
  );
  static const LinearGradient gradientNaranja = LinearGradient(
    colors: [
      Color(0xFFF84725),
      Color(0xFFF1A02C),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient gradientYello = LinearGradient(
    colors: [
      Color(0xFFF4AF23),
      Color(0xFFE35205),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient gradientVerde = LinearGradient(
    colors: [
      Color(0xFF3A7A12),
      Color(0xFFA4F47E),
    ],
  );
  static const LinearGradient gradientTurquesa = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    tileMode: TileMode.mirror,
    colors: [
      Color(0xFF709694),
      Color(0xFFC9DDDB),
    ],
  );

  /// Error
  static const Color error = bordercard;

  /// Warning
  static const Color warning = Color(0xFFE1980A);

  /// Éxito
  static const Color exito = Color(0xFF08DAC1);

  ///Boost Points
  static const Color boostPointsBlue = Color(0xFF1199EE);

  ///desktopPlayerCardStatsBorder

  static const Color playerCardStatBorderDesktop = Color(0xFFF4F3F2);

  ///desktopPlayerCardStatsChartIconBackground

  static const Color desktopPlayerCardStatsChartIconBackground =
      Color(0xFFE1540F);

  ///desktopPlayerCardGeneralStatsContainerBackground

  static const Color desktopPlayerCardGeneralStatsContainerBackground =
      Color(0xFF141414);

  //desktopPlayerCardGeneralStatsContainerStatBarSecondary

  static const Color desktopPlayerCardGeneralStatsContainerStatBarSecondary =
      Color(0xFF71591C);

  // desktopCollectionPackAvailableContainerBackground

  static const Color desktopMarketPackAvailableContainerBackground =
      Color(0xFFB3F1D7);

  // desktopCollectionPackAvailableContainerBorder

  static const Color desktopMarketPackAvailableContainerBorder =
      Color(0xFF17CA7D);

  //desktopCollectionPackAvailableContainerText

  static const Color desktopCollectionPackAvailableContainerText =
      Color(0xFF169F64);

  //SetContainerBackgroundColor

  static const Color setContainerBackgroundColor = Color(0xFF151515);

  //setCardAmountContainerBackgroundColor

  static const Color setCardAmountContainerBackgroundColor = Color(0xFF2E2C2C);

  //packContentInfoContainerBackgroundColor
  static const Color packContentInfoContainerBackgroundColor =
      Color(0xFF202125);

  //rascaYGanaGris
  static const Color rascaYGanaGris = Color(0xFF91898E);
}
