import 'dart:io';

bool isTestingEnvironment() {
  return Platform.environment.containsKey('FLUTTER_TEST');
}
