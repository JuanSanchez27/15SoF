import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:package_info/package_info.dart';

String compileAppVersion(
  PackageInfo packageInfo,
  ApiEnvironment environment,
) {
  return '${packageInfo.version} (${packageInfo.buildNumber})';
}
