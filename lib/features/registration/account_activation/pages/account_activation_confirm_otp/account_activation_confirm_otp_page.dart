import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/cubit/account_activation_cubit.dart';
import 'package:mula_biz_mobile/common/widgets/confirm_otp_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class AccountActivationConfirmOtpPage extends StatelessWidget {
  const AccountActivationConfirmOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountActivationCubit, AccountActivationState>(
      listener: (context, state) {
        if (state.otpStatus.isLoading) {
          LoadingWidgetController.showLoadingDialog(context);
        } else {
          LoadingWidgetController.hideLoadingDialog(context);
        }

        if (state.otpStatus.success) {
          context.go(Routes.postActivationSuccess);
        }
      },
      builder: (context, state) {
        return ConfirmOtpPage(
          phoneNumber: AccountActivationCubit.phoneNumberToShowOnOtpPage,
          errorText: state.otpConfirmErrorMsg.isNotEmpty
              ? state.otpConfirmErrorMsg
              : '',
          onFilledPIN: (val) {
            context.read<AccountActivationCubit>().onOTPChanged(otp: val);
          },
          onResendOtp: () {
            context.read<AccountActivationCubit>().onResendOtp();
          },
        );
      },
    );
  }
}
