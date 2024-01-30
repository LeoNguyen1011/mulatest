import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/app_theme/app_typo.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
    required this.desc,
    required this.title,
  });

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.svg.notFound.svg(),
          const SizedBox(
            height: 32,
          ),
          Text(
            title,
            style: AppTypo.heading4,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            desc,
            style: AppTypo.paragraph,
          ),
        ],
      ),
    );
  }
}
