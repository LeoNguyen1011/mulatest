import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/enums/transfer_to_type.dart';
import 'package:mula_biz_mobile/features/transfer/ui/transfer_review_page.dart';
import 'package:mula_biz_mobile/features/transfer/ui/transfer_setup_info_page.dart';
import 'package:mula_biz_mobile/features/transfer/ui/transfer_to_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class TransferRoutes {
  ShellRoute get route => ShellRoute(
        routes: [
          GoRoute(
            name: Routes.transferToPage,
            path: Routes.transferToPage,
            builder: (context, state) => const TransferToPage(),
          ),
          GoRoute(
            name: Routes.transferSetupInforPage,
            path: Routes.transferSetupInforPage,
            builder: (context, state) => TransferSetupInfoPage(
              transferToType: state.extra as TransferToType,
            ),
          ),
          GoRoute(
            name: Routes.transferToReviewPaymentPage,
            path: Routes.transferToReviewPaymentPage,
            builder: (context, state) => const TransferReviewPage(),
          ),
        ],
        builder: (_, __, child) => child,
      );
}
