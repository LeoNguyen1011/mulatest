import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ResetPinOrPassword extends StatelessWidget {
  const ResetPinOrPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: LocaleKeys.auth_reset_pin.tr(),
          style: AppTypo.bodyTiny.copyWith(
            color: AppColors.burgundy,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.pushNamed(Routes.forgotPinPage);
            },
          children: [
            TextSpan(
              text: ' ${LocaleKeys.auth_or.tr()} ',
              style: AppTypo.bodyTiny.copyWith(
                color: AppColors.grey[700],
                decoration: TextDecoration.none,
              ),
            ),
            TextSpan(
              text: ' ${LocaleKeys.auth_reset_password.tr()} ',
              style: AppTypo.bodyTiny.copyWith(
                color: AppColors.burgundy,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.forgotPassword);
                },
            ),
          ]),
      style: AppTypo.bodyTiny,
    );
  }
}
