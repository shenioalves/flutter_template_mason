import 'package:flutter/material.dart';

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

class AppRequirementItem extends StatelessWidget {
  final ValueNotifier<bool> isValidNotifier;
  final String text;
  final String? textError;

  const AppRequirementItem({
    super.key,
    required this.isValidNotifier,
    required this.text,
    this.textError,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isValidNotifier,
      builder: (context, isValid, child) {
        final String emoji = isValid ? '\u{2705}' : '\u{274C}';

        final String displayText = (textError != null && !isValid)
            ? textError!
            : text;

        final Color textColor = isValid
            ? AppColors.gray_300
            : AppColors.red_250;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(text: emoji, fontSize: 16),
              const SizedBox(width: 8),
              Expanded(
                child: AppText(
                  text: displayText,
                  typography: AppTypography.bodySmall,
                  color: textColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
