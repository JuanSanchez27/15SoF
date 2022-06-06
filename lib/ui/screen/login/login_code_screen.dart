import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/screen/home/widgets/dialogs.dart';
import 'package:fsof/ui/screen/login/login_hooks.dart';
import 'package:fsof/ui/screen/login/widgets/pincode_widget.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/bars/fsof_app_bar.dart';
import 'package:fsof/ui/widgets/buttons/fsof_primary_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginCodeScreen extends HookWidget {
  const LoginCodeScreen({
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  static Route goTo({
    required String phoneNumber,
  }) =>
      MaterialPageRoute(
        builder: (_) => LoginCodeScreen(phoneNumber: phoneNumber),
        settings: const RouteSettings(name: kRouteLoginCode),
      );

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final code = useState(kEmptyString);
    final errorController = useStreamController<ErrorAnimationType>();
    final codeController = useTextEditingController();
    final onCodeSubmitted = useCodeSubmittedCallback();

    return Scaffold(
      appBar: FsofAppBar.withTitleAndBack(
        title: I18n.of(context).sLoginCodeEnterCode,
      ),
      body: Column(
        children: [
          const SizedBox(height: kDimens48),
          Text(
            I18n.of(context).sLoginCodeCodeSentTo(phoneNumber),
            style: Styles.p2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kDimens46),
          PinCodeWidget(
            controller: codeController,
            obscureText: false,
            length: 4,
            errorAnimationController: errorController,
            onChanged: (value) => code.value = value,
            onSubmitted: onCodeSubmitted,
            onCompleted: onCodeSubmitted,
          ),
          const SizedBox(height: kDimens24),
          FsofPrimaryButton(
            text: I18n.of(context).sLoginCodeSendNewCode,
            onPressed: () => showNotImplemented(context),
            color: kTransparent,
            textColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
