import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/confirm_otp_page.dart';
import 'package:mula_biz_mobile/features/registration/change_device/cubit/change_device_cubit.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ChangeDeviceConfirmOtpPage extends StatelessWidget {
  const ChangeDeviceConfirmOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeDeviceCubit, ChangeDeviceState>(
      listener: (context, state) {
        if (state.otpStatus.isLoading) {
          LoadingWidgetController.showLoadingDialog(context);
        } else {
          LoadingWidgetController.hideLoadingDialog(context);
        }

        if (state.otpStatus.success) {
          context.pushNamed(Routes.postActivationSuccess);
        }
      },
      builder: (context, state) {
        return ConfirmOtpPage(
          phoneNumber: ChangeDeviceCubit.phoneNumberToShowOnOtpPage,
          errorText: state.confirmOtpErrorMsg.isNotEmpty
              ? state.confirmOtpErrorMsg
              : '',
          onFilledPIN: (val) {
            context.read<ChangeDeviceCubit>().onOTPChanged(otp: val);
          },
          onResendOtp: () {
            context.read<ChangeDeviceCubit>().onResendOtp();
          },
        );
      },
    );
  }
}
