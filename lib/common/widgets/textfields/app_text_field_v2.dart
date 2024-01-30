import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../app_theme/app_colors.dart';
import '../../app_theme/app_typo.dart';

class AppTextFieldV2 extends StatefulWidget {
  const AppTextFieldV2({
    super.key,
    this.keyboardType,
    this.title,
    this.suffixIcon,
    this.enabled,
    this.obscureText,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.hintText,
    this.helperText,
    this.controller,
    this.titleStyle,
    this.validator,
    this.autovalidateMode,
    this.height,
    this.border,
    this.scrollPadding,
    this.maxLength,
  });

  final String? title;
  final Widget? suffixIcon;
  final String? hintText;
  final String? helperText;
  final bool? enabled;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final TextStyle? titleStyle;
  final String? errorText;
  final TextEditingController? controller;

  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final double? height;
  final InputBorder? border;
  final EdgeInsets? scrollPadding;
  final int? maxLength;

  @override
  State<AppTextFieldV2> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextFieldV2> {
  final ValueNotifier<String> _errorTextNotifier = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title!,
                style: widget.titleStyle ??
                    AppTypo.bodySmall.copyWith(
                      color: AppColors.grey[600],
                    ),
              ),
              if (widget.maxLength != null)
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: widget.controller ?? TextEditingController(),
                  builder: (_, val, __) => Text(
                    "${val.text.length} / ${widget.maxLength}",
                    style: AppTypo.bodySmall.copyWith(
                      color: AppColors.grey[600],
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
        TextFormField(
          scrollPadding:
              widget.scrollPadding ?? const EdgeInsets.only(bottom: 20.0),
          autovalidateMode:
              widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          maxLength: widget.maxLength,
          enabled: widget.enabled,
          onChanged: (val) {
            if (widget.onChanged != null) {
              widget.onChanged!(val);
            }
          },
          validator: (val) {
            if (widget.validator != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _errorTextNotifier.value = widget.validator!(val) ?? '';
              });
              return widget.validator!(val);
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _errorTextNotifier.value = '';
              });
              return null;
            }
          },
          onFieldSubmitted: widget.onSubmitted,
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.keyboardType,
          style: AppTypo.paragraph.copyWith(color: AppColors.grey[700]),
          cursorColor: AppColors.grey[700],
          decoration: InputDecoration(
              counterStyle: const TextStyle(height: 0, fontSize: 0),
              focusedBorder: widget.border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFD2DAE2),
                      width: 1,
                    ),
                  ),
              enabledBorder: widget.border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFD2DAE2),
                      width: 1,
                    ),
                  ),
              filled: true,
              fillColor: (widget.enabled ?? true)
                  ? AppColors.transparent
                  : AppColors.grey[100],
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: widget.suffixIcon,
              ),
              hintText: widget.hintText,
              helperText: widget.helperText,
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 24, minWidth: 24),
              contentPadding: const EdgeInsets.all(12),
              errorStyle: const TextStyle(height: 0, fontSize: 0)),
        ),
        ValueListenableBuilder<String>(
            valueListenable: _errorTextNotifier,
            builder: (_, val, __) {
              return val.isNotEmpty
                  ? Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 2.w, right: 2.w, top: 2.h),
                            child: Assets.svg.info.svg(
                              height: 16.h,
                              width: 16.w,
                              colorFilter: const ColorFilter.mode(
                                AppColors.error,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              _errorTextNotifier.value,
                              style: AppTypo.bodyTiny.copyWith(
                                color: AppColors.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox();
            }),
      ],
    );
  }
}
