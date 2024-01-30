import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/features/forgot_pin/presentation/cubit/forgot_pin_cubit.dart';
import 'package:mula_biz_mobile/features/forgot_pin/presentation/pages/forgot_pin_confirm_password_page.dart';
import 'package:mula_biz_mobile/features/forgot_pin/presentation/pages/forgot_pin_page.dart';
import 'package:mula_biz_mobile/features/forgot_pin/presentation/pages/pin_changed_page.dart';
import 'package:mula_biz_mobile/features/forgot_pin/presentation/pages/reenter_pin_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ForgotPinRoutes {
  ShellRoute get route => ShellRoute(
        routes: [
          GoRoute(
            path: Routes.forgotPinPage,
            name: Routes.forgotPinPage,
            builder: (context, state) => _provider(const ForgotPinPage()),
          ),
          GoRoute(
            path: Routes.forgotPinChangePage,
            name: Routes.forgotPinChangePage,
            builder: (context, state) => _provider(const PinChangedPage()),
          ),
          GoRoute(
            path: Routes.reEnterPinPage,
            name: Routes.reEnterPinPage,
            builder: (context, state) => _provider(ReenterPinPage(
              pin: state.extra as String,
            )),
          ),
          GoRoute(
            path: Routes.forgotPinConfirmPassPage,
            name: Routes.forgotPinConfirmPassPage,
            builder: (context, state) =>
                _provider(const ForgotPinConfirmPasswordPage()),
          ),
        ],
        builder: (_, __, child) => child,
      );

  BlocProvider<ForgotPinCubit> _provider(Widget child) {
    return BlocProvider(
      create: (_) => ForgotPinCubit(),
      child: child,
    );
  }
}
