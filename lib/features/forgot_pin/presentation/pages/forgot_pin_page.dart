import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/pin_number_field.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ForgotPinPage extends StatelessWidget {
  const ForgotPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.defaultHorizontalPadding,
          ).copyWith(
            bottom: 52.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.reset_pin_title.tr(),
                    style: AppTypo.heading3,
                  ),
                  Assets.svg.shield.svg(
                    width: 80.sp,
                    height: 80.sp,
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              PinNumberFieldWidget(
                title: LocaleKeys.reset_pin_reset_pin_description.tr(),
                titleStyle: AppTypo.bodySmall.copyWith(
                  color: AppColors.grey[600],
                ),
                onCompleted: (String val) {
                  context.push(Routes.reEnterPinPage, extra: val);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
