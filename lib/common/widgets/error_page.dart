import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.sub,
    required this.title,
  });

  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const BaseAppBar(),
      bottomButtonOnPressed: () {
        context.pop();
      },
      extendBodyBehindAppBar: true,
      bottomButtonTitle: LocaleKeys.back.tr(),
      isShowPoweredBy: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.svg.alertWarning.svg(width: 100, height: 100),
          const SizedBox(
            height: 32,
          ),
          Text(
            LocaleKeys.noOutstandingBill.tr(),
            style: AppTypo.heading4,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            LocaleKeys.noOutstandingBillForThisAccount.tr(),
            style: AppTypo.bodySmall,
          ),
        ],
      ),
    );
  }
}
