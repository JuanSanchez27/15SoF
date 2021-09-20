import 'package:alice_lightweight/alice.dart';
import 'package:dash_kit_control_panel/dash_kit_control_panel.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:fsof/widgets/uikit/ui_kit_setting.dart';

class SettingsProvider extends ControlPanelSettingsProvider {
  SettingsProvider({required this.alice, required this.dios}) {
    _configureProxy(dios);

    ProxySettingProps.init((proxyIpAddress) {
      _proxyIp = proxyIpAddress;
    });
  }

  final Alice alice;
  final List<Dio> dios;

  String _proxyIp = '';

  @override
  Future<List<ControlPanelSetting>> buildSettings() async {
    final demoProps = DemoSettingProps(
      onDemoModeChanged: (value) {
        // ignore: avoid_print
        print('Demo mode is ${value ? 'enabled' : 'disabled'}');
      },
    );

    final proxyProps = await ProxySettingProps.standart((proxyIpAddress) {
      _proxyIp = proxyIpAddress;
    });

    final networkProps = NetworkSettingProps(
      alice: alice,
    );

    return [
      VersionSetting(),
      DemoSetting(demoProps),
      const DevicePreviewSetting(),
      ProxySetting(proxyProps),
      NetworkSetting(networkProps),
      const UiKitSetting(),
    ];
  }

  void _configureProxy(List<Dio> dios) {
    for (final dio in dios) {
      // ignore: avoid_as
      final adapter = dio.httpClientAdapter as DefaultHttpClientAdapter;

      adapter.onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return _proxyIp.isNotEmpty ? 'PROXY $_proxyIp:8888' : 'DIRECT';
        };

        client.badCertificateCallback =
            (cert, host, port) => _proxyIp.isNotEmpty;
      };
    }
  }
}
