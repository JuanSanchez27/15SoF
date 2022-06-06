import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/screen/login/login_email_screen.dart';
import 'package:fsof/ui/screen/login/login_mobile_screen.dart';
import 'package:fsof/ui/screen/web_view/web_view_screen.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/buttons/fsof_gradient_button.dart';
import 'package:fsof/ui/widgets/texts/fsof_link_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AccountGuestScreen extends StatelessWidget {
  const AccountGuestScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
        builder: (_) => const AccountGuestScreen(),
        settings: const RouteSettings(name: kRouteLoginAccountGuest),
      );

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
                  padding: const EdgeInsets.only(left: kDimens12),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(kImageIcClose),
                  ),
                ),
              ),
              const SizedBox(height: kDimens12),
              SvgPicture.asset(
                kImageLogo,
                width: kDimens170,
                height: kDimens56,
              ),
              const SizedBox(height: kDimens20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDimens24),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: I18n.of(context).sLoginGuestPageTitle,
                        style: Styles.h5,
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: kDimens4),
                          child: Text(
                            I18n.of(context).sLoginGuestPageR,
                            style: Styles.bodySmall,
                          ),
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
                padding: const EdgeInsets.symmetric(horizontal: kDimens24),
                child: FsofGradientButton(
                  icon: kImageIcPhone,
                  text: I18n.of(context).sLoginGuestPageLogin,
                  onPressed: () => Navigator.push(
                    context,
                    LoginMobileScreen.goTo(),
                  ),
                ),
              ),
              const SizedBox(height: kDimens32),
              Text(I18n.of(context).sLoginGuestPageContinue, style: Styles.p2),
              const SizedBox(height: kDimens24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialButton(
                    kImageIcApple,
                    (){
                      
                    }
                  ),
                  const SizedBox(width: kDimens20),
                  socialButton(
                    kImageIcFacebook,
                    (){}
                  ),
                  const SizedBox(width: kDimens20),
                  socialButton(
                    kImageIcGoogle,
                    (){}
                  ),
                ],
              ),
              const SizedBox(height: kDimens24),
              LinkText(
                texts: [
                  I18n.of(context).sLoginGuestPageRegistered1,
                  ClickableText(
                    text: I18n.of(context).sLoginGuestPageRegistered2,
                    onPressed: () => Navigator.push(
                      context,
                      LoginEmailScreen.goTo(),
                    ),
                  ),
                  I18n.of(context).sLoginGuestPageRegistered3,
                ],
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDimens24),
                child: LinkText(
                  textAlign: TextAlign.center,
                  texts: [
                    I18n.of(context).sLoginGuestPageAgreement1,
                    ClickableText(
                      text: I18n.of(context).sLoginGuestPageAgreement2,
                      onPressed: () => _onTermsOfUsePressed(context),
                    ),
                    I18n.of(context).sLoginGuestPageAgreement3,
                    ClickableText(
                      text: I18n.of(context).sLoginGuestPageAgreement4,
                      onPressed: () => _onPrivacyPolicyPressed(context),
                    ),
                  ],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: kDimens18),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector socialButton(String assetPath, Function onPressed) {
    return GestureDetector(
      child: SvgPicture.asset(assetPath),
    );
  } 

  void _onTermsOfUsePressed(BuildContext context) {
    Navigator.push(context, WebViewScreen.goToTermsOfUse());
  }

  void _onPrivacyPolicyPressed(BuildContext context) {
    Navigator.push(context, WebViewScreen.goToPrivacyPolicy());
  }
}
