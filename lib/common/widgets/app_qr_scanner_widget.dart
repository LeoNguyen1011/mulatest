import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';

class AppQRScannerWidget extends StatefulWidget {
  const AppQRScannerWidget({
    super.key,
    this.isShowFlashlight = false,
    this.isShowImage = false,
    this.isShowQR = false,
    required this.sub,
    required this.title,
    required this.onDetect,
  });

  final Function(BarcodeCapture val) onDetect;
  final String title;
  final String sub;
  final bool isShowFlashlight;
  final bool isShowQR;
  final bool isShowImage;

  @override
  State<AppQRScannerWidget> createState() => _AppQRScannerWidgetState();
}

class _AppQRScannerWidgetState extends State<AppQRScannerWidget> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    cameraController.stop();
    super.initState();
  }

  @override
  void dispose() {
    cameraController.stop();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (val) {
              widget.onDetect(val);
            },
            controller: cameraController,
            scanWindow: Rect.fromCenter(
                center: Offset(MediaQuery.of(context).size.width * 0.5,
                    MediaQuery.of(context).size.height * 0.5),
                width: MediaQuery.of(context).size.width * 0.80,
                height: 304),
            errorBuilder: (_, exception, __) => Center(
                child: Text(
                    "Error code: ${exception.errorCode}\nError: ${exception.errorDetails?.message}")),
          ),
          const _OverlayWithRectangleClipping(),
          _cameraBox(),
          _overlayWidget(),
        ],
      ),
    );
  }

  Column _overlayWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _header(),
        const SizedBox(
          height: 304,
        ),
        _cameraButtons()
      ],
    );
  }

  Widget _cameraBox() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 0,
                    child: Assets.svg.border.svg(),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Assets.svg.border.svg(),
                  )
                ],
              ),
              const SizedBox(
                height: 216,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Assets.svg.border.svg(),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Assets.svg.border.svg(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cameraButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              if (widget.isShowFlashlight)
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        cameraController.toggleTorch();
                      },
                      child: Assets.svg.flashlight.svg()),
                ),
              if (widget.isShowQR)
                Expanded(flex: 6, child: Assets.svg.qr.svg()),
              if (widget.isShowImage) Expanded(child: Assets.svg.image.svg()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36)
            .copyWith(bottom: 38.5, top: 36),
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.clear,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            widget.title,
            style: AppTypo.heading6.copyWith(color: AppColors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.sub,
            style: AppTypo.bodySmall.copyWith(color: AppColors.white),
          ),
        ]),
      ),
    );
  }
}

class _OverlayWithRectangleClipping extends StatelessWidget {
  const _OverlayWithRectangleClipping();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: _getCustomPaintOverlay(context));
  }

  CustomPaint _getCustomPaintOverlay(BuildContext context) {
    return CustomPaint(
        size: MediaQuery.of(context).size, painter: _RectanglePainter());
  }
}

class _RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;

    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addRRect(
              RRect.fromRectAndRadius(
                Rect.fromCenter(
                    center: Offset(size.width * 0.5, size.height * 0.5),
                    width: size.width * 0.80,
                    height: 304),
                const Radius.circular(16),
              ),
            )
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
