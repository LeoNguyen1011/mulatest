import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/features/registration/change_device/cubit/change_device_cubit.dart';
import 'package:mula_biz_mobile/features/registration/change_device/pages/change_device_confirm_otp/change_device_confirm_otp_page.dart';
import 'package:mula_biz_mobile/features/registration/change_device/pages/change_device_email/change_device_mail.dart';
import 'package:mula_biz_mobile/features/registration/change_device/pages/change_device_mobile_number/change_device_mobile_number.dart';
import 'package:mula_biz_mobile/features/registration/change_device/pages/face_scan/change_device_face_scan_page.dart';
import 'package:mula_biz_mobile/features/registration/change_device/pages/setup_pin/change_device_confirm_pin_page.dart';
import 'package:mula_biz_mobile/features/registration/change_device/pages/setup_pin/change_device_setup_pin_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ChangeDeviceRoutes {
  ShellRoute get route => ShellRoute(
        routes: [
          GoRoute(
            path: Routes.changeDeviceEmail,
            name: Routes.changeDeviceEmail,
            builder: (context, state) =>
                _provider(const ChangeDeviceEmailPage()),
          ),
          GoRoute(
            path: Routes.changeDeviceMobileNumber,
            name: Routes.changeDeviceMobileNumber,
            builder: (context, state) =>
                _provider(const ChangeDeviceMobileNumberPage()),
          ),
          GoRoute(
              path: Routes.changeDeviceConfirmPin,
              name: Routes.changeDeviceConfirmPin,
              builder: (context, state) => _provider(
                  ChangeDeviceCornfirmPinPage(
                      pinHasSet: state.extra as String))),
          GoRoute(
              path: Routes.changeDeviceSetupPin,
              name: Routes.changeDeviceSetupPin,
              builder: (context, state) =>
                  _provider(const ChangeDeviceSetupPinPage())),
          GoRoute(
              path: Routes.changeDeviceFaceScanPage,
              name: Routes.changeDeviceFaceScanPage,
              builder: (context, state) =>
                  _provider(const ChangeDeviceFaceScanPage())),
          GoRoute(
              path: Routes.changeDeviceConfirmOtp,
              name: Routes.changeDeviceConfirmOtp,
              builder: (context, state) =>
                  _provider(const ChangeDeviceConfirmOtpPage())),
        ],
        builder: (context, state, child) => child,
      );

  BlocProvider<ChangeDeviceCubit> _provider(Widget child) {
    return BlocProvider(
      create: (context) => ChangeDeviceCubit(),
      child: child,
    );
  }
}
