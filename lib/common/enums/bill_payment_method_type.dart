import 'package:easy_localization/easy_localization.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

enum BillPaymentMethodType {
  prepaid,
  eBill,
}

extension BillPaymentMethodTypeExtention on BillPaymentMethodType {
  String get title {
    switch (this) {
      case BillPaymentMethodType.prepaid:
        return LocaleKeys.prepaid.tr();
      case BillPaymentMethodType.eBill:
        return "e-bill";
    }
  }
}
