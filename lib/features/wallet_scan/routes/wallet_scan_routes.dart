import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/features/wallet_scan/ui/wallet_scan_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class WalletScanRoutes {
  ShellRoute get route => ShellRoute(
        routes: [
          GoRoute(
            name: Routes.walletScanPage,
            path: Routes.walletScanPage,
            builder: (context, state) => const WalletScanPage(),
          ),
        ],
        builder: (_, __, child) => child,
      );
}
