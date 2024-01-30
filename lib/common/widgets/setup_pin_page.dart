import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/pin_number_field.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class SetupPinPage extends StatefulWidget {
  const SetupPinPage({
    super.key,
    required this.onChanged,
    required this.onCompleted,
    this.isConfirm = true,
    required this.controller,
    this.validator,
  });

  final Function(String val) onChanged;
  final Function(String val) onCompleted;
  final bool isConfirm;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<SetupPinPage> createState() => _SetupPinPageState();
}

class _SetupPinPageState extends State<SetupPinPage> {
  String errorText = '';
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
                    widget.isConfirm
                        ? LocaleKeys.account_activation_confirm_pin_title.tr()
                        : LocaleKeys.account_activation_setup_pin_title.tr(),
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
                controller: widget.controller,
                title: widget.isConfirm
                    ? LocaleKeys.reset_pin_confirm_pin.tr()
                    : LocaleKeys.account_activation_setup_pin_enter_pin.tr(),
                titleStyle: AppTypo.bodySmall.copyWith(
                  color: AppColors.grey[600],
                ),
                onChanged: widget.onChanged,
                onCompleted: widget.onCompleted,
                validator: widget.validator,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
