import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/app_theme/app_theme.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
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
      this.border,
      this.scrollPadding});

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
  final InputBorder? border;
  final EdgeInsets? scrollPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: titleStyle ??
                AppTypo.bodySmall.copyWith(
                  color: AppColors.grey[600],
                ),
          ),
          SizedBox(
            height: 8.h,
          )
        ],
        TextFormField(
          scrollPadding: scrollPadding ?? const EdgeInsets.all(20.0),
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
          validator: validator,
          controller: controller,
          enabled: enabled,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          style: AppTypo.paragraph.copyWith(color: AppColors.grey[700]),
          cursorColor: AppColors.grey[700],
          decoration: InputDecoration(
              errorStyle: TextStyle(color: AppColors.red.shade600),
              errorBorder: border,
              focusedErrorBorder: border,
              filled: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xFFD2DAE2), width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xFFD2DAE2), width: 1),
              ),
              fillColor: (enabled ?? true)
                  ? AppColors.transparent
                  : AppColors.grey[100],
              suffixIcon: suffixIcon,
              hintText: hintText,
              helperText: helperText,
              contentPadding: const EdgeInsets.all(12)),
        ),
        if (errorText != null) ...[
          SizedBox(
            height: 4.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
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
                  errorText!,
                  style: AppTypo.bodyTiny.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
            ],
          ),
        ]
      ],
    );
  }
}
