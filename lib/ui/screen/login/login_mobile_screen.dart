import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/screen/login/logic/providers/login_provider.dart';
import 'package:fsof/ui/screen/login/region_selector_screen.dart' show regions;
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/bars/fsof_app_bar.dart';
import 'package:fsof/ui/widgets/buttons/fsof_gradient_button.dart';
import 'package:fsof/ui/widgets/custom_loaders/loader.dart';
import 'package:fsof/ui/widgets/inputs/fsof_input_field.dart';
import 'package:fsof/ui/widgets/inputs/fsof_input_field_props.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_number/phone_number.dart';
import 'login_hooks.dart';

class LoginMobileScreen extends HookConsumerWidget {
  const LoginMobileScreen({Key? key}) : super(key: key);

  static Route goTo() =>
      MaterialPageRoute(
        builder: (_) => const LoginMobileScreen(),
        settings: const RouteSettings(name: kRouteLoginMobile),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plugin = useMemoized(() => PhoneNumberUtil());
    final region = useState(regions.last);
    final focusNode = useFocusNode();
    final textController = useMemoized(() {
      return PhoneNumberEditingController.fromValue(
        plugin,
        TextEditingValue.empty,
        regionCode: region.value.code,
        behavior: PhoneInputBehavior.strict,
      );
    }, [region.value]);
    final onCountrySelectorPressed = useCountrySelectorCallback(region);
    final isValid = useState(false);
    final phone = useListenable(textController);

    return Scaffold(
      appBar: FsofAppBar.withTitleAndBack(
        title: I18n
            .of(context)
            .sLoginMobileTitle,
        
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDimens50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: kDimens48),
                Text(
                  I18n
                      .of(context)
                      .sLoginMobileSubtitle,
                  style: Styles.p2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: kDimens24),
                GestureDetector(
                  onTap: onCountrySelectorPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${region.value.prefix}',
                        style: Styles.h4,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: kDimens8),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: kDimens14),
                Stack(
                  children: [
                    FsofInputField(
                      props: FsofInputFieldProps(
                        onChanged: (value) =>
                            onSubmitted(
                              plugin: plugin,
                              region: region.value,
                              controller: textController,
                              valid: isValid,
                            ),
                        onSubmitted: (value) =>
                            onSubmitted(
                              plugin: plugin,
                              region: region.value,
                              controller: textController,
                              valid: isValid,
                            ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        controller: textController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9 ()-]')),
                        ],
                        textAlign: TextAlign.center,
                        maxLength: 16,
                        focusNode: focusNode,
                        style: Styles.h4.copyWith(color: kBackgroundColor),
                        autovalidateMode: AutovalidateMode.always,

                      ),
                    ),
                    if (phone.value.text.isNotEmpty)
                      Positioned(
                        top: kDimens0,
                        right: kDimens4,
                        bottom: kDimens0,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => textController.clear(),
                          child: Padding(
                            padding: const EdgeInsets.all(kDimens8),
                            child: SvgPicture.asset(
                              kImageIcRemove,
                              width: kDimens14,
                              height: kDimens14,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: kDimens15),
                if( textController.text.isNotEmpty && textController.text.length >= 11 && !isValid.value)
                  Text(
                    I18n
                        .of(context)
                        .eInvalidPhoneNumber,
                    style: Styles.p2.copyWith(color: kDarkRed),
                    textAlign: TextAlign.center,
                  ),
                if( textController.text.isNotEmpty && isValid.value && ref
                    .watch(postPhoneNumberNotifierProvider)
                    .error != null)
                  Text(
                    ref.watch(postPhoneNumberNotifierProvider).error != null ?
                    ref.watch(postPhoneNumberNotifierProvider).error!.data!.values.last : '',
                    style: Styles.p2.copyWith(color: kDarkRed),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: kDimens15),
                FsofGradientButton(
                  text: I18n
                      .of(context)
                      .sLoginMobileSendCode,
                  onPressed: isValid.value
                      ? useOnSubmitCallback(
                    phone: textController.text,
                    code: '${region.value.prefix}',
                    ref: ref,
                    navigate: true,
                  )
                      : null,
                ),
              ],
            ),
          ),
          Visibility(
            visible: ref
                .watch(postPhoneNumberNotifierProvider)
                .isLoading,
            child: const  FSOFCustomLoader()
          ),
        ],
      ),
    );
  }

  void onSubmitted({
    required PhoneNumberUtil plugin,
    required RegionInfo region,
    required TextEditingController controller,
    required ValueNotifier<bool> valid,
  }) {
    try {
      // We have to make a delay because PhoneNumberEditingController updates
      // the controller text asynchronously and we receive callbacks from
      // controller before actual update of the value
      Future.delayed(const Duration(milliseconds: 300), () => controller.text)
          .then((phone) => plugin.validate(phone, region.code))
          .then((isValid) => valid.value = isValid);
    } catch (e) {
      valid.value = false;
    }
  }
}
