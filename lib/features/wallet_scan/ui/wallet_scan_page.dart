import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/widgets/app_qr_scanner_widget.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class WalletScanPage extends StatefulWidget {
  const WalletScanPage({super.key});

  @override
  State<WalletScanPage> createState() => _WalletScanPageState();
}

class _WalletScanPageState extends State<WalletScanPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppQRScannerWidget(
      title: LocaleKeys.scanMULAWalletQRCode.tr(),
      sub: LocaleKeys.placeQRCodeInTheMiddleOfFocusArea.tr(),
      onDetect: (val) {},
      isShowFlashlight: true,
      isShowImage: true,
      isShowQR: true,
    );
  }
}
