import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/presentation/dialogs/dialogs.dart';
import 'package:fsof/presentation/login/login_page_hooks.dart';
import 'package:fsof/presentation/login/widgets/pincode_widget.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/widgets/bars/sof_app_bar.dart';
import 'package:fsof/widgets/buttons/primary_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginCodePage extends HookWidget {
  const LoginCodePage({
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final code = useState('');
    final errorController = useStreamController<ErrorAnimationType>();
    final codeController = useTextEditingController();
    final onCodeSubmitted = useCodeSubmittedCallback();

    return Scaffold(
      appBar: SofAppBar.withTitleAndBack(title: Strings.enterCode),
      body: Column(
        children: [
          const SizedBox(height: 48),
          Text(
            Strings.codeSentTo(phoneNumber),
            style: Styles.p2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 46),
          PinCodeWidget(
            controller: codeController,
            obscureText: false,
            length: 4,
            errorAnimationController: errorController,
            onChanged: (value) => code.value = value,
            onSubmitted: onCodeSubmitted,
            onCompleted: onCodeSubmitted,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: Strings.sendNewCode,
            onPressed: () => showNotImplemented(context),
            color: ColorRes.transparent,
            textColor: ColorRes.primary,
          ),
        ],
      ),
    );
  }
}
