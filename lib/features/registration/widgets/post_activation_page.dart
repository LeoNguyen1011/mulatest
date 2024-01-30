import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class PostActivationPage extends StatelessWidget {
  const PostActivationPage({
    super.key,
    required this.success,
  });

  final bool success;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        success
                            ? Assets.svg.alertCheck.path
                            : Assets.svg.alertWarning.path,
                        height: 100.sp,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        success
                            ? LocaleKeys
                                .account_activation_post_activation_success
                                .tr()
                            : LocaleKeys
                                .account_activation_post_activation_failure
                                .tr(),
                        style: AppTypo.heading4.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        success
                            ? LocaleKeys
                                .account_activation_post_activation_success_description
                                .tr()
                            : LocaleKeys
                                .account_activation_post_activation_failure_description
                                .tr(),
                        style: AppTypo.bodySmall
                            .copyWith(color: AppColors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AppPrimaryButton(
                  title: success
                      ? LocaleKeys.buttons_continue.tr()
                      : LocaleKeys.buttons_contact_support.tr(),
                  onPressed: () {
                    if (success) {
                      context.pushNamed(Routes.termsAndConditions);
                    } else {}
                  },
                ),
              ),
              if (!success) ...[
                SizedBox(
                  height: 8.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () =>
                        context.pushNamed(Routes.accountActivationPage),
                    child: Text(
                      LocaleKeys.account_activation_post_activation_skip.tr(),
                      style: AppTypo.heading5.copyWith(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.account_activation_take_a_selfie_powered_by.tr(),
                    style:
                        AppTypo.bodyTiny.copyWith(color: AppColors.grey[700]),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Assets.images.poweredBy.image(
                    height: 20.h,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
            ])),
      ),
    );
  }
}
