import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/confirm_otp_page.dart';
import 'package:mula_biz_mobile/features/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

import '../../../../base/bloc/bloc_status.dart';

class ForgotPasswordConfirmOtpPage extends StatefulWidget {
  const ForgotPasswordConfirmOtpPage({super.key});

  @override
  State<ForgotPasswordConfirmOtpPage> createState() =>
      _ForgotPasswordConfirmOtpPageState();
}

class _ForgotPasswordConfirmOtpPageState
    extends State<ForgotPasswordConfirmOtpPage> {
  final TextEditingController controller = TextEditingController();
  var duration = 90;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.otpConfirmStatus.isLoading) {
          LoadingWidgetController.showLoadingDialog(context);
        } else {
          LoadingWidgetController.hideLoadingDialog(context);
        }

        if (state.otpConfirmStatus.success) {
          context.pushNamed(Routes.forgotPasswordChanged);
        }
      },
      builder: (context, state) {
        return ConfirmOtpPage(
          phoneNumber: ForgotPasswordCubit.phoneNumberTemp,
          errorText: state.otpConfirmErrorMsg,
          onFilledPIN: (val) {
            if (val.length == 6) {
              context.read<ForgotPasswordCubit>().onOtpChanged(otp: val);
            }
          },
          onResendOtp: () {
            context.read<ForgotPasswordCubit>().onResetPassword();
          },
        );
      },
    );
  }
}
