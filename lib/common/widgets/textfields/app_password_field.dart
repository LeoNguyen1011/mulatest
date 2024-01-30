import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

import '../../app_theme/app_colors.dart';
import 'app_text_field.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
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
  final EdgeInsets? scrollPadding;

  final String? Function(String?)? validator;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  @override
  void didUpdateWidget(covariant AppPasswordField oldWidget) {
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
    return AppTextField(
      scrollPadding: widget.scrollPadding,
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
