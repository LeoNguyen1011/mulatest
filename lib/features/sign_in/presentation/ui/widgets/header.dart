import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class SigninHeader extends StatelessWidget {
  const SigninHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.auth_welcome_back.tr(),
          style: AppTypo.heading3,
        ),
        Assets.svg.login.svg(
          height: 80.h,
          width: 80.w,
        ),
      ],
    );
  }
}
