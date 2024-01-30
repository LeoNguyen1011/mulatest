import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/index.dart';

import 'package:mula_biz_mobile/gen/assets.gen.dart';

class AppBottomAppBar extends StatefulWidget {
  const AppBottomAppBar({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  State<AppBottomAppBar> createState() => _AppBottomAppBarState();
}

class _AppBottomAppBarState extends State<AppBottomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StyleProvider(
      style: Style(),
      child: ConvexAppBar(
        initialActiveIndex: 2,
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.white,
        controller: widget.controller,
        items: [
          TabItem(icon: Assets.svg.home.svg(), title: 'Home'),
          TabItem(icon: Assets.svg.dashboard.svg(), title: 'Dashboard'),
          TabItem(
            icon: CircleAvatar(
              backgroundColor: AppColors.burgundy,
              child: Assets.svg.scanner.svg(
                fit: BoxFit.none,
                width: 24,
                height: 24,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          TabItem(icon: Assets.svg.briefcase.svg(), title: 'Brefcase'),
          TabItem(icon: Assets.svg.menu.svg(), title: 'More'),
        ],
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return AppTypo.bodyTiny.copyWith(fontSize: 10, fontWeight: FontWeight.w700);
  }
}
