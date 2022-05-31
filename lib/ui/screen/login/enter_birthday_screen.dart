import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/screen/login/account_guest_screen.dart';
import 'package:fsof/ui/screen/login/login_hooks.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/utils/formats.dart';
import 'package:fsof/ui/widgets/bars/fsof_app_bar.dart';
import 'package:fsof/ui/widgets/buttons/fsof_gradient_button.dart';
import 'package:fsof/ui/widgets/inputs/fsof_input_field.dart';
import 'package:fsof/ui/widgets/inputs/fsof_input_field_props.dart';

class EnterBirthdayScreen extends HookWidget {
  const EnterBirthdayScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
        builder: (_) => const EnterBirthdayScreen(),
        settings: const RouteSettings(name: kRouteLoginEnterBirthday),
      );

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime?>(null);
    final textController = useTextEditingController();
    final focusNode = useFocusNode();
    final onBirthdayPressed = useBirthdayCallback((newDate) {
      if (newDate != null) {
        textController.text = formatDate(newDate);
        date.value = newDate;
      }
    });
    useEffect(() {
      final onFocusChanged = () {
        if (focusNode.hasFocus) {
          onBirthdayPressed();
          focusNode.unfocus();
        }
      };
      focusNode.addListener(onFocusChanged);
      return () => focusNode.removeListener(onFocusChanged);
    }, []);

    return Scaffold(
      appBar: FsofAppBar.withTitle(
        title: I18n.of(context).sLoginEnterBirthdayTitle,
        leading: IconButton(
          onPressed: () => Navigator.popUntil(
            context,
            (route) => route.settings.name == kRouteLoginAccountGuest,
          ),
          icon: SvgPicture.asset(kImageIcClose),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: kDimens16),
        children: [
          const SizedBox(height: kDimens48),
          Text(
            I18n.of(context).sLoginEnterBirthdayDesc,
            style: Styles.p1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kDimens36),
          FsofInputField(
            props: FsofInputFieldProps(
              hint: I18n.of(context).sLoginEnterBirthdayHint,
              controller: textController,
              readOnly: true,
              focusNode: focusNode,
              style: Styles.p1.copyWith(color: kBackgroundColor),
            ),
          ),
          const SizedBox(height: kDimens36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDimens34),
            child: FsofGradientButton(
              text: I18n.of(context).gContinue,
              onPressed: useBirthdaySubmitCallback(date.value),
            ),
          ),
        ],
      ),
    );
  }
}
