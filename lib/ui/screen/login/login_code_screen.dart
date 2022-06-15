import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/screen/login/enter_birthday_screen.dart';
import 'package:fsof/ui/screen/login/logic/providers/login_provider.dart';
import 'package:fsof/ui/screen/login/login_hooks.dart';
import 'package:fsof/ui/screen/login/widgets/pincode_widget.dart';
import 'package:fsof/ui/screen/web_view/web_view_screen.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/bars/fsof_app_bar.dart';
import 'package:fsof/ui/widgets/buttons/fsof_primary_button.dart';
import 'package:fsof/ui/widgets/custom_loaders/loader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginCodeScreen extends HookConsumerWidget {
  const LoginCodeScreen({
    required this.phoneNumber,
    required this.code,
    required this.deviceUniqueIdentifier,
    Key? key,
  }) : super(key: key);

  static Route goTo({
    required String phoneNumber,
    required String code,
    required String deviceUniqueIdentifier,
  }) =>
      MaterialPageRoute(
        builder: (_) => LoginCodeScreen(
          phoneNumber: phoneNumber,
          code: code,
          deviceUniqueIdentifier: deviceUniqueIdentifier,
        ),
        settings: const RouteSettings(name: kRouteLoginCode),
      );

  final String phoneNumber;
  final String code;
  final String deviceUniqueIdentifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _code = useState(kEmptyString);
    final errorController = useStreamController<ErrorAnimationType>();
    final codeController = useTextEditingController();
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    return Scaffold(
      appBar: FsofAppBar.withTitleAndBack(
        title: I18n.of(context).sLoginCodeEnterCode,
      ),
      body: Stack(
        children: [
          Column(
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
                isError:
                    ref.watch(postValidateCodeNotifierProvider).error != null,
                errorAnimationController: errorController,
                onChanged: (value) => _code.value = value,
                onSubmitted: (validationCode) {
                  ref
                      .read(postValidateCodeNotifierProvider.notifier)
                      .validateCode(
                        phoneNumber: phoneNumber,
                        deviceUniqueIdentifier: deviceUniqueIdentifier,
                        phoneNumberCountryCode: code,
                        verificationCode: validationCode,
                      )
                      .then((value) {
                    final state = ref.watch(postValidateCodeNotifierProvider);
                    if (state.data != null) {
                      Navigator.push(context, EnterBirthdayScreen.goTo());
                    }
                  });
                },
                onCompleted: (validationCode) {
                  if (Platform.isAndroid) {
                    deviceInfo.androidInfo.then((value) {
                      validateAccountandNavigate(
                        value.androidId!, 
                        kEmptyString,
                        phoneNumber, 
                        deviceUniqueIdentifier, 
                        4, 
                        ref, 
                        context,
                        validationCode
                      );
                    });
                  }
                  if (Platform.isIOS) {
                    deviceInfo.iosInfo.then((value) {
                      validateAccountandNavigate(
                        value.identifierForVendor!, 
                        kEmptyString,
                        phoneNumber, 
                        deviceUniqueIdentifier, 
                        4, 
                        ref, 
                        context,
                        validationCode
                      );
                    });
                  }
                },
              ),
              Visibility(
                  visible: codeController.text.isNotEmpty &&
                      codeController.text.length == 4 &&
                      ref.watch(postValidateCodeNotifierProvider).error != null,
                  child: Text(
                    ref.watch(postValidateCodeNotifierProvider).error != null
                        ? ref
                            .watch(postValidateCodeNotifierProvider)
                            .error!
                            .data!
                            .values
                            .last
                        : kEmptyString,
                    style: Styles.p2.copyWith(color: kDarkRed),
                  )),
              const SizedBox(height: kDimens10),
              FsofPrimaryButton(
                text: I18n.of(context).sLoginCodeSendNewCode,
                onPressed: useOnSubmitCallback(
                  phone: phoneNumber.substring(2),
                  code: code.substring(1),
                  ref: ref,
                  navigate: false,
                ),
                color: kTransparent,
                textColor: kPrimaryColor,
              ),
            ],
          ),
          ref.watch(postValidateCodeNotifierProvider).isLoading ||
                  ref.watch(postPhoneNumberNotifierProvider).isLoading
              ? const FSOFCustomLoader()
              : Container(),
        ],
      ),
    );
  }
  validateAccountandNavigate(
    String deviceSystemId,
    String email,
    String phoneNumber,
    String deviceUniqueIdentifier, 
    int authPlatformID,
    WidgetRef ref,
    BuildContext context,
    String validationCode,
  ){
    ref
      .read(postValidateCodeNotifierProvider.notifier)
      .validateCode(
        phoneNumber: phoneNumber,
        deviceUniqueIdentifier: deviceUniqueIdentifier,
        phoneNumberCountryCode: code,
        verificationCode: validationCode,
      ).then((value) {
        final token = ref
                        .read(postValidateCodeNotifierProvider).data;
        ref
          .read(postValidateAccountExistenceProvider.notifier)
          .validateAccountExistence(
            authToken: token!,
            deviceSystemId:deviceSystemId,
            email: kEmptyString,
            phoneNumber: phoneNumber,
            deviceUniqueIdentifier: deviceUniqueIdentifier,
            authPlatformID: 4,
          ).then((value) {
            final state = ref.watch(postValidateAccountExistenceProvider);
            if (state.data != null) {
              if(state.data!){
                Navigator.push(context, EnterBirthdayScreen.goTo());
              }else{
                Navigator.push(
                    context,
                    WebViewScreen.goToPrivacyPolicy()
                );
              }
            }
          });
      });
  }

}
