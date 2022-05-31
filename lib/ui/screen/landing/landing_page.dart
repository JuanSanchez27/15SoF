import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/screen/home/widgets/dialogs.dart';
import 'package:fsof/ui/screen/landing/landing_page_hooks.dart';
import 'package:fsof/ui/screen/landing/widgets/fsof_fame_square.dart';
import 'package:fsof/ui/screen/main_screen.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/buttons/fsof_primary_button.dart';

class LandingPage extends HookWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onCreateFamePressed = useOnCreateFameCallback();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDimens24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(kImageLogo, alignment: Alignment.centerLeft),
              const SizedBox(height: kDimens24),
              Expanded(
                child: FsofFameSquare(
                  image: kImageCreateFame,
                  onPressed: onCreateFamePressed,
                  title: I18n.of(context).sLandingCreateFameTitle,
                  subtitle: I18n.of(context).sLandingCreateFameSubtitle,
                ),
              ),
              const SizedBox(height: kDimens20),
              Expanded(
                child: FsofFameSquare(
                  image: kImageGetFame,
                  onPressed: () => showNotImplemented(context),
                  title: I18n.of(context).sLandingGetFameTitle,
                  subtitle: I18n.of(context).sLandingGetFameSubtitle,
                ),
              ),
              const SizedBox(height: kDimens32),
              FsofPrimaryButton(
                text: I18n.of(context).sLandingWatchFame,
                onPressed: () => Navigator.push(
                  context,
                  MainScreen.goto(),
                ),
                color: kTransparent,
                textColor: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
