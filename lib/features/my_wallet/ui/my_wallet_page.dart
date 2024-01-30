import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/wallet_card_widget.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class MyWalletPage extends StatelessWidget {
  const MyWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBar(
        title: "My wallet",
        actions: [
          Assets.svg.home.svg(
              colorFilter: const ColorFilter.mode(
            AppColors.burgundy,
            BlendMode.srcIn,
          )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            WalletCardWidget(
              onTap: () {},
              walletPrice: '50000',
              walletName: "MY WALLET NAME",
              walletNumber: '240260000000163',
            ),
            const SizedBox(
              height: 16,
            ),
            _walletActionsCard(context),
            const SizedBox(
              height: 16,
            ),
            _transactionCard(),
          ],
        ),
      ),
    );
  }

  Card _transactionCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.transaction.tr(),
                  style: AppTypo.heading6,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    LocaleKeys.viewAll.tr(),
                    style: AppTypo.heading7.copyWith(
                        decoration: TextDecoration.underline,
                        color: AppColors.burgundy),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: index.isEven
                          ? Assets.images.mulaLogo.image(width: 40, height: 40)
                          : Assets.svg.credit.svg(),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppColors.grey[300]!)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, left: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      index.isEven
                                          ? LocaleKeys.transferedMoney.tr()
                                          : LocaleKeys.receivedMoney.tr(),
                                      style: AppTypo.heading7,
                                    ),
                                    Text(
                                      "2023-06-26 16:00:00",
                                      style: AppTypo.bodyTiny,
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Text(
                                  "THB  ${index.isEven ? "+" : "-"} 50.00000000",
                                  style: AppTypo.heading7.copyWith(
                                    color: index.isEven
                                        ? AppColors.brand
                                        : AppColors.color6DA92F,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              shrinkWrap: true,
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }

  Card _walletActionsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _walletActionButton(
                icon: Assets.svg.transfer.svg(),
                title: LocaleKeys.transfer.tr(),
                onTap: () {
                  context.push(Routes.transferToPage);
                }),
            _walletActionButton(
              icon: Assets.svg.paybill.svg(),
              title: LocaleKeys.paybill.tr(),
              onTap: () {
                context.push(Routes.payBillPage);
              },
            ),
            _walletActionButton(
              icon: Assets.svg.scan.svg(),
              title: LocaleKeys.scan.tr(),
              onTap: () {
                context.push(Routes.walletScanPage);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _walletActionButton({
    required Widget icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          icon,
          const SizedBox(
            height: 6,
          ),
          Text(
            title.toUpperCase(),
            style: AppTypo.bodyTiny.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
