import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';
import 'package:mula_biz_mobile/common/app_theme/app_typo.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/cubit/sign_in_cubit.dart';

import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

import '../../../../../common/widgets/buttons/app_button.dart';

class PopupSignInLocked extends StatefulWidget {
  const PopupSignInLocked({super.key});

  @override
  State<PopupSignInLocked> createState() => _PopupSignInLockedState();
}

class _PopupSignInLockedState extends State<PopupSignInLocked> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color(0xFFFFFFFF),
      ),
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.svg.resetPassword.svg(
                width: 80.sp,
                height: 80.sp,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                LocaleKeys.yourAccountIsLocked.tr(),
                style: AppTypo.heading5,
              ),
              const SizedBox(
                height: 10,
              ),
              state.errorMessage.contains("Account")
                  ? Text(
                      LocaleKeys.youCanResetYourPasswordByVerifyingYourIdentity
                          .tr(),
                      style: AppTypo.bodySmall,
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      LocaleKeys.youCanResetYourPinByVerifyingYourIdentity.tr(),
                      style: AppTypo.bodySmall,
                      textAlign: TextAlign.center,
                    ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: AppPrimaryButton(
                  width: double.infinity,
                  title: state.errorMessage.contains("Account")
                      ? LocaleKeys.auth_reset_password.tr()
                      : LocaleKeys.auth_reset_pin.tr(),
                  disable: false,
                  onPressed: () {
                    // context.pop();
                    // state.errorMessage.contains("Account")
                    //     ? context
                    //         .pushNamed(ForgotPasswordRoutes().resetPassword)
                    //     : context.pushNamed(Routes.resetPin);
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  LocaleKeys.later.tr(),
                  style: AppTypo.heading6.copyWith(color: AppColors.burgundy),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          );
        },
      ),
    );
  }
}
