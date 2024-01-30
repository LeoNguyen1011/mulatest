import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';

class LoadingWidgetController {
  static void hideLoadingDialog(context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context).pop();
    }
  }

  static bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  static Widget get showWidgetOnly => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.brand),
          strokeWidth: 5,
        ),
      );

  static showLoadingDialog(BuildContext context) {
    if (!_isThereCurrentDialogShowing(context)) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return showWidgetOnly;
        },
      );
    }
  }
}
