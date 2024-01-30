import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';
import 'package:mula_biz_mobile/common/app_theme/app_typo.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';

class AppBarForMainPage extends StatelessWidget {
  const AppBarForMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(
                24,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: AppTypo.body,
            ),
            Text(
              "User name",
              style: AppTypo.heading5,
            )
          ],
        ),
        const Spacer(),
        SizedBox(
          width: 24,
          height: 24,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topRight, child: Assets.svg.bell.svg()),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: AppColors.brand,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
