import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/widgets/app_qr_scanner_widget.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class QRScanToRegisUserPage extends StatelessWidget {
  const QRScanToRegisUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppQRScannerWidget(
      sub: LocaleKeys.placeQRCodeInTheMiddleOfFocusArea.tr(),
      title: LocaleKeys.scanMULAWalletQRCode.tr(),
      onDetect: (val) {
        context.push(Routes.mulaGramDetail);
      },
      isShowFlashlight: true,
    );
  }
}
