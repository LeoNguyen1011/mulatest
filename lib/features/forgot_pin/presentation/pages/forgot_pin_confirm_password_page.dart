import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/base/bloc/index.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/app_toast.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/app_password_field_v2.dart';
import 'package:mula_biz_mobile/features/forgot_pin/presentation/cubit/forgot_pin_cubit.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ForgotPinConfirmPasswordPage extends StatefulWidget {
  const ForgotPinConfirmPasswordPage({super.key});

  @override
  State<ForgotPinConfirmPasswordPage> createState() =>
      _ForgotPinConfirmPasswordPageState();
}

class _ForgotPinConfirmPasswordPageState
    extends State<ForgotPinConfirmPasswordPage> {
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _cornfirmPasswordTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _cornfirmPasswordTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPinCubit, ForgotPinState>(
      listener: (context, state) {
        if (state.forgotPinStatus.isLoading) {
          LoadingWidgetController.showLoadingDialog(context);
        } else {
          LoadingWidgetController.hideLoadingDialog(context);
        }

        if (state.forgotPinStatus.success) {
          context.pushNamed(Routes.forgotPinChangePage);
        } else if (state.forgotPinStatus.failed) {
          AppToast.showToast(state.errorMsg ?? '');
        }
      },
      child: BaseScaffold(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.reset_pin_enter_password.tr(),
                      style: AppTypo.heading3,
                    ),
                    Assets.svg.shield.svg()
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                AppPasswordFieldV2(
                  titleStyle: AppTypo.bodySmall.copyWith(
                    color: AppColors.grey[600],
                  ),
                  title: LocaleKeys.reset_pin_current_password.tr(),
                  hintText: LocaleKeys.auth_enter_your_password.tr(),
                  errorText: 'validators.password_error'.tr(),
                  controller: _passwordTextEditingController,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
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
                        style: AppTypo.bodySmall
                            .copyWith(color: AppColors.grey[500], fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                AppPasswordFieldV2(
                  controller: _cornfirmPasswordTextEditingController,
                  title: LocaleKeys.auth_confirm_password.tr(),
                  titleStyle: AppTypo.bodySmall.copyWith(
                    color: AppColors.grey[600],
                  ),
                  hintText: LocaleKeys.reset_pin_confirm_your_password.tr(),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
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
                        LocaleKeys.bothPasswordsMustMatch.tr(),
                        style: AppTypo.bodyTiny.copyWith(
                          color: AppColors.grey[500],
                        ),
                      ),
                    ),
                  ],
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
                      ForgotPinCubit.password =
                          _passwordTextEditingController.text;
                      context.read<ForgotPinCubit>().onResetPin();
                    }
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.account_activation_take_a_selfie_powered_by
                          .tr(),
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
