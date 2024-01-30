import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/pin_number_field.dart';
import 'package:mula_biz_mobile/features/forgot_pin/presentation/cubit/forgot_pin_cubit.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ReenterPinPage extends StatefulWidget {
  const ReenterPinPage({super.key, required this.pin});

  final String pin;

  @override
  State<ReenterPinPage> createState() => _ReenterPinPageState();
}

class _ReenterPinPageState extends State<ReenterPinPage> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final controler = TextEditingController();

  @override
  void dispose() {
    controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
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
                      LocaleKeys.reset_pin_reenter_pin.tr(),
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
                  controller: controler,
                  title: LocaleKeys.reset_pin_confirm_pin.tr(),
                  titleStyle: AppTypo.bodySmall.copyWith(
                    color: AppColors.grey[600],
                  ),
                  onChanged: (String val) {},
                  onCompleted: (val) {
                    if (val.length == 6 && val == widget.pin) {
                      ForgotPinCubit.pin = val;
                      context.push(Routes.forgotPinConfirmPassPage);
                    }

                    if (formKey.currentState?.validate() ?? false) {
                      context.push(Routes.forgotPinConfirmPassPage);
                    }
                  },
                  validator: (val) {
                    if ((val?.length) == 6 && val == widget.pin) {
                      return null;
                    } else {
                      controler.clear();
                      return LocaleKeys.validators_pin_not_match.tr();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
