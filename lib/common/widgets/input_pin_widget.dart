import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/pin_number_field.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class InputPinWidget extends StatefulWidget {
  const InputPinWidget({
    super.key,
    required this.onFilledPin,
    this.title,
  });
  final String? title;
  final Function(String val) onFilledPin;

  @override
  State<InputPinWidget> createState() => _InputPinWidgetState();
}

class _InputPinWidgetState extends State<InputPinWidget> {
  final TextEditingController controller = TextEditingController();
  late ValueNotifier<bool> isValid;

  @override
  void initState() {
    isValid = ValueNotifier(false);
    super.initState();
  }

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
                  Flexible(
                    child: Text(
                      widget.title ?? "Confirm your PIN",
                      style: AppTypo.heading3,
                    ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PinNumberFieldWidget(
                    controller: controller,
                    title: LocaleKeys.account_activation_confirm_pin_confirm_pin
                        .tr(),
                    titleStyle: AppTypo.bodySmall.copyWith(
                      color: AppColors.grey[600],
                    ),
                    onCompleted: (String val) {
                      widget.onFilledPin(val);
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: isValid,
                    builder: (context, value, child) => Visibility(
                      visible: isValid.value,
                      child: Text(
                        LocaleKeys.validators_pin_not_match.tr(),
                        style: AppTypo.bodyTiny.copyWith(color: AppColors.red),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
