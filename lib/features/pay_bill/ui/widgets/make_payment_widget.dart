import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';
import 'package:mula_biz_mobile/common/app_theme/app_typo.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class MakePaymentWidget extends StatefulWidget {
  const MakePaymentWidget({super.key});

  @override
  State<MakePaymentWidget> createState() => _MakePaymentWidgetState();
}

class _MakePaymentWidgetState extends State<MakePaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.makePayment.tr(),
          style: AppTypo.bodySmall.copyWith(color: AppColors.grey[600]),
        ),
        const SizedBox(
          height: 16,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.burgundy, width: 6),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mula Wallet",
                          style: AppTypo.paragraph,
                        ),
                        Text(
                          "THB 0000.00",
                          style: AppTypo.bodySmall
                              .copyWith(color: AppColors.grey[500]),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "THB 3000.00",
                      style: AppTypo.bodySmall.copyWith(
                        color: AppColors.burgundy,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.burgundy, width: 6),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mula Wallet",
                          style: AppTypo.paragraph,
                        ),
                        Text(
                          "THB 0000.00",
                          style: AppTypo.bodySmall
                              .copyWith(color: AppColors.grey[500]),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "THB 3000.00",
                      style: AppTypo.bodySmall.copyWith(
                        color: AppColors.burgundy,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Assets.svg.minus.svg(),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            overlayShape: SliderComponentShape.noOverlay,
                            trackHeight: 10),
                        child: Slider(
                          value: 20,
                          onChanged: (val) {},
                          max: 100,
                          activeColor: AppColors.burgundy,
                        ),
                      ),
                    ),
                    Assets.svg.add.svg(),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
