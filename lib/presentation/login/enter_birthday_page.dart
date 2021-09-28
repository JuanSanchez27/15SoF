import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fsof/navigation/app_router.dart';
import 'package:fsof/presentation/login/account_guest_page.dart';
import 'package:fsof/presentation/login/login_page_hooks.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/images.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/utils/formats.dart';
import 'package:fsof/widgets/bars/sof_app_bar.dart';
import 'package:fsof/widgets/buttons/gradient_button.dart';
import 'package:fsof/widgets/inputs/input_field.dart';
import 'package:fsof/widgets/inputs/input_field_props.dart';

class EnterBirthdayPage extends HookWidget {
  const EnterBirthdayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime?>(null);
    final textController = useTextEditingController();
    final focusNode = useFocusNode();
    final onBirthdaySubmitPressed = useBirthdaySubmitCallback(date.value);
    final onBirthdayPressed = useBirthdayCallback((newDate) {
      if (newDate != null) {
        textController.text = formatDate(newDate);
        date.value = newDate;
      }
    });
    useEffect(() {
      final onFocusChanged = () {
        if (focusNode.hasFocus) {
          onBirthdayPressed();
          focusNode.unfocus();
        }
      };
      focusNode.addListener(onFocusChanged);
      return () => focusNode.removeListener(onFocusChanged);
    }, []);

    return Scaffold(
      appBar: SofAppBar.withTitle(
        title: Strings.enterBirthdayTitle,
        leading: IconButton(
          onPressed: () => appRouter.goBackUntil(
            context: context,
            name: (AccountGuestPage).toString(),
          ),
          icon: SvgPicture.asset(Images.icClose),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 48),
          Text(
            Strings.enterBirthdayDesc,
            style: Styles.p1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          InputField(
            props: InputFieldProps(
              hint: Strings.enterBirthdayHint,
              controller: textController,
              readOnly: true,
              focusNode: focusNode,
              style: Styles.p1.copyWith(color: ColorRes.ebonyClay),
            ),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: GradientButton(
              text: Strings.labelContinue,
              onPressed: onBirthdaySubmitPressed,
            ),
          ),
        ],
      ),
    );
  }
}
