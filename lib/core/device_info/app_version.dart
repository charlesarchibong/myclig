import 'package:meta/meta.dart';
import 'package:package_info/package_info.dart';

class AppVersion {
  final PackageInfo packageInfo;
  AppVersion({
    @required this.packageInfo,
  });

  String call() {
    return packageInfo.version;
  }
}
