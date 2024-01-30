import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class TransferReviewPage extends StatelessWidget {
  const TransferReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.reviewPayment.tr(),
      ),
      bottomButtonTitle: LocaleKeys.confirm.tr(),
      isShowPoweredBy: true,
      bottomButtonOnPressed: () async {
        await context.pushNamed(
          Routes.inputPinWidget,
          extra: {
            "onFilledPin": (String val) async {
              context.go(Routes.slipPage);
            }
          },
        );
      },
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _from(name: "Name"),
            const Divider(
              thickness: 0.3,
            ),
            _to(
              name: "Name",
              accountNumber: '24026004000000163',
            ),
            const Divider(
              thickness: 0.3,
            ),
            _amount(ammount: "12,500.00"),
            const Divider(
              thickness: 0.3,
            ),
            _fee(fee: "00.00"),
            const Divider(
              thickness: 0.3,
            ),
            _note(note: "This is note")
          ],
        ),
      ),
    );
  }

  Padding _note({required String note}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.note.tr(),
            style: AppTypo.bodySmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            note,
            style: AppTypo.bodyTiny.copyWith(
              color: AppColors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Padding _amount({required String ammount}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.amount.tr(),
            style: AppTypo.bodySmall,
          ),
          Text(
            "$ammount THB",
            style: AppTypo.bodyTiny,
          ),
        ],
      ),
    );
  }

  Padding _fee({required String fee}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.amount.tr(),
            style: AppTypo.bodySmall,
          ),
          Text(
            "$fee THB",
            style: AppTypo.bodyTiny,
          ),
        ],
      ),
    );
  }

  Widget _to({required String name, required String accountNumber}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.to.tr(),
            style: AppTypo.bodySmall,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    name,
                    style: AppTypo.bodyTiny,
                  ),
                ],
              ),
              Text(
                accountNumber,
                style: AppTypo.bodyTiny.copyWith(
                  color: AppColors.grey[600],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _from({required String name}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.from.tr(),
            style: AppTypo.bodySmall,
          ),
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                color: Colors.red,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: AppTypo.bodyTiny,
              ),
            ],
          )
        ],
      ),
    );
  }
}
