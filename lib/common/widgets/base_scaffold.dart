import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/app_background.dart';
import 'package:mula_biz_mobile/common/widgets/powered_by_widget.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final bool hasTabBar;
  final bool? hasBackgroundImage;
  final bool? addKey;
  final bool? resizeToAvoidBottomInset;
  final String? backgroundImage;
  final bool? hasDismissKeyboard;
  final bool? marginTop;
  final bool? isFull;
  final bool? isBottom;
  final Widget? bottomNavigation;
  final bool extendBodyBehindAppBar;
  final Color backgroundColor;
  final Function(bool)? showFloat;
  final Function(bool)? onScroll;
  final bool showBackgroundGradient;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final String? bottomButtonTitle;
  final VoidCallback? bottomButtonOnPressed;
  final bool? isDisableBottomButton;
  final bool? isShowPoweredBy;

  final String? cancelBottomButtonTitle;
  final VoidCallback? cancelBottomButtonOnPressed;

  final Widget? customBottomWidget;

  const BaseScaffold({
    Key? key,
    this.appBar,
    this.marginTop,
    this.addKey,
    this.isBottom,
    this.backgroundImage,
    this.backgroundColor = Colors.white,
    this.hasBackgroundImage,
    this.isFull,
    this.extendBodyBehindAppBar = false,
    this.hasDismissKeyboard,
    this.body,
    this.bottomNavigation,
    this.resizeToAvoidBottomInset,
    this.showFloat,
    this.onScroll,
    this.hasTabBar = false,
    this.showBackgroundGradient = true,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomButtonOnPressed,
    this.bottomButtonTitle,
    this.isDisableBottomButton,
    this.isShowPoweredBy,
    this.customBottomWidget,
    this.cancelBottomButtonOnPressed,
    this.cancelBottomButtonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: Stack(
        children: [
          if ((hasBackgroundImage ?? false) &&
              (backgroundImage ?? "").isNotEmpty)
            Container(
              height: ScreenUtilsConfig.designHeight,
              width: ScreenUtilsConfig.designWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          if (showBackgroundGradient) const AppBackground(),
          SafeArea(
            top: false,
            bottom: isBottom ?? true,
            child: Padding(
              padding: EdgeInsets.only(
                top: appBar == null && !(isFull ?? false)
                    ? MediaQuery.of(context).padding.top
                    : MediaQuery.of(context).padding.top + 44.h,
              ),
              child: Column(
                children: [
                  Expanded(child: body ?? const SizedBox()),
                  customBottomWidget ?? const SizedBox(),
                  if (bottomButtonTitle != null ||
                      bottomButtonOnPressed != null ||
                      isDisableBottomButton != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppPrimaryButton(
                        title: bottomButtonTitle ?? '',
                        onPressed: bottomButtonOnPressed,
                        disable: isDisableBottomButton ?? false,
                        width: double.infinity,
                      ),
                    ),
                  if (cancelBottomButtonTitle != null ||
                      cancelBottomButtonOnPressed != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ).copyWith(top: 16),
                      child: AppPrimaryButton(
                        title: cancelBottomButtonTitle ?? '',
                        onPressed: cancelBottomButtonOnPressed,
                        disable: false,
                        width: double.infinity,
                        isShowBorderOnly: true,
                      ),
                    ),
                  if (isShowPoweredBy ?? false) ...[
                    const SizedBox(
                      height: 16,
                    ),
                    const PoweredByWidget(),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton,
    );
  }
}
