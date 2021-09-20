import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

extension NetworkImageMock on WidgetTester {
  Future<void> pumpWidgetWithNetworkImageMock(
    Widget widget, {
    required WidgetWrapper wrapper,
  }) async {
    await mockNetworkImagesFor(
      () async {
        await pumpWidget(
          wrapper(widget),
        );
      },
    );
  }
}
