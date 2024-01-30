import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';
import 'package:mula_biz_mobile/common/app_theme/app_themes.dart';
import 'package:mula_biz_mobile/common/app_theme/app_typo.dart';

enum AppButtonType {
  primary,
  secondary,
  text,
}

extension AppButtonTypeExtension on AppButtonType {
  Color backgroundColor({bool disabled = false}) {
    switch (this) {
      case AppButtonType.primary:
        return disabled ? AppColors.grey[200]! : AppColors.primary;
      case AppButtonType.secondary:
        return disabled ? AppColors.grey[200]! : AppColors.white;
      case AppButtonType.text:
        return AppColors.white;
    }
  }

  Color outlineColor({bool disabled = false}) {
    switch (this) {
      case AppButtonType.primary:
        return AppColors.transparent;
      case AppButtonType.secondary:
        return disabled ? AppColors.transparent : AppColors.primary;
      case AppButtonType.text:
        return AppColors.transparent;
    }
  }

  Color textColor({bool disabled = false}) {
    if (disabled) {
      return AppColors.grey[500]!;
    }
    switch (this) {
      case AppButtonType.primary:
        return AppColors.white;
      case AppButtonType.secondary:
        return AppColors.primary;
      case AppButtonType.text:
        return AppColors.primary;
    }
  }
}

enum AppButtonSize {
  large,
  small,
}

extension ButtonSizeExtension on AppButtonSize {
  double get height {
    switch (this) {
      case AppButtonSize.large:
        return 48.h;
      case AppButtonSize.small:
        return 34.h;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case AppButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.0.h);
      case AppButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.5.h);
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case AppButtonSize.large:
        return AppTypo.heading5;
      case AppButtonSize.small:
        return AppTypo.heading7;
    }
  }
}

class AppAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final bool disabled;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color textColor;
  final bool? isOutlined;
  final Color outlineColor;

  const AppAppButton({
    Key? key,
    this.onPressed,
    this.textColor = AppColors.white,
    this.textStyle,
    this.trailingIcon,
    this.leadingIcon,
    this.disabled = false,
    this.horizontalPadding,
    this.verticalPadding,
    this.backgroundColor = AppColors.primary,
    required this.title,
    this.width,
    this.isOutlined,
    this.height,
    this.outlineColor = AppColors.transparent,
  }) : super(key: key);

  factory AppAppButton.primary({
    required String title,
    bool disabled = false,
    VoidCallback? onPressed,
    Widget? leadingIcon,
    Widget? trailingIcon,
    double? width,
    double? height,
    AppButtonSize buttonSize = AppButtonSize.large,
  }) {
    return AppAppButton(
      title: title,
      backgroundColor:
          AppButtonType.primary.backgroundColor(disabled: disabled),
      onPressed: onPressed,
      isOutlined: disabled ? false : null,
      disabled: disabled,
      horizontalPadding: buttonSize.padding.horizontal,
      verticalPadding: buttonSize.padding.vertical,
      height: buttonSize.height,
      width: width,
      outlineColor: AppButtonType.primary.outlineColor(disabled: disabled),
      textStyle: buttonSize.textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: disabled ? null : onPressed,
        style: (isOutlined ?? false)
            ? OutlinedButton.styleFrom(
                side: BorderSide(color: outlineColor, width: 1.0),
                padding: EdgeInsets.zero,
              )
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  backgroundColor,
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
              ),
        child: Center(
          child: Wrap(
            children: [
              Padding(
                padding: leadingIcon != null
                    ? EdgeInsets.only(right: 6.0.w)
                    : EdgeInsets.zero,
                child: leadingIcon ?? const SizedBox.shrink(),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle?.copyWith(color: textColor, height: 1) ??
                    AppTypo.heading5.copyWith(color: textColor, height: 1),
              ),
              Padding(
                padding: leadingIcon != null
                    ? EdgeInsets.only(left: 6.0.w)
                    : EdgeInsets.zero,
                child: trailingIcon ?? const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.title,
    this.buttonSize,
    this.onPressed,
    this.width,
    this.height,
    this.disable = false,
    this.status,
    this.isShowBorderOnly = false,
  });

  final AppButtonSize? buttonSize;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String title;
  final bool disable;
  final BaseStateStatus? status;
  final bool isShowBorderOnly;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: buttonSize?.padding,
          textStyle: buttonSize?.textStyle,
          backgroundColor:
              isShowBorderOnly ? AppColors.white : AppColors.burgundy,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
            side: isShowBorderOnly
                ? const BorderSide(color: AppColors.burgundy)
                : const BorderSide(color: AppColors.transparent),
          ),
        ),
        onPressed:
            disable && status != BaseStateStatus.loading ? null : onPressed,
        child: status == BaseStateStatus.loading
            ? LoadingAnimationWidget.discreteCircle(
                color: AppColors.white, size: 30)
            : Text(
                title,
                style: AppTypo.heading5.copyWith(
                    color: isShowBorderOnly
                        ? AppColors.burgundy
                        : AppColors.white),
              ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.title,
    this.buttonSize,
    this.onPressed,
    this.width,
    this.height,
  });

  final AppButtonSize? buttonSize;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: buttonSize?.padding,
          textStyle: buttonSize?.textStyle,
        ),
        child: Text(title),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    this.buttonSize,
    this.onPressed,
    this.width,
    this.height,
    required this.title,
  });

  final AppButtonSize? buttonSize;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: AppThemes.outlineButtonStyle.copyWith(
          padding: MaterialStatePropertyAll(buttonSize?.padding),
          textStyle: MaterialStatePropertyAll(
            buttonSize?.textStyle.copyWith(decoration: TextDecoration.none) ??
                AppTypo.heading5,
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
