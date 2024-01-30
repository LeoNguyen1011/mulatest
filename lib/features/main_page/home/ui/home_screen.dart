import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/wallet_card_widget.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WalletCardWidget(
          onTap: () {
            context.push(Routes.myWalletPage);
          },
          walletPrice: '50000',
          walletName: "MY WALLET NAME",
          walletNumber: '240260000000163',
        ),
        const SizedBox(
          height: 24,
        ),
        _servicesCard(context),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Card _servicesCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              LocaleKeys.services.tr(),
              style: AppTypo.heading6,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _serviceItem(
                    title: LocaleKeys.mulaGram.tr(),
                    onTap: () {
                      context.push(Routes.qrScanToRegisUserPage);
                    }),
                _serviceItem(
                    title: LocaleKeys.mulaTopUp.tr(),
                    image: Assets.svg.mulaTopUp.svg()),
                _serviceItem(
                    title: LocaleKeys.launchCardTopUp.tr(),
                    image: Assets.svg.launchCardTopUp.svg()),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _serviceItem(
                  title: LocaleKeys.CASHIER.tr(),
                  image: Assets.svg.cashier.svg(),
                ),
                _serviceItem(
                  title: "Future",
                ),
                _serviceItem(
                  title: "Future",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceItem({
    Widget? image,
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.red[300],
                  borderRadius: BorderRadius.circular(64),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: image ?? const SizedBox(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: AppTypo.bodyTiny,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
