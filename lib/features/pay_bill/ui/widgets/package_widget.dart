import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';
import 'package:mula_biz_mobile/common/app_theme/app_typo.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class PackageWidget extends StatefulWidget {
  const PackageWidget({super.key});

  @override
  State<PackageWidget> createState() => _PackageWidgetState();
}

class _PackageWidgetState extends State<PackageWidget> {
  int _choosedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              LocaleKeys.package.tr(),
              style: AppTypo.bodySmall,
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  children: [
                    Assets.images.euFlag.image(width: 28, height: 18),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "EUR",
                      style: AppTypo.bodySmall,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 64,
              childAspectRatio: 1),
          itemBuilder: (_, int index) => GestureDetector(
            onTap: () {
              setState(() {
                _choosedIndex = index;
              });
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.burgundy),
                    borderRadius: BorderRadius.circular(24),
                    color: _choosedIndex == index ? AppColors.burgundy : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '0000',
                      style: AppTypo.paragraph.copyWith(
                        color: _choosedIndex != index
                            ? AppColors.burgundy
                            : AppColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'TBH 000.00',
                  style: AppTypo.bodyTiny.copyWith(color: AppColors.grey[500]),
                ),
              ],
            ),
          ),
          shrinkWrap: true,
          itemCount: 9,
        ),
      ],
    );
  }
}
