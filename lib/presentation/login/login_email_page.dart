import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/navigation/app_router.dart';
import 'package:fsof/presentation/dialogs/dialogs.dart';
import 'package:fsof/presentation/login/enter_birthday_page.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/utils/validators.dart';
import 'package:fsof/widgets/bars/sof_app_bar.dart';
import 'package:fsof/widgets/buttons/gradient_button.dart';
import 'package:fsof/widgets/buttons/primary_button.dart';
import 'package:fsof/widgets/inputs/input_field.dart';
import 'package:fsof/widgets/inputs/input_field_props.dart';

class LoginEmailPage extends HookWidget {
  const LoginEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailFocusNode = useFocusNode();
    final emailTextController = useTextEditingController();
    final email = useValueListenable(emailTextController);

    final passwordFocusNode = useFocusNode();
    final passwordTextController = useTextEditingController();
    final password = useValueListenable(passwordTextController);

    return Scaffold(
      appBar: SofAppBar.withTitleAndBack(title: Strings.loginEmailTitle),
      body: ListView(
        padding: const EdgeInsets.all(48),
        children: [
          Text(
            !validateEmail(email.text)
                ? Strings.loginEmailSubtitle
                : Strings.loginEmailPasswordSubtitle,
            style: Styles.p2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          InputField(
            props: InputFieldProps(
              keyboardType: TextInputType.emailAddress,
              controller: emailTextController,
              maxLength: 64,
              hint: Strings.email,
              textInputAction: TextInputAction.next,
              focusNode: emailFocusNode,
              nextFocusNode: passwordFocusNode,
            ),
          ),
          if (!validateEmail(email.text)) ...[
            const SizedBox(height: 10),
            InputField(
              props: InputFieldProps(
                keyboardType: TextInputType.text,
                controller: passwordTextController,
                maxLength: 64,
                hint: Strings.password,
                focusNode: passwordFocusNode,
              ),
            ),
          ],
          const SizedBox(height: 24),
          PrimaryButton(
            text: Strings.forgotPassword,
            onPressed: () => showNotImplemented(context),
            color: ColorRes.transparent,
            textColor: ColorRes.primary,
          ),
          const SizedBox(height: 24),
          GradientButton(
            text: Strings.labelContinue,
            onPressed: !validateEmail(email.text) && password.text.isNotEmpty
                ? () => appRouter.goTo(
                      context: context,
                      route: const EnterBirthdayPage(),
                    )
                : null,
          ),
        ],
      ),
    );
  }
}
