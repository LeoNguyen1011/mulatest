import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/cubit/sign_in_cubit.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPasswordField(
      scrollPadding: const EdgeInsets.only(bottom: 100),
      titleStyle: AppTypo.heading7.copyWith(
        color: AppColors.grey[700],
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          SignInCubit.passwordForSignInButton = value;
        }
      },
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          context.read<SignInCubit>().signIn(password: value);
        }
      },
    );
  }
}
