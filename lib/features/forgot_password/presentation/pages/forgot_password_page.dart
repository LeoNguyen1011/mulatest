import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/validation/email_validation.dart';
import 'package:mula_biz_mobile/common/validation/mobile_validation.dart';
import 'package:mula_biz_mobile/common/validation/password_validation.dart';
import 'package:mula_biz_mobile/common/widgets/app_toast.dart';
import 'package:mula_biz_mobile/features/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

import '../../../../common/widgets/textfields/app_password_field_v2.dart';
import '../../../../common/widgets/textfields/app_text_field_v2.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ResetPasswordView();
  }
}

class _ResetPasswordView extends StatefulWidget {
  const _ResetPasswordView();

  @override
  State<_ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<_ResetPasswordView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passController.dispose();
    rePassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.passwordResetStatus.isLoading) {
          LoadingWidgetController.showLoadingDialog(context);
        } else {
          LoadingWidgetController.hideLoadingDialog(context);
        }

        if (state.passwordResetStatus.success) {
          context.pushNamed(Routes.forgotPasswordConfirmOTP);
        } else if (state.passwordResetStatus.failed) {
          AppToast.showToast(state.passwordResetErrorMsg);
        }
      },
      child: BaseScaffold(
        extendBodyBehindAppBar: true,
        appBar: const BaseAppBar(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.reset_password_title.tr(),
                                  style: AppTypo.heading3,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  LocaleKeys.reset_password_description.tr(),
                                  style: AppTypo.paragraph.copyWith(
                                    color: AppColors.grey[500],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Assets.svg.resetPassword.svg(
                            width: 80.sp,
                            height: 80.sp,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppTextField(
                        controller: emailController,
                        border: border(),
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return Email.getError(EmailValidationError.empty)
                                .tr();
                          } else if (Email.emailRegExp.hasMatch(value ?? "")) {
                            return null;
                          } else {
                            return Email.getError(EmailValidationError.invalid)
                                .tr();
                          }
                        },
                        title: LocaleKeys.auth_email.tr(),
                        hintText: LocaleKeys.auth_email.tr(),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppTextFieldV2(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        validator: (val) {
                          return MobileValidation.getError(
                                  MobileValidation.validator(val ?? ''))
                              ?.tr();
                        },
                        title: LocaleKeys.auth_mobile_number.tr(),
                        hintText: LocaleKeys.auth_mobile_number.tr(),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppPasswordFieldV2(
                        scrollPadding: const EdgeInsets.only(bottom: 180),
                        controller: passController,
                        errorText: 'validators.password_error'.tr(),
                        title: LocaleKeys.auth_new_password.tr(),
                        hintText: LocaleKeys.auth_new_password.tr(),
                        validator: (val) {
                          return Password.getError(
                                  Password.validator(val ?? ''))
                              ?.tr();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 2.w, right: 2.w, top: 2.h),
                              child: Assets.svg.info.svg(
                                height: 16.h,
                                width: 16.w,
                                colorFilter: ColorFilter.mode(
                                  AppColors.grey[500]!,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'validators.password_error'.tr(),
                                style: AppTypo.bodySmall.copyWith(
                                    color: AppColors.grey[500], fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppPasswordFieldV2(
                        scrollPadding: const EdgeInsets.only(bottom: 140),
                        controller: rePassController,
                        title: LocaleKeys.auth_confirm_password.tr(),
                        hintText: LocaleKeys.auth_confirm_password.tr(),
                        errorText: 'validators.make_password_match'.tr(),
                        validator: (val) {
                          if (val == null) {
                            return LocaleKeys.validators_field_empty.tr();
                          } else if (val != passController.text) {
                            return LocaleKeys.validators_password_do_not_match
                                .tr();
                          } else {
                            return null;
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 2.w, right: 2.w, top: 2.h),
                              child: Assets.svg.info.svg(
                                height: 16.h,
                                width: 16.w,
                                colorFilter: ColorFilter.mode(
                                  AppColors.grey[500]!,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'validators.password_do_not_match'.tr(),
                                style: AppTypo.bodySmall.copyWith(
                                    color: AppColors.grey[500], fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  AppPrimaryButton(
                    title: LocaleKeys.buttons_next.tr(),
                    width: double.infinity,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<ForgotPasswordCubit>().onResetPassword(
                              email: emailController.text,
                              password: passController.text,
                              phoneNumber: phoneController.text,
                            );
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys
                                  .account_activation_take_a_selfie_powered_by
                                  .tr(),
                              style: AppTypo.bodyTiny
                                  .copyWith(color: AppColors.grey[700]),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Assets.images.poweredBy.image(
                              height: 20.h,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red, width: 1),
    );
  }
}
