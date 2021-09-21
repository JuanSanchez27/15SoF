import 'package:flutter_test/flutter_test.dart';
import 'package:fsof/presentation/landing/landing_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'utils/devices.dart';
import 'utils/extensions.dart';
import 'utils/setup.dart';
import 'utils/test_state_widget.dart';

void main() {
  setUpAll(() async {
    await setupEnvironment();
  });

  const path = 'landing_page';

  testGoldens(
    'Landing Page should look correct',
    (tester) async {
      const page = LandingPage();

      await tester.pumpWidgetWithNetworkImageMock(
        page,
        wrapper: (child) => TestStateWidget(
          child: child,
        ),
      );

      await multiScreenGolden(
        tester,
        '$path/landing',
        devices: devicesWithDifferentTextScales(),
      );
    },
  );
}
