import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/features/pay_bill/ui/widgets/make_payment_widget.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class PayBillReviewPage extends StatelessWidget {
  const PayBillReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.billPayment.tr(),
      ),
      bottomButtonOnPressed: () {
        context.push(Routes.payBillConfirmPage);
      },
      bottomButtonTitle: LocaleKeys.review.tr(),
      isShowPoweredBy: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MakePaymentWidget(),
              const SizedBox(
                height: 16,
              ),
              _transferTo(),
              const SizedBox(
                height: 16,
              ),
              _info(),
            ],
          ),
        ),
      ),
    );
  }

  Column _info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoField(title: LocaleKeys.amount.tr(), data: "300.00 TBH"),
        const Divider(
          thickness: 0.3,
        ),
        _infoField(title: LocaleKeys.paymentFee.tr(), data: "300.00 TBH"),
        const SizedBox(
          height: 16,
        ),
        _infoField(title: LocaleKeys.ewaDrawFee.tr(), data: "300.00 TBH"),
        const Divider(
          thickness: 0.3,
        ),
        _infoField(title: LocaleKeys.note.tr(), data: "300.00 TBH"),
        Text(
          "This is the note",
          style: AppTypo.bodyTiny.copyWith(),
        )
      ],
    );
  }

  Row _infoField({required String title, required String data}) {
    return Row(
      children: [
        Text(
          title,
          style: AppTypo.bodySmall,
        ),
        const Spacer(),
        Text(
          data,
          style: AppTypo.bodySmall,
        ),
      ],
    );
  }

  Row _transferTo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Assets.svg.transferToArrow.svg(),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey[400]!,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              width: 64,
              height: 64,
              child: Stack(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 35,
                        height: 35,
                        color: AppColors.burgundy,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '0000000000000',
                style: AppTypo.bodyTiny.copyWith(color: AppColors.grey[500]),
              ),
              Text(
                '061-354-8912',
                style: AppTypo.bodyTiny,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
