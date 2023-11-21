import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class Tools {
  static Future<String> getUniqID() async {
    if (Platform.isIOS) {
      final udid =
          await const MethodChannel('plugins.flutter.io/unique_identifier')
              .invokeMethod<String>('getIdentifier');
      return udid ?? '';
    } else {
      var androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      String _androidId = androidDeviceInfo.androidId;
      return _androidId;
    }
  }
}
