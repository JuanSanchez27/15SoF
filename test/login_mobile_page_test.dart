import 'package:flutter_test/flutter_test.dart';
import 'package:fsof/presentation/login/login_mobile_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'utils/devices.dart';
import 'utils/extensions.dart';
import 'utils/setup.dart';
import 'utils/test_state_widget.dart';

void main() {
  setUpAll(() async {
    await setupEnvironment();
  });

  const path = 'login_mobile_page';

  testGoldens(
    'Login Mobile Page should look correct',
        (tester) async {
      const page = LoginMobilePage();

      await tester.pumpWidgetWithNetworkImageMock(
        page,
        wrapper: (child) => TestStateWidget(
          child: child,
        ),
      );

      await multiScreenGolden(
        tester,
        '$path/login',
        devices: devicesWithDifferentTextScales(),
      );
    },
  );
}
