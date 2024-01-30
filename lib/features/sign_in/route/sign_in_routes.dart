import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/ui/sigin_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class SignInRoutes {
  ShellRoute get route => ShellRoute(
        routes: [
          GoRoute(
            path: Routes.signIn,
            name: Routes.signIn,
            builder: (context, state) => _provider(const SignInPage()),
          ),
        ],
        builder: (_, __, child) => child,
      );

  BlocProvider<SignInCubit> _provider(Widget child) {
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: child,
    );
  }
}
