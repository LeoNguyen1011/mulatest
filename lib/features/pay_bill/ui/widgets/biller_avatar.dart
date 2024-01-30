import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/index.dart';

class BillerAvatar extends StatelessWidget {
  const BillerAvatar({
    super.key,
    required this.onTap,
    required this.name,
  });

  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  onTap: onTap,
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
        const SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: AppTypo.bodyTiny,
        ),
      ],
    );
  }
}
