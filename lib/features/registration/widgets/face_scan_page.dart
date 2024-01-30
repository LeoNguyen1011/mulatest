import 'dart:io';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:mula_biz_mobile/common/face_detector/scanner.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class FaceScanPage extends StatefulWidget {
  const FaceScanPage({
    super.key,
    required this.onSuccess,
  });

  final Function(XFile val) onSuccess;

  @override
  State<FaceScanPage> createState() => _FaceScanPageState();
}

class _FaceScanPageState extends State<FaceScanPage> {
  CameraController? _camera;
  bool isWorking = false;
  Size? size;
  List<Face>? faceList;
  CameraDescription? description;

  final fd = FaceDetector(
      options: FaceDetectorOptions(
          enableContours: true,
          enableLandmarks: false,
          enableClassification: false,
          enableTracking: false,
          performanceMode: FaceDetectorMode.accurate));

  final CameraLensDirection _direction = CameraLensDirection.front;

  late ValueNotifier<bool> isValid;

  initCamera() async {
    description = await Scanner.getCamera(_direction);
    _camera = CameraController(
      description!,
      ResolutionPreset.medium,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    await _camera!.initialize().then((_) {
      _camera?.startImageStream(
        (image) => performDetectionOnStreamFrames(
          image,
          context,
        ),
      );
    });
    setState(() {});
  }

  bool _isExcuted = false;

  void performDetectionOnStreamFrames(
      CameraImage cameraImage, BuildContext context) async {
    final results = await Scanner.detect(
      image: cameraImage,
      detectInImage: fd.processImage,
      imageRotation: description!.sensorOrientation,
    );
    if (results.isNotEmpty) {
      if (!_isExcuted) {
        final XFile? cameraImage = await _camera?.takePicture();
        _camera?.pausePreview();
        _camera?.stopImageStream();
        widget.onSuccess(cameraImage!);
      }
      _isExcuted = true;
    }
    isWorking = false;
  }

  showsnackbar(String message, context) {
    final snackBar = SnackBar(
        behavior: SnackBarBehavior.fixed,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        duration: const Duration(seconds: 2),
        content: Text(
          message,
          style: AppTypo.bodySmall.copyWith(color: AppColors.white),
        ));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    isValid = ValueNotifier(false);
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    super.dispose();
    _camera?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: AppDimensions.defaultPagePadding.copyWith(top: 24.h),
        child: Center(
          child: Column(
            children: [
              Text(
                LocaleKeys.account_activation_face_scanning_title.tr(),
                style: AppTypo.heading4.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Container(
                height: 252.sp,
                width: 252.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: const Alignment(0.00, -1.00),
                    end: const Alignment(0, 1),
                    colors: [
                      AppColors.grey[500]!,
                      AppColors.burgundy,
                      AppColors.grey[500]!,
                    ],
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 24.h),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  padding: (EdgeInsets.all(6.sp)),
                  margin: (EdgeInsets.all(6.sp)),
                  child: Center(
                    child: SizedBox(
                      height: 240.sp,
                      width: 240.sp,
                      child: ClipOval(
                        child: _camera == null
                            ? const SizedBox.shrink()
                            : ValueListenableBuilder<CameraValue>(
                                valueListenable: _camera!,
                                builder: (context, cameraValue, child) {
                                  if (cameraValue.isInitialized) {
                                    return child!;
                                  }
                                  return const SizedBox.shrink();
                                },
                                child: CameraPreview(_camera!),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                LocaleKeys.account_activation_face_scanning_description.tr(),
                style: AppTypo.bodySmall.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigation: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.account_activation_take_a_selfie_powered_by.tr(),
                  style: AppTypo.bodyTiny.copyWith(color: AppColors.grey[700]),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Assets.images.poweredBy.image(
                  height: 20.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
