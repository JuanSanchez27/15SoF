import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/navigation/app_router.dart';
import 'package:fsof/presentation/dialogs/dialogs.dart';
import 'package:fsof/presentation/login/login_mobile_page.dart';
import 'package:fsof/presentation/web_view/web_view_page.dart';
import 'package:fsof/resources/images.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/widgets/buttons/gradient_button.dart';
import 'package:fsof/widgets/texts/link_text.dart';

class AccountGuestPage extends StatelessWidget {
  const AccountGuestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton(
                    onPressed: () => appRouter.goBack(context),
                    icon: SvgPicture.asset(Images.icClose),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SvgPicture.asset(Images.sofLogo, width: 170, height: 56),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: Strings.guestPageTitle,
                        style: Styles.h5,
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child:
                              Text(Strings.guestPageR, style: Styles.bodySmall),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GradientButton(
                  icon: Images.icPhone,
                  text: Strings.guestPageLogin,
                  onPressed: () => appRouter.goTo(
                    context: context,
                    route: const LoginMobilePage(),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(Strings.guestPageContinue, style: Styles.p2),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Images.icFacebook),
                  const SizedBox(width: 20),
                  SvgPicture.asset(Images.icGoogle),
                ],
              ),
              const SizedBox(height: 24),
              LinkText(
                texts: [
                  Strings.guestPageRegistered1,
                  ClickableText(
                    text: Strings.guestPageRegistered2,
                    onPressed: () => showNotImplemented(context),
                  ),
                  Strings.guestPageRegistered3,
                ],
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: LinkText(
                  textAlign: TextAlign.center,
                  texts: [
                    Strings.guestPageAgreement1,
                    ClickableText(
                      text: Strings.guestPageAgreement2,
                      onPressed: () => _onTermsOfUsePressed(context),
                    ),
                    Strings.guestPageAgreement3,
                    ClickableText(
                      text: Strings.guestPageAgreement4,
                      onPressed: () => _onPrivacyPolicyPressed(context),
                    ),
                  ],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  void _onTermsOfUsePressed(BuildContext context) {
    appRouter.goTo(context: context, route: WebViewPage.termsOfUse());
  }

  void _onPrivacyPolicyPressed(BuildContext context) {
    appRouter.goTo(context: context, route: WebViewPage.privacyPolicy());
  }
}
