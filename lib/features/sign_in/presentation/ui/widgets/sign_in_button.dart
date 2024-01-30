import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/ui/widgets/popup_signin_locked.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

import '../../../../../common/widgets/dialog_utils.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
        listener: (context, state) async {
      state.status == BaseStateStatus.failed
          ? ((state.errorMessage.contains("locked") == true) ||
                  (state.errorMessage.contains("Locked") == true)
              ? DialogUtils.show(
                  context: context,
                  barrierDismissible: false,
                  insetPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  child: const PopupSignInLocked(),
                )
              : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 44),
                  content: Text(
                    state.errorMessage,
                    style: AppTypo.bodySmall.copyWith(color: AppColors.white),
                  ))))
          : null;
    }, child: BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return AppPrimaryButton(
            width: double.infinity,
            title: LocaleKeys.auth_sign_in.tr(),
            status: state.status,
            onPressed: () {
              context
                  .read<SignInCubit>()
                  .signIn(password: SignInCubit.passwordForSignInButton);
            });
      },
    ));
  }
}
