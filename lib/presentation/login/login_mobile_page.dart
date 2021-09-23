import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/presentation/dialogs/dialogs.dart';
import 'package:fsof/presentation/login/login_page_hooks.dart';
import 'package:fsof/presentation/login/region_selector.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/images.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/widgets/bars/sof_app_bar.dart';
import 'package:fsof/widgets/buttons/gradient_button.dart';
import 'package:fsof/widgets/inputs/input_field.dart';
import 'package:fsof/widgets/inputs/input_field_props.dart';
import 'package:phone_number/phone_number.dart';

class LoginMobilePage extends HookWidget {
  const LoginMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plugin = useMemoized(() => PhoneNumberUtil());
    final region = useState(regions.last);
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
    final text = useState('');
    useEffect(() {
      final func = () => text.value = textController.text;
      textController.addListener(func);
      return () => textController.removeListener(func);
    }, [region.value]);

    return Scaffold(
      appBar: SofAppBar.withTitleAndBack(title: Strings.loginMobileTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 48),
            Text(
              Strings.loginMobileSubtitle,
              style: Styles.p2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
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
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorRes.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Stack(
              children: [
                InputField(
                  props: InputFieldProps(
                    onChanged: (value) => onSubmitted(
                      plugin: plugin,
                      region: region.value,
                      controller: textController,
                      valid: isValid,
                    ),
                    onSubmitted: (value) => onSubmitted(
                      plugin: plugin,
                      region: region.value,
                      controller: textController,
                      valid: isValid,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: textController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9 ()-]')),
                    ],
                    textAlign: TextAlign.center,
                    maxLength: 16,
                  ),
                ),
                if (text.value.isNotEmpty)
                  Positioned(
                    top: 0,
                    right: 4,
                    bottom: 0,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => textController.clear(),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          Images.icRemove,
                          width: 14,
                          height: 14,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 36),
            GradientButton(
              text: Strings.sendCode,
              onPressed:
                  isValid.value ? () => showNotImplemented(context) : null,
            ),
          ],
        ),
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
