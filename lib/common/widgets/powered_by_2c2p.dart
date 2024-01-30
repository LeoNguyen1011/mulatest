import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';

class PowerBy2c2p extends StatelessWidget {
  const PowerBy2c2p({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.svg.headCovering.svg(
          width: 102.sp,
          height: 102.sp,
        ),
      ],
    );
  }
}
