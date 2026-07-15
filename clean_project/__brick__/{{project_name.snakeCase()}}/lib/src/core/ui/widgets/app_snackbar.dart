import 'package:flutter/material.dart';

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

enum AppSnackBarType { success, error, warning, info }

class AppSnackBar {
  AppSnackBar._();

  static void show(
    BuildContext context, {
    required String message,
    AppSnackBarType type = AppSnackBarType.info,
    bool isTop = false,
  }) {
    if (isTop) {
      _showTopToast(context, message, type);
      return;
    }

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();

    Color backgroundColor;
    IconData icon;
    Color iconColor = AppColors.gray_0;
    Color textColor = AppColors.gray_0;

    switch (type) {
      case AppSnackBarType.success:
        backgroundColor = AppColors.green_250;
        icon = Icons.check_circle_outline;
        break;
      case AppSnackBarType.error:
        backgroundColor = AppColors.red_250;
        icon = Icons.error_outline;
        break;
      case AppSnackBarType.warning:
        backgroundColor = AppColors.yellow_250;
        icon = Icons.warning_amber_rounded;
        break;
      case AppSnackBarType.info:
        backgroundColor = AppColors.blue_250;
        icon = Icons.info_outline;
        break;
    }

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            AppIcon(icon: icon, color: iconColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: AppText(
                text: message,
                color: textColor,
                typography: AppTypography.bodySmall,
                maxLines: 3,
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  static void _showTopToast(
    BuildContext context,
    String message,
    AppSnackBarType type,
  ) {
    Color backgroundColor;
    IconData icon;
    Color iconColor = AppColors.gray_0;
    Color textColor = AppColors.gray_0;

    switch (type) {
      case AppSnackBarType.success:
        backgroundColor = AppColors.green_250;
        icon = Icons.check_circle_outline;
        break;
      case AppSnackBarType.error:
        backgroundColor = AppColors.red_250;
        icon = Icons.error_outline;
        break;
      case AppSnackBarType.warning:
        backgroundColor = AppColors.yellow_250;
        icon = Icons.warning_amber_rounded;
        break;
      case AppSnackBarType.info:
        backgroundColor = AppColors.blue_250;
        icon = Icons.info_outline;
        break;
    }

    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.paddingOf(context).top + 16,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                AppIcon(icon: icon, color: iconColor, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: AppText(
                    text: message,
                    color: textColor,
                    typography: AppTypography.bodySmall,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
