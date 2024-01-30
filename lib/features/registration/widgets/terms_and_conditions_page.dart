import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/checkbox.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBar(
        hasBack: false,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: AppDimensions.defaultPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.account_activation_terms_and_conditions_title.tr(),
                  style: AppTypo.heading3,
                ),
                Assets.svg.file.svg(
                  width: 80.sp,
                  height: 80.sp,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              LocaleKeys.account_activation_terms_and_conditions_description
                  .tr(),
              style: AppTypo.bodySmall.copyWith(color: AppColors.grey[600]),
            ),
            SizedBox(height: 37.h),
            Text(
              LocaleKeys.account_activation_terms_and_conditions_restriction
                  .tr(),
              style: AppTypo.heading6.copyWith(color: AppColors.grey[700]),
            ),
            SizedBox(height: 8.h),
            Text(
              LocaleKeys
                  .account_activation_terms_and_conditions_restriction_description
                  .tr(),
              style: AppTypo.bodySmall.copyWith(color: AppColors.grey[600]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h, left: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.retriction1.tr(),
                    style:
                        AppTypo.bodySmall.copyWith(color: AppColors.grey[600]),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    LocaleKeys.retriction2.tr(),
                    style:
                        AppTypo.bodySmall.copyWith(color: AppColors.grey[600]),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    LocaleKeys.retriction3.tr(),
                    style:
                        AppTypo.bodySmall.copyWith(color: AppColors.grey[600]),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    LocaleKeys.retriction4.tr(),
                    style:
                        AppTypo.bodySmall.copyWith(color: AppColors.grey[600]),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    LocaleKeys.retriction4.tr(),
                    style:
                        AppTypo.bodySmall.copyWith(color: AppColors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppCheckbox(
                  onCheckPressed: (val) {
                    setState(() {
                      isAgreed = val;
                    });
                  },
                ),
                Expanded(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: LocaleKeys.iAcknowledgeAndAcceptTheMULAApp.tr(),
                      style: TextStyle(color: AppColors.grey[700]),
                    ),
                    TextSpan(
                      text: LocaleKeys.termsAndConditions.tr(),
                      style: AppTypo.bodyTiny.copyWith(
                          color: AppColors.burgundy,
                          decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: LocaleKeys.and.tr(),
                      style:
                          AppTypo.bodyTiny.copyWith(color: AppColors.grey[700]),
                    ),
                    TextSpan(
                      text: LocaleKeys.dataPrivacyPolicy.tr(),
                      style: AppTypo.bodyTiny.copyWith(
                          color: AppColors.burgundy,
                          decoration: TextDecoration.underline),
                    ),
                  ])),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      )),
      bottomNavigation: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppPrimaryButton(
                width: double.infinity,
                title: LocaleKeys.buttons_continue.tr(),
                disable: !isAgreed,
                onPressed: () {
                  if (isAgreed) {
                    context.go(Routes.main);
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
