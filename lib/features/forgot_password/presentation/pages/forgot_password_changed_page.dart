import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ForgotPasswordChangedPage extends StatelessWidget {
  const ForgotPasswordChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        hasBack: false,
      ),
      body: Padding(
        padding: AppDimensions.defaultPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 132.h),
            Assets.svg.resetPasswordSuccess.svg(
              width: 80.sp,
              height: 80.sp,
            ),
            SizedBox(height: 32.h),
            Text(
              LocaleKeys.reset_password_password_changed.tr(),
              style: AppTypo.heading4,
            ),
            SizedBox(height: 16.h),
            Text(
              LocaleKeys.reset_password_password_updated.tr(),
              style: AppTypo.paragraph.copyWith(color: AppColors.grey.shade600),
            ),
            SizedBox(height: 32.h),
            Align(
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.main);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.burgundy,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  height: 48.h,
                  width: 110.sp,
                  alignment: Alignment.center,
                  child: Text(
                    LocaleKeys.reset_password_done.tr(),
                    style: AppTypo.heading5.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.account_activation_take_a_selfie_powered_by.tr(),
                  style: AppTypo.bodyTiny.copyWith(color: AppColors.grey[700]),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Assets.images.poweredBy.image(
                  height: 20.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
