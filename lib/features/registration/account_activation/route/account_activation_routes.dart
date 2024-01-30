import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/cubit/account_activation_cubit.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/pages/account_activation/account_activation_page.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/pages/account_activation_confirm_otp/account_activation_confirm_otp_page.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/pages/face_scan/account_activation_face_scan_page.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/pages/setup_pin/account_activation_confirm_pin_page.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/pages/setup_pin/account_activation_setup_pin_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class AccountActivationRoutes {
  ShellRoute get route => ShellRoute(
        routes: [
          GoRoute(
            path: Routes.accountActivationPage,
            name: Routes.accountActivationPage,
            builder: (context, state) =>
                _provider(const AccountActivationPage()),
          ),
          GoRoute(
            path: Routes.accountActivationConfirmOtpPage,
            name: Routes.accountActivationConfirmOtpPage,
            builder: (context, state) {
              return _provider(const AccountActivationConfirmOtpPage());
            },
          ),
          GoRoute(
            path: Routes.accountActivationSetupPinPage,
            name: Routes.accountActivationSetupPinPage,
            builder: (context, state) =>
                _provider(const AccountActivationSetupPinPage()),
          ),
          GoRoute(
            path: Routes.accountActivationConfirmPinPage,
            name: Routes.accountActivationConfirmPinPage,
            builder: (context, state) => _provider(
              AccountActivationCornfirmPinPage(
                pinHasSet: state.extra as String,
              ),
            ),
          ),
          GoRoute(
            path: Routes.accountActivationFaceScanPage,
            name: Routes.accountActivationFaceScanPage,
            builder: (context, state) =>
                _provider(const AccountActivationFaceScanPage()),
          ),
        ],
        builder: (_, __, child) => child,
      );

  BlocProvider<AccountActivationCubit> _provider(Widget child) {
    return BlocProvider(
      create: (_) => AccountActivationCubit(),
      child: child,
    );
  }
}
