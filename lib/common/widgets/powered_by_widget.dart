import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';
import 'package:mula_biz_mobile/common/app_theme/app_typo.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class PoweredByWidget extends StatelessWidget {
  const PoweredByWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
