import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    this.subtitle,
    required this.buttonText,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
    required this.buttonColor,
    this.isLoading = false,
  });

  final String title;
  final String? subtitle;
  final String buttonText;
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;
  final Color buttonColor;
  final bool isLoading;

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? subtitle,
    required String buttonText,
    required VoidCallback onPressed,
    required IconData icon,
    required Color iconColor,
    required Color buttonColor,
    bool isLoading = false,
    bool showCloseButton = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: showCloseButton,
      builder: (ctx) => AppDialog(
        title: title,
        subtitle: subtitle,
        buttonText: buttonText,
        onPressed: onPressed,
        icon: icon,
        iconColor: iconColor,
        buttonColor: buttonColor,
        isLoading: isLoading,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.background,
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      contentPadding: EdgeInsets.zero,
      content: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: double.infinity),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _AppDialogIcon(icon: icon, color: iconColor),
                ),
                AppText(
                  text: title,
                  textAlign: TextAlign.center,
                  typography: AppTypography.heading3,
                  color: AppColors.gray_350,
                ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AppText(
                      text: subtitle!,
                      textAlign: TextAlign.center,
                      typography: AppTypography.body,
                      color: AppColors.gray_250,
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: isLoading ? null : () => context.pop(),
              icon: const AppIcon(
                icon: Icons.close,
                color: AppColors.gray_200,
                size: 24,
              ),
            ),
          ),
        ],
      ),

      actions: [
        SizedBox(
          width: double.infinity,
          child: AppButton(
            label: buttonText,
            onPressed: onPressed,
            isLoading: isLoading,
            backgroundColor: buttonColor,
          ),
        ),
      ],
    );
  }
}

class _AppDialogIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _AppDialogIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16.0),
      child: AppIcon(icon: icon, size: 40, color: color),
    );
  }
}
