import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/local_data/sp_keys.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/ui/widgets/index.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/ui/widgets/pin_number_field.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

import '../../../../gen/assets.gen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SignInView();
  }
}

class _SignInView extends StatelessWidget {
  const _SignInView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) async {
        if (state.status.success) {
          context.go(Routes.main);
        }
        if (state.status.failed &&
            (state.errorMessage
                    .contains("อุปกรณ์ไม่ได้ลงทะเบียนกับผู้ใช้นี้") ||
                state.errorMessage
                    .contains("Device is not registered with this user"))) {
          context.go(Routes.accountActivationPage);
          await LocalStorageImpl().remove(SPKeys.deviceId.name);
        }
      },
      child: BaseScaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: const BaseAppBar(
          hasBack: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 48),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SigninHeader(),
                      SizedBox(
                        height: 24.h,
                      ),
                      const PinNumberField(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                endIndent: 0,
                                indent: 0,
                                color: AppColors.grey[300],
                                thickness: 1.h,
                                height: 20.h,
                              ),
                            ),
                            Text(
                              LocaleKeys.auth_or.tr(),
                              style: AppTypo.heading7.copyWith(
                                color: AppColors.grey[600],
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                endIndent: 0,
                                indent: 0,
                                color: AppColors.grey[300],
                                height: 20.h,
                                thickness: 1.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const PasswordField(),
                      SizedBox(
                        height: 48.h,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ResetPinOrPassword(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const SignInButton(),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.account_activation_take_a_selfie_powered_by
                              .tr(),
                          style: AppTypo.bodyTiny
                              .copyWith(color: AppColors.grey[700]),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
