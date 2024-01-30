import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/features/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:mula_biz_mobile/features/forgot_password/presentation/pages/forgot_password_changed_page.dart';
import 'package:mula_biz_mobile/features/forgot_password/presentation/pages/forgot_password_confirm_otp_page.dart';
import 'package:mula_biz_mobile/features/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ForgotPasswordRoutes {
  ShellRoute get route => ShellRoute(
        routes: [
          GoRoute(
            path: Routes.forgotPassword,
            name: Routes.forgotPassword,
            builder: (context, state) => _provider(const ForgotPasswordPage()),
          ),
          GoRoute(
            path: Routes.forgotPasswordConfirmOTP,
            name: Routes.forgotPasswordConfirmOTP,
            builder: (context, state) =>
                _provider(const ForgotPasswordConfirmOtpPage()),
          ),
          GoRoute(
            path: Routes.forgotPasswordChanged,
            name: Routes.forgotPasswordChanged,
            builder: (context, state) =>
                _provider(const ForgotPasswordChangedPage()),
          ),
        ],
        builder: (_, __, child) => child,
      );

  BlocProvider<ForgotPasswordCubit> _provider(Widget child) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: child,
    );
  }
}
