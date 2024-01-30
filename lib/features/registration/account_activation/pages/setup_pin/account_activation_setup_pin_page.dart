import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/widgets/setup_pin_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class AccountActivationSetupPinPage extends StatelessWidget {
  const AccountActivationSetupPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SetupPinPage(
      onChanged: (val) {},
      onCompleted: (val) {
        context.pushNamed(Routes.accountActivationConfirmPinPage, extra: val);
      },
      isConfirm: false,
      controller: TextEditingController(),
    );
  }
}
