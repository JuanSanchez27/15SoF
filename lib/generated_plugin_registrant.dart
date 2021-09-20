//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  FirebaseAnalyticsWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
