// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/utils/functions/convert_phone_number.dart';
import 'package:mula_biz_mobile/common/utils/functions/device_info.dart';
import 'package:mula_biz_mobile/common/validation/email_validation.dart';
import 'package:mula_biz_mobile/common/validation/mobile_validation.dart';
import 'package:mula_biz_mobile/common/validation/name_validation.dart';
import 'package:mula_biz_mobile/common/validation/password_validation.dart';
import 'package:mula_biz_mobile/common/validation/validation_helper.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/cubit/account_activation_cubit.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

import 'package:mula_biz_mobile/common/widgets/textfields/app_password_field_v2.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/app_text_field_v2.dart';

class AccountActivationPage extends StatefulWidget {
  const AccountActivationPage({super.key});

  @override
  State<AccountActivationPage> createState() => _AccountActivationPageState();
}

class _AccountActivationPageState extends State<AccountActivationPage> {
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _cornfirmPasswordTextEditingController =
      TextEditingController();
  final TextEditingController _mobilePhoneTextEditingController =
      TextEditingController();
  final TextEditingController _activationCodeTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _cornfirmPasswordTextEditingController.dispose();
    _mobilePhoneTextEditingController.dispose();
    _activationCodeTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: const BaseAppBar(
        hasBack: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                LocaleKeys.account_activation_activation_title
                                    .tr(),
                                style: AppTypo.heading3,
                              ),
                            ),
                            Assets.svg.profile.svg(
                              width: 80.sp,
                              height: 80.sp,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        _firstNameField(),
                        SizedBox(
                          height: 16.h,
                        ),
                        _lastNameField(),
                        SizedBox(
                          height: 16.h,
                        ),
                        _authEmailField(),
                        SizedBox(
                          height: 16.h,
                        ),
                        _passwordField(),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'validators.password_error'.tr(),
                          style: AppTypo.bodySmall.copyWith(
                              color: AppColors.grey[500], fontSize: 12),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        _confirmPasswordField(),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          LocaleKeys.bothPasswordsMustMatch.tr(),
                          style: AppTypo.bodyTiny.copyWith(
                            color: AppColors.grey[500],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        _phoneNumberField(),
                        SizedBox(
                          height: 16.h,
                        ),
                        _activationCodeField(context),
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 4.0,
                                spreadRadius: 0,
                                offset: const Offset(0, -5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              _changeDeviceButton(context),
                              const SizedBox(
                                height: 16,
                              ),
                              _nextButton(context)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _nextButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppPrimaryButton(
              width: double.infinity,
              title: LocaleKeys.buttons_next.tr(),
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  final deviceName = await DeviceInfo.getDeviceName();
                  final deviceId = await DeviceInfo.getDeviceId();
                  final deviceOs = DeviceInfo.getDeviceOSName();
                  final deviceModel = await DeviceInfo.getDeviceModel();
                  AccountActivationCubit.phoneNumberToShowOnOtpPage =
                      _mobilePhoneTextEditingController.text;
                  AccountActivationCubit().updateRegistrationEntity(
                    invitationCode: _activationCodeTextEditingController.text,
                    firstName: _firstNameTextEditingController.text,
                    lastName: _lastNameTextEditingController.text,
                    password: _passwordTextEditingController.text,
                    phone: PhoneNumberHelper.convertPhoneNumber(
                        _mobilePhoneTextEditingController.text),
                    email: _emailTextEditingController.text,
                    name: deviceName,
                    model: deviceModel,
                    uid: deviceId,
                    os: deviceOs,
                  );

                  context.pushNamed(Routes.accountActivationSetupPinPage);
                }
              },
            ),
          ),
          SizedBox(
            height: 16.h,
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
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }

  Container _changeDeviceButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => {context.push(Routes.changeDeviceEmail)},
            child: Text(
              LocaleKeys.auth_change_device.tr(),
              style: AppTypo.bodySmall.copyWith(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppTextFieldV2 _activationCodeField(BuildContext context) {
    return AppTextFieldV2(
      controller: _activationCodeTextEditingController,
      suffixIcon: IconButton(
        icon: const Icon(Icons.qr_code_scanner),
        onPressed: () {
          context.pushNamed(Routes.qrScannerPage);
        },
      ),
      scrollPadding: const EdgeInsets.only(bottom: 120),
      title: LocaleKeys.account_activation_activation_activation_code.tr(),
      titleStyle: AppTypo.bodySmall.copyWith(
        color: AppColors.grey[600],
      ),
      hintText: LocaleKeys
          .account_activation_activation_enter_your_activation_code
          .tr(),
    );
  }

  AppTextFieldV2 _phoneNumberField() {
    return AppTextFieldV2(
      controller: _mobilePhoneTextEditingController,
      scrollPadding: const EdgeInsets.only(bottom: 180),
      keyboardType: TextInputType.phone,
      title: LocaleKeys.auth_mobile_number.tr(),
      titleStyle: AppTypo.bodySmall.copyWith(
        color: AppColors.grey[600],
      ),
      hintText: LocaleKeys
          .account_activation_activation_enter_your_mobile_number
          .tr(),
      validator: (val) {
        return MobileValidation.getError(MobileValidation.validator(val ?? ''))
            ?.tr();
      },
    );
  }

  Padding _confirmPasswordField() {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: AppPasswordFieldV2(
        controller: _cornfirmPasswordTextEditingController,
        title: LocaleKeys.auth_confirm_password.tr(),
        titleStyle: AppTypo.bodySmall.copyWith(
          color: AppColors.grey[600],
        ),
        hintText: LocaleKeys.auth_enter_your_password.tr(),
        validator: (val) {
          if (val == null) {
            return LocaleKeys.validators_field_empty.tr();
          } else if (val != _passwordTextEditingController.text) {
            return LocaleKeys.validators_password_do_not_match.tr();
          } else {
            return null;
          }
        },
      ),
    );
  }

  Padding _passwordField() {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: AppPasswordFieldV2(
        controller: _passwordTextEditingController,
        titleStyle: AppTypo.bodySmall.copyWith(
          color: AppColors.grey[600],
        ),
        hintText: LocaleKeys.auth_enter_your_password.tr(),
        validator: (val) {
          return Password.getError(Password.validator(val ?? ''))?.tr();
        },
      ),
    );
  }

  AppTextFieldV2 _authEmailField() {
    return AppTextFieldV2(
      controller: _emailTextEditingController,
      title: LocaleKeys.auth_email.tr(),
      titleStyle: AppTypo.bodySmall.copyWith(
        color: AppColors.grey[600],
      ),
      hintText: LocaleKeys.account_activation_activation_enter_your_email.tr(),
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return Email.getError(EmailValidationError.empty).tr();
        } else if (Email.emailRegExp.hasMatch(value ?? "")) {
          return null;
        } else {
          return Email.getError(EmailValidationError.invalid).tr();
        }
      },
    );
  }

  AppTextFieldV2 _lastNameField() {
    return AppTextFieldV2(
      controller: _lastNameTextEditingController,
      title: LocaleKeys.auth_last_name.tr(),
      titleStyle: AppTypo.bodySmall.copyWith(
        color: AppColors.grey[600],
      ),
      hintText:
          LocaleKeys.account_activation_activation_enter_your_last_name.tr(),
      validator: (value) {
        if (!ValidationHelper.nameRegExp.hasMatch(value ?? '')) {
          return Name.getError(NameValidationError.invalid).tr();
        } else if (value == null) {
          return Name.getError(NameValidationError.empty).tr();
        } else {
          return null;
        }
      },
    );
  }

  AppTextFieldV2 _firstNameField() {
    return AppTextFieldV2(
      controller: _firstNameTextEditingController,
      title: LocaleKeys.auth_first_name.tr(),
      titleStyle: AppTypo.bodySmall.copyWith(
        color: AppColors.grey[600],
      ),
      hintText:
          LocaleKeys.account_activation_activation_enter_your_first_name.tr(),
      validator: (value) {
        if (!ValidationHelper.nameRegExp.hasMatch(value ?? '')) {
          return Name.getError(NameValidationError.invalid).tr();
        } else if (value == null) {
          return Name.getError(NameValidationError.empty).tr();
        } else {
          return null;
        }
      },
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
