import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/enums/transfer_to_type.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/app_text_field_v2.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class TransferSetupInfoPage extends StatelessWidget {
  const TransferSetupInfoPage({
    super.key,
    required this.transferToType,
  });
  final TransferToType transferToType;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.transfer.tr(),
      ),
      extendBodyBehindAppBar: true,
      bottomButtonTitle: LocaleKeys.review.tr(),
      bottomButtonOnPressed: () {
        context.push(Routes.transferToReviewPaymentPage);
      },
      isShowPoweredBy: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _transferFromWidget,
            Divider(
              thickness: 3,
              color: AppColors.grey[300],
            ),
            _transferToWidget,
            const Divider(
              thickness: 0.2,
            ),
            _promptPayInfo,
          ],
        ),
      ),
    );
  }

  Widget get _promptPayInfo => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (transferToType == TransferToType.promptPay) ...[
              Text(
                LocaleKeys.promptPayCitizenIDOnly.tr(),
                style: AppTypo.bodySmall.copyWith(
                  color: AppColors.grey[600],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "**********254",
                style: AppTypo.paragraph,
              ),
            ],
            if (transferToType == TransferToType.bankAccountAdded) ...[
              Text(
                LocaleKeys.name.tr(),
                style: AppTypo.bodySmall.copyWith(
                  color: AppColors.grey[600],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Name",
                style: AppTypo.paragraph,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                LocaleKeys.bankName.tr(),
                style: AppTypo.bodySmall.copyWith(
                  color: AppColors.grey[600],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Bank name",
                style: AppTypo.paragraph,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                LocaleKeys.accountNo.tr(),
                style: AppTypo.bodySmall.copyWith(
                  color: AppColors.grey[600],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "000000000000",
                style: AppTypo.paragraph,
              ),
            ],
            const SizedBox(
              height: 16,
            ),
            AppTextFieldV2(
              hintText: LocaleKeys.enterAmount.tr(),
              title: LocaleKeys.amount.tr(),
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: 16,
            ),
            AppTextFieldV2(
              hintText: LocaleKeys.enterPersonalNoteOptional.tr(),
              title: LocaleKeys.note.tr(),
              controller: TextEditingController(),
              maxLength: 40,
            ),
          ],
        ),
      );

  Widget get _transferFromWidget => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.transferFrom.tr(),
              style: AppTypo.bodySmall.copyWith(
                color: AppColors.grey[600],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Assets.images.mulaLogo.image(width: 32, height: 32),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MULA Wallet',
                        style: AppTypo.bodyTiny.copyWith(
                          color: AppColors.grey[600],
                        ),
                      ),
                      Text(
                        'THB 42,000.00',
                        style: AppTypo.bodyTiny,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget get _transferToWidget => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.transferTo.tr(),
                  style: AppTypo.bodySmall.copyWith(
                    color: AppColors.grey[600],
                  ),
                ),
                if (transferToType == TransferToType.bankAccountAdded)
                  Assets.svg.addBankAccount.svg(),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(64),
                    ),
                    border: Border.all(
                      color: AppColors.grey[300]!,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.images.promptPayLogo.image(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Sirapat",
                  style: AppTypo.bodyTiny.copyWith(color: AppColors.grey[600]),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: AppColors.burgundy,
                ),
              ),
            ),
          ],
        ),
      );
}
