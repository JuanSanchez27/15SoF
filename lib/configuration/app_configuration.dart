import 'package:fsof/configuration/fsof_api_environment.dart';

mixin AppConfiguration {
  static FsofApiEnvironment? _environment;

  static FsofApiEnvironment? get environment => _environment;

  static void init({required FsofApiEnvironment environment}) {
    assert(_environment == null, 'Init should be called once!');
    _environment = environment;
  }

  static bool get controlPanelEnabled =>
      _environment != FsofApiEnvironment.production;
}
