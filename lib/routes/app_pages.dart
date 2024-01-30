import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/common/widgets/error_page.dart';
import 'package:mula_biz_mobile/common/widgets/input_pin_widget.dart';
import 'package:mula_biz_mobile/common/widgets/mula_gram_details.dart';
import 'package:mula_biz_mobile/common/widgets/slip_page.dart';
import 'package:mula_biz_mobile/features/encashment/routes/encashment_routes.dart';
import 'package:mula_biz_mobile/features/forgot_password/route/forgot_password_routes.dart';
import 'package:mula_biz_mobile/features/forgot_pin/route/forgot_pin_routes.dart';
import 'package:mula_biz_mobile/features/main_page/home/ui/home_screen.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/cubit/invite_user_cubit.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/ui/invite_user_screen.dart';
import 'package:mula_biz_mobile/features/main_page/more/settings/ui/settings_screen.dart';
import 'package:mula_biz_mobile/features/main_page/ui/main_screen.dart';
import 'package:mula_biz_mobile/features/my_wallet/route/my_wallet_routes.dart';
import 'package:mula_biz_mobile/features/pay_bill/routes/pay_bill_routes.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/pages/account_activation/code_scanner_page.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/route/account_activation_routes.dart';
import 'package:mula_biz_mobile/features/registration/change_device/route/change_device_routes.dart';
import 'package:mula_biz_mobile/features/registration/widgets/post_activation_page.dart';
import 'package:mula_biz_mobile/features/registration/widgets/take_a_selfie_page.dart';
import 'package:mula_biz_mobile/features/registration/widgets/terms_and_conditions_page.dart';
import 'package:mula_biz_mobile/features/sign_in/route/sign_in_routes.dart';
import 'package:mula_biz_mobile/features/splash/presentation/pages/splash_page.dart';
import 'package:mula_biz_mobile/features/transfer/route/transfer_routes.dart';
import 'package:mula_biz_mobile/features/wallet_scan/routes/wallet_scan_routes.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppPages {
  final router = GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    routes: [
      AccountActivationRoutes().route,
      ChangeDeviceRoutes().route,
      ForgotPasswordRoutes().route,
      SignInRoutes().route,
      ForgotPinRoutes().route,
      MyWalletRoutes().route,
      TransferRoutes().route,
      PayBillRoutes().route,
      WalletScanRoutes().route,
      EncashmentRoutes().route,
      GoRoute(
        name: Routes.main,
        path: Routes.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        name: Routes.home,
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.splash,
        name: Routes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Routes.takeASelfie,
        name: Routes.takeASelfie,
        builder: (context, state) => TakeASelfiePage(
          onPressed: state.extra as VoidCallback,
        ),
      ),
      GoRoute(
        path: Routes.qrScannerPage,
        name: Routes.qrScannerPage,
        builder: (context, state) => const CodeScannerPage(),
      ),
      GoRoute(
        path: Routes.inviteUserScreen,
        name: Routes.inviteUserScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => InviteUserCubit(),
          child: const InviteUserScreen(),
        ),
      ),
      GoRoute(
        path: Routes.inputPinWidget,
        name: Routes.inputPinWidget,
        builder: (context, state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return InputPinWidget(
            title: data['title'],
            onFilledPin: data["onFilledPin"],
          );
        },
      ),
      GoRoute(
        path: Routes.settingsScreen,
        name: Routes.settingsScreen,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: Routes.postActivationSuccess,
        name: Routes.postActivationSuccess,
        builder: (context, state) => const PostActivationPage(
          success: true,
        ),
      ),
      GoRoute(
        path: Routes.termsAndConditions,
        name: Routes.termsAndConditions,
        builder: (context, state) => const TermsAndConditionsPage(),
      ),
      GoRoute(
        path: Routes.errorPage,
        name: Routes.errorPage,
        builder: (context, state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return ErrorPage(
            sub: data['sub'],
            title: data["title"],
          );
        },
      ),
      GoRoute(
        path: Routes.slipPage,
        name: Routes.slipPage,
        builder: (context, state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return SlipPage(
            title: data['title'],
          );
        },
      ),
      GoRoute(
        path: Routes.mulaGramDetail,
        name: Routes.mulaGramDetail,
        builder: (context, state) {
          return const MulaGramDetails();
        },
      ),
    ],
  );
}
