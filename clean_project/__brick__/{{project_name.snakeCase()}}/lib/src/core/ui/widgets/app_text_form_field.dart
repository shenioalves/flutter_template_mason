import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:{{project_name.snakeCase()}}/src/core/ui/ui.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.isPassword = false,
    this.addTitle = true,
    this.label = '',
    required this.hint,
    required this.controller,
    this.errorText = '',
    this.marginBottom = 20,
    this.keyboardType,
    this.onChanged,
    this.validateInput,
    this.backgroundColor = AppColors.background,
    this.focusNode,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.inputFormatters,
  });

  final bool isPassword;
  final bool addTitle;
  final String label;
  final String hint;
  final String errorText;
  final double marginBottom;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validateInput;
  final Color? backgroundColor;
  final FocusNode? focusNode;
  final int? maxLength;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late final ValueNotifier<bool> _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = ValueNotifier(widget.isPassword);
  }

  @override
  void dispose() {
    _obscureText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.addTitle)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: widget.label,
                  color: AppColors.gray_300,
                  typography: AppTypography.heading3,
                ),
                SizedBox(height: 5),
              ],
            ),
          ValueListenableBuilder<bool>(
            valueListenable: _obscureText,
            builder: (context, obscureText, child) {
              return TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: AppColors.violet_300,
                validator: widget.validateInput,
                controller: widget.controller,
                style: AppTypography.body.copyWith(color: AppColors.violet_350),
                obscureText: widget.isPassword ? obscureText : false,
                onChanged: widget.onChanged,
                keyboardType: widget.keyboardType,
                focusNode: widget.focusNode,
                maxLength: widget.maxLength,
                textAlign: widget.textAlign,
                textInputAction: widget.textInputAction,
                inputFormatters: widget.inputFormatters,
                decoration: InputDecoration(
                  counterText: widget.maxLength != null ? '' : null,
                  filled: widget.backgroundColor != null,
                  fillColor: widget.backgroundColor ?? Colors.white,
                  error: widget.errorText.isNotEmpty
                      ? AppText(
                          text: widget.errorText,
                          typography: AppTypography.bodySmall,
                          color: AppColors.red_250,
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.gray_200,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.gray_200,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.violet_300,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.red_250,
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.red_250,
                      width: 2,
                    ),
                  ),
                  hintText: widget.hint,
                  hintStyle: AppTypography.body.copyWith(
                    color: AppColors.gray_250,
                  ),
                  contentPadding: Theme.of(
                    context,
                  ).inputDecorationTheme.contentPadding,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: AppIcon(
                            icon: obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.gray_300,
                          ),
                          onPressed: () {
                            _obscureText.value = !obscureText;
                          },
                        )
                      : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
