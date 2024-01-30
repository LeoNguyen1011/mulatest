import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/app_theme/app_colors.dart';

class AppBackground extends StatelessWidget {
  static final defaultHeight = 180.h;

  const AppBackground({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? defaultHeight,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.red[300]!,
            AppColors.white,
          ],
        ),
      ),
    );
  }
}
