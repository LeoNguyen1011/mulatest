import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';
import 'package:mula_biz_mobile/common/app_theme/app_typo.dart';
import 'package:mula_biz_mobile/common/widgets/buttons/app_button.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';

class AppDialog {
  static Future<Widget> showCustomDialog(BuildContext context,
      {required Widget child}) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      child,
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () => context.pop(false),
                        child: Text(
                          "Cancel",
                          style: AppTypo.heading5.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.burgundy),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<Widget> showAlertDialog(
    BuildContext context, {
    required String title,
    required String desc,
    required String buttonTitle,
    required VoidCallback onPressed,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Assets.svg.alertYellow.svg(),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        title,
                        style: AppTypo.heading5,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        desc,
                        style: AppTypo.bodySmall,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      AppAppButton(
                        title: buttonTitle,
                        width: 124,
                        height: 48,
                        onPressed: onPressed,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () => context.pop(false),
                        child: Text(
                          "Cancel",
                          style: AppTypo.heading5.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.burgundy),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
