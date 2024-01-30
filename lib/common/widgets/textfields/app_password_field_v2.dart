import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/codegen_loader.g.dart';
import '../../app_theme/app_colors.dart';
import 'app_text_field_v2.dart';

class AppPasswordFieldV2 extends StatefulWidget {
  const AppPasswordFieldV2({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.title,
    this.hintText,
    this.errorText,
    this.helperText,
    this.titleStyle,
    this.validator,
    this.border,
    this.height,
    this.controller,
    this.scrollPadding,
  });

  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? title;
  final String? hintText;
  final String? errorText;
  final String? helperText;
  final bool enabled;
  final TextStyle? titleStyle;
  final InputBorder? border;
  final double? height;

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final EdgeInsets? scrollPadding;

  @override
  State<AppPasswordFieldV2> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordFieldV2> {
  bool _obscureText = true;

  @override
  void didUpdateWidget(covariant AppPasswordFieldV2 oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFieldV2(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscureText,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      title: widget.title ?? LocaleKeys.auth_password.tr(),
      hintText: widget.hintText ?? LocaleKeys.auth_enter_your_password.tr(),
      errorText: widget.errorText,
      helperText: widget.helperText,
      titleStyle: widget.titleStyle,
      border: widget.border,
      height: widget.height,
      scrollPadding:
          widget.scrollPadding ?? const EdgeInsets.only(bottom: 30.0),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        icon: SvgPicture.asset(
          _obscureText ? Assets.svg.eye.path : Assets.svg.eyeCrossed.path,
          colorFilter: AppColors.suffixIconColorFilter(
            enabled: widget.enabled,
          ),
        ),
      ),
    );
  }
}
