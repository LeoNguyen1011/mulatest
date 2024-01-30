import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class EBillInformationPage extends StatelessWidget {
  const EBillInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.eBillInformation.tr(),
      ),
      extendBodyBehindAppBar: true,
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
