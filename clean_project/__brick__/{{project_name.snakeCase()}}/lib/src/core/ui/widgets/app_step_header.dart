import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

class AppStepHeader extends StatelessWidget {
  const AppStepHeader({
    super.key,
    required this.controller,
    this.totalSteps = 3,
    this.onBack,
    this.title,
  });

  final PageController controller;
  final int totalSteps;
  final String? title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final VoidCallback backAction =
        onBack ?? () => Navigator.of(context).maybePop();

    return Column(
      children: [
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: backAction,
              child: const AppIcon(
                icon: Icons.arrow_back_outlined,
                color: AppColors.violet_350,
                size: 32,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null) ...[
              AppText(
                text: title!,
                typography: AppTypography.heading1,
                color: AppColors.blue_250,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
            ],
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.gray_0,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SmoothPageIndicator(
                controller: controller,
                count: totalSteps,
                effect: const WormEffect(
                  activeDotColor: AppColors.violet_250,
                  dotColor: AppColors.gray_150,
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 10,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
