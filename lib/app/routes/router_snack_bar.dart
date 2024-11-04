// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

import 'package:tots/app/routes/router_config.dart';
import 'package:tots_ui/tots_ui.dart';

/// {@template router_snack_bar}
/// The `RouterSnackBar` class is a Util to present Snack Bars.
/// {@endtemplate}
class RouterSnackBar {
  /// Method to press a info snack bar.
  static void info({required String message, bool isMobile = false}) {
    final textWidth = TextPainter(
      text: TextSpan(text: message),
      textDirection: TextDirection.ltr,
    );

    textWidth.layout();

    final snackBar = SnackBar(
      margin: isMobile
          ? const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.lg,
            )
          : null,
      width: isMobile ? null : textWidth.width * 1.5,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: UITextStyle.paragraphs.paragraph2Medium.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: AppColors.black1,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  /// Method to press a error snack bar.
  static void error({required String error, bool isMobile = false}) {
    final snackBar = SnackBar(
      margin: isMobile
          ? const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.lg,
            )
          : null,
      width: isMobile ? null : 350,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            textAlign: TextAlign.center,
            style: UITextStyle.paragraphs.paragraph2Medium.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: AppColors.error,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
