import 'package:flutter/material.dart';
import 'package:tots_ui/tots_ui.dart';

class AppModalError extends StatelessWidget {
  final String errorMessage;
  const AppModalError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.error,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(errorMessage, style: UITextStyle.errors.errorMessage),
          ],
        ),
      ),
    );
  }
}
