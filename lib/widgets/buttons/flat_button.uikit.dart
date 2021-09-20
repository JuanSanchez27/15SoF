import 'package:dash_kit_uikit/dash_kit_uikit.dart';
import 'package:flutter/material.dart';

class FlatButtonUiKitBuilder extends UiKitBuilder {
  @override
  Type get componentType => TextButton;

  @override
  void buildComponentStates() {
    build(
      'White button',
      const TextButton(
        onPressed: null,
        child: Text(
          'Flat Button',
        ),
      ),
    );
    build(
      'Flat button',
      const TextButton(
        onPressed: null,
        child: Text(
          'Flat Button',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
