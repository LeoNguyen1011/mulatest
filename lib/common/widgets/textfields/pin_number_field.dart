import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:pinput/pinput.dart';

import '../../index.dart';

class PinNumberFieldWidget extends StatefulWidget {
  const PinNumberFieldWidget({
    super.key,
    this.onChanged,
    this.onCompleted,
    this.length = Config.otpFields,
    this.title,
    this.titleStyle,
    this.titleBottomSpacing,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.scrollPadding,
    this.validator,
    this.customErrorText,
  });

  final Function(String)? onChanged;
  final Function(String)? onCompleted;
  final int length;
  final String? title;
  final TextStyle? titleStyle;
  final double? titleBottomSpacing;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final EdgeInsets? scrollPadding;
  final String? Function(String?)? validator;
  final String? customErrorText;

  @override
  State<PinNumberFieldWidget> createState() => _PinNumberFieldWidgetState();
}

class _PinNumberFieldWidgetState extends State<PinNumberFieldWidget> {
  @override
  void initState() {
    if (widget.customErrorText != null) {
      _errorTextNotifier.value = widget.customErrorText!;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PinNumberFieldWidget oldWidget) {
    if (oldWidget.customErrorText != widget.customErrorText) {
      _errorTextNotifier.value = widget.customErrorText!;
    }
    super.didUpdateWidget(oldWidget);
  }

  final PinTheme defaultPinTheme = PinTheme(
    height: 56.h,
    width: 46.h,
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColors.grey[400]!,
        width: 1.sp,
      ),
      color: AppColors.grey[100],
      borderRadius: BorderRadius.circular(8.r),
    ),
    textStyle: AppTypo.heading3,
  );

  final ValueNotifier<String> _errorTextNotifier = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: widget.titleStyle ??
                AppTypo.bodySmall.copyWith(
                  color: AppColors.grey[600],
                ),
          ),
          SizedBox(
            height: widget.titleBottomSpacing ?? 8.h,
          ),
        ],
        Pinput(
          scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
          focusNode: widget.focusNode,
          controller: widget.controller,
          autofocus: true,
          enabled: widget.enabled,
          length: widget.length,
          validator: (val) {
            if (widget.validator != null) {
              _errorTextNotifier.value = widget.validator!(val) ?? '';
              return widget.validator!(val);
            }
            return null;
          },
          separatorBuilder: (_) => SizedBox(
            width: 13.w,
          ),
          cursor: Container(
            width: 2.w,
            height: 24.h,
            color: AppColors.primary,
          ),
          obscureText: true,
          obscuringWidget: Container(
            height: 12.r,
            width: 12.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey[600],
            ),
          ),
          onChanged: widget.onChanged,
          onCompleted: widget.onCompleted,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          defaultPinTheme: defaultPinTheme,
          followingPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.sp,
                color: AppColors.grey[400]!,
              ),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          errorTextStyle: const TextStyle(height: 0, fontSize: 0),
          keyboardType: const TextInputType.numberWithOptions(
            decimal: false,
            signed: false,
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey[400]!,
                width: 1.sp,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
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
