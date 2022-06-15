import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/screen/web_view/web_view_screen.dart';

import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/bars/fsof_app_bar.dart';
import 'package:fsof/ui/widgets/buttons/fsof_gradient_button.dart';
import 'package:fsof/ui/widgets/inputs/fsof_input_field.dart';
import 'package:fsof/ui/widgets/inputs/fsof_input_field_props.dart';

class ConsentingParentScreen extends HookWidget {
  const ConsentingParentScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
        builder: (_) => const ConsentingParentScreen(),
        settings: const RouteSettings(name: kRouteLoginEmail),
      );

  @override
  Widget build(BuildContext context) {
    final parentalInitialConsentingFocusNode = useFocusNode();
    final parentalInitialConsentingTextController = useTextEditingController();


    return Scaffold(
      appBar: FsofAppBar.withTitleAndBack(
        title: I18n.of(context).sLoginEmailTitle,
      ),
      body: ListView(
        padding: const EdgeInsets.all(kDimens48),
        children: [
          Text(
            I18n.of(context).sLoginParentalConsentTitle,
            style:
                Styles.h5.copyWith(fontSize: kDimens15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kDimens12),
          Text(
            I18n.of(context).sLoginParentalContentSubtitle,
            style: Styles.p2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kDimens30),
          FsofInputField(
            props: FsofInputFieldProps(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              controller: parentalInitialConsentingTextController,
              maxLength: 64,
              hint: I18n.of(context).sLoginParentalConsentingInitial,
              textInputAction: TextInputAction.next,
              focusNode: parentalInitialConsentingFocusNode,
            ),
          ),
          const SizedBox(height: kDimens24),
          FsofGradientButton(
            text: I18n.of(context).gContinue,
            onPressed:(){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => WebViewScreen(path: "assets/html/terms_of_use.html", title: "Terminos y condiciones")
                  )
              );
            }
          ),
        ],
      ),
    );
  }
}
