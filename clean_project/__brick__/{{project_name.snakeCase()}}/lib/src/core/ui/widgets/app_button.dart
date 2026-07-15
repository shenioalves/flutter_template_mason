import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.colorLabel,
    this.backgroundColor = AppColors.violet_300,
    this.prefix,
    this.suffix,
    this.isLoading = false,
    this.isDisabled = false,
    this.fitContent = false,
  }) : _isOutline = false;

  const AppButton.outline({
    super.key,
    required this.label,
    required this.onPressed,
    this.colorLabel,
    this.backgroundColor = AppColors.gray_0,
    this.prefix,
    this.suffix,
    this.isLoading = false,
    this.isDisabled = false,
    this.fitContent = false,
  }) : _isOutline = true;

  final String label;
  final VoidCallback onPressed;
  final Color? colorLabel;
  final Color? backgroundColor;
  final AppIcon? prefix;
  final AppIcon? suffix;
  final bool isLoading;
  final bool isDisabled;
  final bool fitContent;
  final bool _isOutline;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = isDisabled
        ? AppColors.gray_200
        : (backgroundColor ??
              (_isOutline ? Colors.transparent : AppColors.violet_300));

    final effectiveLabelColor = isDisabled
        ? AppColors.gray_300
        : (colorLabel ??
              (_isOutline ? AppColors.violet_300 : AppColors.gray_0));

    final effectiveBorderColor = isDisabled
        ? AppColors.gray_250
        : (_isOutline
              ? (colorLabel ?? AppColors.violet_300)
              : Colors.transparent);

    final content = Container(
      width: fitContent ? null : double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: isLoading ? 0.0 : 1.0,
            child: Row(
              mainAxisSize: fitContent ? MainAxisSize.min : MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefix != null) ...[prefix!, const SizedBox(width: 8)],
                Flexible(
                  child: AppText(
                    text: label,
                    color: effectiveLabelColor,
                    typography: AppTypography.buttonLarge,
                  ),
                ),
                if (suffix != null) ...[const SizedBox(width: 8), suffix!],
              ],
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: effectiveLabelColor,
                  size: 24,
                ),
              ),
            ),
        ],
      ),
    );

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: _isOutline
              ? Border.all(width: 3, color: effectiveBorderColor)
              : null,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: (isDisabled || isLoading) ? null : onPressed,
          child: content,
        ),
      ),
    );
  }
}
