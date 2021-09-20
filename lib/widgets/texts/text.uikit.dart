import 'package:dash_kit_uikit/dash_kit_uikit.dart';
import 'package:flutter/material.dart';

class TextUiKitBuilder extends UiKitBuilder {
  @override
  Type get componentType => Text;

  @override
  void buildComponentStates() {
    build('Black text', const Text('Hello world!'));
    build(
      'Grey text',
      const Text(
        'Hello world!',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
