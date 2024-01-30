import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/enums/bill_payment_method_type.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/app_text_field_v2.dart';
import 'package:mula_biz_mobile/features/pay_bill/ui/widgets/biller_avatar.dart';
import 'package:mula_biz_mobile/features/pay_bill/ui/widgets/package_widget.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class PaybillSetupInfoPage extends StatelessWidget {
  const PaybillSetupInfoPage({
    super.key,
    required this.billPaymentMethodType,
  });
  final BillPaymentMethodType billPaymentMethodType;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: billPaymentMethodType.title,
      ),
      bottomButtonOnPressed: () {
        context.push(Routes.payBillPreviewPage);
      },
      bottomButtonTitle: LocaleKeys.pay.tr(),
      isShowPoweredBy: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.biller.tr(),
                style: AppTypo.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              BillerAvatar(
                onTap: () {},
                name: "Biller name",
              ),
              const SizedBox(
                height: 16,
              ),
              billPaymentMethodType == BillPaymentMethodType.prepaid
                  ? _prepaid()
                  : _eBill(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _eBill(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFieldV2(
          title: LocaleKeys.contractNo.tr(),
          hintText: LocaleKeys.enterContractNo.tr(),
          suffixIcon: GestureDetector(
            onTap: () {
              context.push(Routes.errorPage, extra: {
                "title": LocaleKeys.noOutstandingBill.tr(),
                "sub": LocaleKeys.noOutstandingBillForThisAccount.tr(),
              });
            },
            child: Assets.svg.scan.svg(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        AppTextFieldV2(
          title: LocaleKeys.mobileNo.tr(),
          hintText: LocaleKeys.mobileNo.tr(),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          LocaleKeys.amount.tr(),
          style: AppTypo.bodySmall.copyWith(
            color: AppColors.grey[600],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  8,
                ),
              ),
              border: Border.all(color: AppColors.grey[400]!)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "THB",
                  style: AppTypo.paragraph,
                ),
                Text(
                  "12,500.00",
                  style: AppTypo.paragraph,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          LocaleKeys.biller.tr(),
          style: AppTypo.bodySmall.copyWith(
            color: AppColors.grey[600],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            color: AppColors.burgundy,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "0000000000000",
                            style: AppTypo.bodyTiny,
                          )
                        ],
                      ),
                      Text(
                        'Bill No. 020019320090',
                        style: AppTypo.bodyTiny.copyWith(
                          color: AppColors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "PAY BY 20 JUN 2023",
                        style: AppTypo.heading7,
                      ),
                      Text(
                        'THB 2,520.58',
                        style: AppTypo.bodyTiny,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Assets.svg.arrowRight.svg(
                  colorFilter: ColorFilter.mode(
                    AppColors.grey[500]!,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _prepaid() {
    return Column(
      children: [
        const PackageWidget(),
        AppTextFieldV2(
          title: LocaleKeys.mobileNo.tr(),
          hintText: LocaleKeys.enterMobileNo.tr(),
        ),
        const SizedBox(
          height: 16,
        ),
        AppTextFieldV2(
          title: LocaleKeys.note.tr(),
          hintText: LocaleKeys.enterPersonalNoteOptional.tr(),
          maxLength: 40,
        ),
      ],
    );
  }
}
