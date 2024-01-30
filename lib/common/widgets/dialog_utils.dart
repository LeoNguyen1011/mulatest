import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';

class DialogUtils {
  static Future show<T>({
    required BuildContext context,
    required Widget child,
    Color? barrierColor,
    Color? backgroundColor,
    bool barrierDismissible = true,
    ShapeBorder? shape,
    EdgeInsets? insetPadding,
    DialogTransitionType? animationType,
    int? animDuration,
    Curve? curve,
    double? elevation,
    bool? canPop,
    AlignmentGeometry? alignment = Alignment.center,
    EdgeInsetsGeometry? contentPadding = const EdgeInsets.all(0),
  }) {
    return showAnimatedDialog(
      curve: curve ?? Curves.easeInOutBack,
      animationType: animationType ?? DialogTransitionType.scale,
      duration: Duration(milliseconds: animDuration ?? 550),
      barrierColor: barrierColor ?? AppColors.secondary.withOpacity(0.7),
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) {
        return PopScope(
          canPop: true,
          child: SafeArea(
            child: AlertDialog(
              elevation: elevation ?? 0,
              alignment: alignment,
              insetPadding: insetPadding ?? _defaultInsetPadding,
              backgroundColor: backgroundColor,
              shape: shape,
              contentPadding: contentPadding,
              content: child,
            ),
          ),
        );
      },
    );
  }

  ///  common attributes
  static const EdgeInsets _defaultInsetPadding =
      EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0);
}
