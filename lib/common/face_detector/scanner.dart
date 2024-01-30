import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class Scanner {
  Scanner._();

  static Future<CameraDescription> getCamera(
      CameraLensDirection cameraLensDirection) async {
    return await availableCameras().then((List<CameraDescription> cameras) =>
        cameras.firstWhere((CameraDescription cameraDescription) =>
            cameraDescription.lensDirection == cameraLensDirection));
  }

  static InputImageRotation rotationIntToImageRotation(int rotation) {
    switch (rotation) {
      case 0:
        return InputImageRotation.rotation0deg;
      case 90:
        return InputImageRotation.rotation90deg;
      case 180:
        return InputImageRotation.rotation180deg;
      default:
        assert(rotation == 270);
        return InputImageRotation.rotation270deg;
    }
  }

  static Uint8List concatenatePlane(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();

    for (Plane plane in planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final data = allBytes.done().buffer.asUint8List();
    return data;
  }

  static InputImageMetadata buildMetaData(
      CameraImage image, InputImageRotation rotation) {
    return InputImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: rotation,
      format: InputImageFormatValue.fromRawValue(image.format.raw)!,
      bytesPerRow: image.planes[0].bytesPerRow,
    );
  }

  static Future<List<Face>> detect({
    required CameraImage image,
    required Future<List<Face>> Function(InputImage image) detectInImage,
    required int imageRotation,
  }) {
    final bytes = concatenatePlane(image.planes);
    return detectInImage(
      InputImage.fromBytes(
        bytes: bytes,
        metadata: buildMetaData(
          image,
          rotationIntToImageRotation(imageRotation),
        ),
      ),
    );
  }
}
