import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static final _plugin = DeviceInfoPlugin();

  static Future<String> getDeviceId() async {
    if (Platform.isAndroid) {
      final info = await _plugin.androidInfo;
      return info.id;
    } else {
      final info = await _plugin.iosInfo;
      return info.identifierForVendor!;
    }
  }

  static Future<String> getDeviceName() async {
    if (Platform.isAndroid) {
      final info = await _plugin.androidInfo;
      return info.device;
    } else {
      final info = await _plugin.iosInfo;
      return info.name;
    }
  }

  static String getDeviceOSName() {
    if (Platform.isAndroid) {
      return 'android';
    } else {
      return 'ios';
    }
  }

  static Future<String> getDeviceModel() async {
    if (Platform.isAndroid) {
      final info = await _plugin.androidInfo;
      return info.model;
    } else {
      final info = await _plugin.iosInfo;
      return info.model;
    }
  }
}
