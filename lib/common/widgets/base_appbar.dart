import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? icon;
  final bool? hasBack;
  final Widget? leading;
  final double? elevation;
  final double? leadingWidth;
  final Widget? appBarWidget;
  final PreferredSize? bottom;
  final List<Widget>? actions;
  final double? titleSpacing;
  final Function()? onPressedLeading;
  final Color? backgroundColor;
  final Color? leadingColor;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final bool? backwardsCompatibility;
  final Color? textColor;
  final dynamic result;

  const BaseAppBar({
    Key? key,
    this.backgroundColor,
    this.titleSpacing,
    this.title,
    this.icon,
    this.leading,
    this.leadingWidth,
    this.hasBack,
    this.bottom,
    this.leadingColor,
    this.appBarWidget,
    this.textColor,
    this.elevation,
    this.backwardsCompatibility,
    this.actions,
    this.onPressedLeading,
    this.result,
    this.systemUiOverlayStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(44.0),
      child: AppBar(
        backgroundColor: backgroundColor ?? Colors.transparent,
        elevation: elevation ?? 0,
        leadingWidth: leadingWidth,
        titleSpacing: titleSpacing,
        systemOverlayStyle: systemUiOverlayStyle ?? SystemUiOverlayStyle.dark,
        leading: leading ??
            Visibility(
              visible: hasBack ?? true,
              child: CupertinoButton(
                onPressed: () {
                  if (onPressedLeading != null) {
                    onPressedLeading!();
                  } else {
                    context.pop(result);
                  }
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20.sp,
                  color: AppColors.titleAndLabel,
                ),
              ),
            ),
        title: appBarWidget ??
            Text(
              title ?? "",
              style: AppTypo.heading6,
            ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: actions ?? [],
            ),
          ),
        ],
        bottom: bottom,
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44.h);
}
