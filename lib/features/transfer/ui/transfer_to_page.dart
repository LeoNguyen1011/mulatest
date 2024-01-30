import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/enums/transfer_to_type.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class TransferToPage extends StatelessWidget {
  const TransferToPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.transferTo.tr(),
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          _listTile(
              logo: Assets.images.promptPayLogo.image(width: 44, height: 10),
              title: "Promptpay Own",
              onTap: () {
                context.push(Routes.transferSetupInforPage,
                    extra: TransferToType.promptPay);
              }),
          const Divider(),
          _listTile(
            logo: Assets.svg.credit.svg(),
            title: LocaleKeys.bankAccount.tr(),
            onTap: () {
              context.push(Routes.transferSetupInforPage,
                  extra: TransferToType.bankAccountAdded);
            },
          ),
        ]),
      ),
    );
  }

  Widget _listTile({
    required Widget logo,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          logo,
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              title,
              style: AppTypo.bodySmall,
            ),
          ),
          Assets.svg.arrowRight.svg(),
        ],
      ),
    );
  }
}
