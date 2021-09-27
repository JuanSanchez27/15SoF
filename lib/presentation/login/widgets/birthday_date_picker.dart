import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';

const _pickerButtonStyle = TextStyle(
  fontFamily: fontFamily,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: 16,
  height: 1,
  color: ColorRes.dodgerBlue,
  leadingDistribution: TextLeadingDistribution.even,
);

// Copied from CupertinoTextTheme due to incorrect width measuring
const _kDefaultDateTimePickerTextStyle = TextStyle(
  inherit: false,
  fontFamily: '.SF Pro Display',
  fontSize: 21,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

class BirthdayDatePicker extends HookWidget {
  const BirthdayDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateState = useState<DateTime?>(null);

    return Container(
      color: ColorRes.brightGray,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 22),
              TextButton(
                child: Text(Strings.cancel, style: _pickerButtonStyle),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                ),
                child: Text(
                  Strings.done,
                  style:
                      _pickerButtonStyle.copyWith(fontWeight: FontWeight.w700),
                ),
                onPressed: () => Navigator.of(context).pop(dateState.value),
              ),
              const SizedBox(width: 22),
            ],
          ),
          SizedBox(
            height: 240,
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
