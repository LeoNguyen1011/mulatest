import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/enums/bill_payment_method_type.dart';
import 'package:mula_biz_mobile/features/pay_bill/ui/e_bill_information_page.dart';
import 'package:mula_biz_mobile/features/pay_bill/ui/pay_bill_confirm_page.dart';
import 'package:mula_biz_mobile/features/pay_bill/ui/pay_bill_page.dart';
import 'package:mula_biz_mobile/features/pay_bill/ui/pay_bill_review_page.dart';
import 'package:mula_biz_mobile/features/pay_bill/ui/pay_bill_setup_info_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class PayBillRoutes {
  ShellRoute get route => ShellRoute(
        routes: [
          GoRoute(
            name: Routes.payBillPage,
            path: Routes.payBillPage,
            builder: (context, state) => const PayBillPage(),
          ),
          GoRoute(
            name: Routes.payBillSetupInforPage,
            path: Routes.payBillSetupInforPage,
            builder: (context, state) => PaybillSetupInfoPage(
              billPaymentMethodType: state.extra as BillPaymentMethodType,
            ),
          ),
          GoRoute(
            name: Routes.payBillPreviewPage,
            path: Routes.payBillPreviewPage,
            builder: (context, state) => const PayBillReviewPage(),
          ),
          GoRoute(
            name: Routes.payBillConfirmPage,
            path: Routes.payBillConfirmPage,
            builder: (context, state) => const PayBillConfirmPage(),
          ),
          GoRoute(
            name: Routes.eBillInformation,
            path: Routes.eBillInformation,
            builder: (context, state) => const EBillInformationPage(),
          ),
        ],
        builder: (_, __, child) => child,
      );
}
