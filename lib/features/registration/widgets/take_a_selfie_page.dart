import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class TakeASelfiePage extends StatelessWidget {
  const TakeASelfiePage({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBar(
        hasBack: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.defaultHorizontalPadding,
          ).copyWith(
            bottom: 52.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.account_activation_take_a_selfie_title.tr(),
                    style: AppTypo.heading3,
                  ),
                  Assets.svg.shieldChecked.svg(
                    width: 80.sp,
                    height: 80.sp,
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                LocaleKeys.account_activation_take_a_selfie_description.tr(),
                style: AppTypo.bodySmall.copyWith(
                  color: AppColors.grey[600],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                LocaleKeys.account_activation_take_a_selfie_tips.tr(),
                style: AppTypo.bodySmall.copyWith(
                    color: AppColors.grey[700], fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.red[200],
                        borderRadius: BorderRadius.circular(99)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                    child: Text(
                      '1',
                      style: AppTypo.bodySmall.copyWith(
                          color: AppColors.grey[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    constraints: BoxConstraints(maxWidth: 203.w),
                    child: Text(
                      LocaleKeys.account_activation_take_a_selfie_tip1.tr(),
                      style: AppTypo.bodySmall
                          .copyWith(color: AppColors.grey[600]),
                    ),
                  )
                ],
              ),
              SizedBox(height: 19.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.red[200],
                        borderRadius: BorderRadius.circular(99)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                    child: Text(
                      '2',
                      style: AppTypo.bodySmall.copyWith(
                          color: AppColors.grey[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    constraints: BoxConstraints(maxWidth: 203.w),
                    child: Text(
                      LocaleKeys.account_activation_take_a_selfie_tip2.tr(),
                      style: AppTypo.bodySmall
                          .copyWith(color: AppColors.grey[600]),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 19.h,
              ),
              const PowerBy2c2p(),
              SizedBox(
                height: 33.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigation: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppPrimaryButton(
              width: double.infinity,
              title: LocaleKeys.buttons_next.tr(),
              onPressed: onPressed,
            ),
            SizedBox(
              height: 20.h,
            ),
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
