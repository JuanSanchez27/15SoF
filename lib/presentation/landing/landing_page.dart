import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/presentation/dialogs/dialogs.dart';
import 'package:fsof/presentation/landing/widgets/fame_square.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/images.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/widgets/buttons/primary_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(Images.sofLogo, alignment: Alignment.centerLeft),
              const SizedBox(height: 24),
              Expanded(
                child: FameSquare.createFame(
                  onPressed: () => showNotImplemented(context),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FameSquare.getFame(
                  onPressed: () => showNotImplemented(context),
                ),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: Strings.watchFame,
                onPressed: () => showNotImplemented(context),
                color: ColorRes.transparent,
                textColor: ColorRes.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
