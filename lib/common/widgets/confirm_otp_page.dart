import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/utils/functions/convert_phone_number.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/pin_number_field.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class ConfirmOtpPage extends StatefulWidget {
  const ConfirmOtpPage({
    super.key,
    required this.phoneNumber,
    required this.errorText,
    required this.onFilledPIN,
    required this.onResendOtp,
  });
  final String phoneNumber;
  final Function(String val) onFilledPIN;
  final VoidCallback onResendOtp;
  final String errorText;

  @override
  State<ConfirmOtpPage> createState() => _ConfirmOtpPageState();
}

class _ConfirmOtpPageState extends State<ConfirmOtpPage> {
  var duration = 90;
  var isEnded = false;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Flexible(
                  child: Text(
                    LocaleKeys.account_activation_confirm_otp_title.tr(),
                    style: AppTypo.heading3,
                  ),
                ),
                Assets.svg.phoneMessage.svg(
                  width: 80.sp,
                  height: 80.sp,
                ),
              ],
            ),
            SizedBox(height: 24.h),
            RichText(
              text: TextSpan(
                text: LocaleKeys.yourCodeHasBeenSentTo.tr(),
                style: AppTypo.heading7.copyWith(
                    color: AppColors.grey.shade600,
                    fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: PhoneNumberHelper.hidePhoneNumberV2(
                          widget.phoneNumber),
                      style: AppTypo.heading7.copyWith(
                          color: AppColors.grey.shade700,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            PinNumberFieldWidget(
              controller: controller,
              onChanged: (String val) {
                if (val.length == 6) {
                  widget.onFilledPIN(val);

                  setState(() {
                    controller.clear();
                  });
                }
              },
              customErrorText: widget.errorText,
            ),
            SizedBox(height: 16.h),
            Align(
              child: duration == 0
                  ? GestureDetector(
                      onTap: () => {
                        widget.onResendOtp(),
                        setState(() {
                          duration = 90;
                        })
                      },
                      child: Text(
                        LocaleKeys.resendOTP.tr(),
                        style: AppTypo.bodyTiny.copyWith(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.theCodeIsOnlyValidFor.tr(),
                          style:
                              AppTypo.bodySmall.copyWith(color: AppColors.grey),
                        ),
                        TweenAnimationBuilder<Duration>(
                            duration: Duration(seconds: duration),
                            tween: Tween(
                                begin: Duration(seconds: duration),
                                end: Duration.zero),
                            onEnd: () {
                              setState(() {
                                duration = 0;
                              });
                            },
                            builder: (BuildContext context, Duration value,
                                Widget? child) {
                              final seconds = value.inSeconds;
                              duration = seconds;
                              return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    '$seconds',
                                    textAlign: TextAlign.center,
                                    style: AppTypo.bodySmall.copyWith(
                                      color: AppColors.burgundy,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ));
                            }),
                        Text(' ${LocaleKeys.seconds.tr()}',
                            style: AppTypo.bodySmall
                                .copyWith(color: AppColors.grey))
                      ],
                    ),
            ),
          ],
        ),
      )),
    );
  }
}
