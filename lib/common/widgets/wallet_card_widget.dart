import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/app_theme/app_typo.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class WalletCardWidget extends StatefulWidget {
  const WalletCardWidget({
    super.key,
    required this.onTap,
    required this.walletName,
    required this.walletNumber,
    required this.walletPrice,
  });

  final VoidCallback onTap;
  final String walletName;
  final String walletPrice;
  final String walletNumber;

  @override
  State<WalletCardWidget> createState() => _WalletCardWidgetState();
}

class _WalletCardWidgetState extends State<WalletCardWidget> {
  bool _isShowWalletNumber = false;

  String walletNumberToggleHidden = '';

  @override
  void initState() {
    String hiddenText =
        List.generate(widget.walletNumber.length - 3, (index) => 'x').join();
    String showNumber =
        widget.walletNumber.substring(widget.walletNumber.length - 3);
    walletNumberToggleHidden = '$hiddenText$showNumber';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          image: DecorationImage(
              image: Assets.images.walletBackground.provider(),
              fit: BoxFit.none),
          color: Colors.red,
        ),
        height: 156,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.walletName,
                  style: AppTypo.heading6,
                ),
              ),
              Row(children: [
                Text(
                  LocaleKeys.active.tr(),
                  style: AppTypo.bodyTiny,
                ),
                Assets.svg.tick.svg(),
              ]),
              const Spacer(),
              Text(
                "BALANCE",
                style: AppTypo.bodyTiny,
              ),
              Text(
                "TBH ${widget.walletPrice}",
                style: AppTypo.heading4,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isShowWalletNumber = !_isShowWalletNumber;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _isShowWalletNumber
                          ? widget.walletNumber
                          : walletNumberToggleHidden,
                      style: AppTypo.bodyTiny,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(
                      _isShowWalletNumber
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 16,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
