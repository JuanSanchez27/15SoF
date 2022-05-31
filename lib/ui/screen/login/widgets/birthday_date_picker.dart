import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

const _pickerButtonStyle = TextStyle(
  fontFamily: fontFamily,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: kDimens16,
  height: kDimens1,
  color: kLightBlue,
  leadingDistribution: TextLeadingDistribution.even,
);

// Copied from CupertinoTextTheme due to incorrect width measuring
const _kDefaultDateTimePickerTextStyle = TextStyle(
  inherit: false,
  fontFamily: '.SF Pro Display',
  fontSize: kDimens21,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

class BirthdayDatePicker extends HookWidget {
  const BirthdayDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateState = useState<DateTime?>(null);

    return Container(
      color: kGray,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: kDimens8),
          Row(
            children: [
              const SizedBox(width: kDimens22),
              TextButton(
                child: Text(
                  I18n.of(context).gCancel,
                  style: _pickerButtonStyle,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                ),
                child: Text(
                  I18n.of(context).gDone,
                  style:
                      _pickerButtonStyle.copyWith(fontWeight: FontWeight.w700),
                ),
                onPressed: () => Navigator.of(context).pop(dateState.value),
              ),
              const SizedBox(width: kDimens22),
            ],
          ),
          SizedBox(
            height: kDimens240,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: _kDefaultDateTimePickerTextStyle,
                ),
              ),
              child: CupertinoDatePicker(
                onDateTimeChanged: (date) => dateState.value = date,
                mode: CupertinoDatePickerMode.date,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
