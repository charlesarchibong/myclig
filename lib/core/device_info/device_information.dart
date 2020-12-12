import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:meta/meta.dart';

class DeviceInformation {
  final DeviceInfoPlugin deviceInfoPlugin;
  DeviceInformation({
    @required this.deviceInfoPlugin,
  });

  Future<String> getDeviceName() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      return '${androidInfo.manufacturer}  ${androidInfo.model}';
    }

    IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    return '${iosInfo.utsname.machine} ${iosInfo.model}';
  }

  Future<String> getDeviceId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      return '${androidInfo.androidId}';
    }

    IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    return '${iosInfo.identifierForVendor}';
  }
}
