import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/screen/home/widgets/dialogs.dart';
import 'package:fsof/ui/screen/login/enter_birthday_screen.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/utils/validator/validator.dart';
import 'package:fsof/ui/widgets/bars/fsof_app_bar.dart';
import 'package:fsof/ui/widgets/buttons/fsof_gradient_button.dart';
import 'package:fsof/ui/widgets/buttons/fsof_primary_button.dart';
import 'package:fsof/ui/widgets/inputs/fsof_input_field.dart';
import 'package:fsof/ui/widgets/inputs/fsof_input_field_props.dart';

class LoginEmailScreen extends HookWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
        builder: (_) => const LoginEmailScreen(),
        settings: const RouteSettings(name: kRouteLoginEmail),
      );

  @override
  Widget build(BuildContext context) {
    final emailFocusNode = useFocusNode();
    final emailTextController = useTextEditingController();
    final email = useValueListenable(emailTextController);

    final passwordFocusNode = useFocusNode();
    final passwordTextController = useTextEditingController();
    final password = useValueListenable(passwordTextController);

    return Scaffold(
      appBar: FsofAppBar.withTitleAndBack(
        title: I18n.of(context).sLoginEmailTitle,
      ),
      body: ListView(
        padding: const EdgeInsets.all(kDimens48),
        children: [
          Text(
            !validateEmail(email.text)
                ? I18n.of(context).sLoginEmailSubtitle
                : I18n.of(context).sLoginEmailPasswordSubtitle,
            style: Styles.p2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kDimens36),
          FsofInputField(
            props: FsofInputFieldProps(
              keyboardType: TextInputType.emailAddress,
              controller: emailTextController,
              maxLength: 64,
              hint: I18n.of(context).sLoginEmail,
              textInputAction: TextInputAction.next,
              focusNode: emailFocusNode,
              nextFocusNode: passwordFocusNode,
            ),
          ),
          if (!validateEmail(email.text)) ...[
            const SizedBox(height: kDimens10),
            FsofInputField(
              props: FsofInputFieldProps(
                keyboardType: TextInputType.text,
                controller: passwordTextController,
                maxLength: 64,
                hint: I18n.of(context).sLoginPassword,
                focusNode: passwordFocusNode,
              ),
            ),
          ],
          const SizedBox(height: kDimens24),
          FsofPrimaryButton(
            text: I18n.of(context).sLoginForgotPassword,
            onPressed: () => showNotImplemented(context),
            color: kTransparent,
            textColor: kPrimaryColor,
          ),
          const SizedBox(height: kDimens24),
          FsofGradientButton(
            text: I18n.of(context).gContinue,
            onPressed: !validateEmail(email.text) && password.text.isNotEmpty
                ? () => Navigator.push(
                      context,
                      EnterBirthdayScreen.goTo(),
                    )
                : null,
          ),
        ],
      ),
    );
  }
}
