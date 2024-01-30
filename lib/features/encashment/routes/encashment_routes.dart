import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/features/encashment/widgets/qr_scan_to_regis_user_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class EncashmentRoutes {
  ShellRoute get route => ShellRoute(
        routes: [
          GoRoute(
            path: Routes.qrScanToRegisUserPage,
            name: Routes.qrScanToRegisUserPage,
            builder: (context, state) => const QRScanToRegisUserPage(),
          ),
        ],
        builder: (_, __, child) => child,
      );
}
