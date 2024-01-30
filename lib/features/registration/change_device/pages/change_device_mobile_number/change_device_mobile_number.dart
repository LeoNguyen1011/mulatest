import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/validation/mobile_validation.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/app_text_field_v2.dart';
import 'package:mula_biz_mobile/features/registration/change_device/cubit/change_device_cubit.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ChangeDeviceMobileNumberPage extends StatefulWidget {
  const ChangeDeviceMobileNumberPage({super.key});

  @override
  State<ChangeDeviceMobileNumberPage> createState() =>
      _ChangeDeviceMobileNumberPageState();
}

class _ChangeDeviceMobileNumberPageState
    extends State<ChangeDeviceMobileNumberPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _activationCodeController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _activationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      appBar: const BaseAppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.defaultHorizontalPadding,
          ).copyWith(
            bottom: 16.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.change_device_title.tr(),
                    style: AppTypo.heading3,
                  ),
                  Assets.svg.phone.svg(
                    width: 40.sp,
                    height: 62.sp,
                  )
                ],
              ),
              BlocBuilder<ChangeDeviceCubit, ChangeDeviceState>(
                builder: (context, state) {
                  return AppTextFieldV2(
                    scrollPadding: const EdgeInsets.only(bottom: 180),
                    keyboardType: TextInputType.phone,
                    title: LocaleKeys.auth_mobile_number.tr(),
                    titleStyle: AppTypo.bodySmall.copyWith(
                      color: AppColors.grey[600],
                    ),
                    hintText: LocaleKeys
                        .account_activation_activation_enter_your_mobile_number
                        .tr(),
                    validator: (String? value) {
                      return MobileValidation.getError(
                              MobileValidation.validator(value ?? ''))
                          ?.tr();
                    },
                    controller: _phoneNumberController,
                  );
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                title: LocaleKeys.account_activation_activation_activation_code
                    .tr(),
                hintText: LocaleKeys
                    .account_activation_activation_activation_code
                    .tr(),
                controller: _activationCodeController,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigation: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppPrimaryButton(
                title: LocaleKeys.buttons_next.tr(),
                width: double.infinity,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ChangeDeviceCubit().updateChangeDevice(
                      activationCode: _activationCodeController.text,
                      phone: _phoneNumberController.text,
                    );

                    context.pushNamed(Routes.changeDeviceSetupPin);
                  }
                },
              ),
              SizedBox(height: 16.h),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
    );
  }
}
