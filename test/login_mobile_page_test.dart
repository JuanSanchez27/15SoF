import 'package:flutter_test/flutter_test.dart';
import 'package:fsof/presentation/login/enter_birthday_page.dart';
import 'package:fsof/presentation/login/login_code_page.dart';
import 'package:fsof/presentation/login/login_email_page.dart';
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

  const path = 'login_page';

  testGoldens(
    'Login Email Page should look correct',
    (tester) async {
      const page = LoginEmailPage();

      await tester.pumpWidgetWithNetworkImageMock(
        page,
        wrapper: (child) => TestStateWidget(
          child: child,
        ),
      );

      await multiScreenGolden(
        tester,
        '$path/email',
        devices: devicesWithDifferentTextScales(),
      );
    },
  );

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
        '$path/phone',
        devices: devicesWithDifferentTextScales(),
      );
    },
  );

  testGoldens(
    'Login Code Page should look correct',
    (tester) async {
      const page = LoginCodePage(phoneNumber: '+ 1 (202) 555-0130');

      await tester.pumpWidgetWithNetworkImageMock(
        page,
        wrapper: (child) => TestStateWidget(
          child: child,
        ),
      );

      await multiScreenGolden(
        tester,
        '$path/code',
        devices: devicesWithDifferentTextScales(),
      );
    },
  );

  testGoldens(
    'Enter Birthday Page should look correct',
    (tester) async {
      const page = EnterBirthdayPage();

      await tester.pumpWidgetWithNetworkImageMock(
        page,
        wrapper: (child) => TestStateWidget(
          child: child,
        ),
      );

      await multiScreenGolden(
        tester,
        '$path/birthday',
        devices: devicesWithDifferentTextScales(),
      );
    },
  );
}
