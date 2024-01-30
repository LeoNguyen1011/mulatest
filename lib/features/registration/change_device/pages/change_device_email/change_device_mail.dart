import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/base/bloc/index.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/validation/email_validation.dart';
import 'package:mula_biz_mobile/common/validation/validation_helper.dart';
import 'package:mula_biz_mobile/common/widgets/app_toast.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/app_text_field_v2.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

import '../../cubit/change_device_cubit.dart';

class ChangeDeviceEmailPage extends StatefulWidget {
  const ChangeDeviceEmailPage({super.key});

  @override
  State<ChangeDeviceEmailPage> createState() => _ChangeDeviceEmailPageState();
}

class _ChangeDeviceEmailPageState extends State<ChangeDeviceEmailPage> {
  ValueNotifier<double> heightEmail = ValueNotifier(0);
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<bool> _isError = ValueNotifier(true);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeDeviceCubit, ChangeDeviceState>(
      listenWhen: ((previous, current) =>
          previous.changeMailStatus != current.changeMailStatus),
      listener: (context, state) {
        if (state.changeMailStatus.isLoading) {
          LoadingWidgetController.showLoadingDialog(context);
        } else {
          LoadingWidgetController.hideLoadingDialog(context);
        }

        if (state.changeMailStatus.success) {
          context.pushNamed(Routes.changeDeviceMobileNumber);
        } else if (state.changeMailStatus.failed) {
          AppToast.showToast(state.changeMailStatusErrorMsg);
        }
      },
      child: BaseScaffold(
        extendBodyBehindAppBar: true,
        appBar: const BaseAppBar(),
        body: Padding(
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
              SizedBox(
                height: 24.h,
              ),
              ValueListenableBuilder(
                valueListenable: heightEmail,
                builder: (context, value, child) => AppTextFieldV2(
                  controller: _controller,
                  title: LocaleKeys.auth_email.tr(),
                  titleStyle: AppTypo.bodySmall.copyWith(
                    color: AppColors.grey[600],
                  ),
                  hintText: LocaleKeys
                      .account_activation_activation_enter_your_email
                      .tr(),
                  validator: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _isError.value = true;
                    });
                    if (value?.isEmpty ?? false) {
                      return Email.getError(EmailValidationError.empty).tr();
                    } else if (Email.emailRegExp.hasMatch(value ?? "")) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _isError.value = false;
                      });
                      return null;
                    } else {
                      return Email.getError(EmailValidationError.invalid).tr();
                    }
                  },
                  border: heightEmail.value != 0 ? border() : null,
                  height: heightEmail.value,
                  onChanged: (val) {
                    if (val.isEmpty ||
                        !ValidationHelper.emailRegExp.hasMatch(val)) {
                      heightEmail.value = 17;
                    } else {
                      heightEmail.value = 0;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Spacer(),
            ],
          ),
        ),
        bottomNavigation: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableBuilder<bool>(
                    valueListenable: _isError,
                    builder: (_, val, __) {
                      return AppPrimaryButton(
                        title: LocaleKeys.buttons_next.tr(),
                        width: double.infinity,
                        disable: val,
                        onPressed: () {
                          context
                              .read<ChangeDeviceCubit>()
                              .onSendActivationCode(mail: _controller.text);
                        },
                      );
                    }),
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
