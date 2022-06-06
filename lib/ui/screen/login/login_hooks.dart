import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/ui/screen/login/enter_birthday_screen.dart';
import 'package:fsof/ui/screen/login/login_code_screen.dart';
import 'package:fsof/ui/screen/login/region_selector_screen.dart';
import 'package:fsof/ui/screen/login/widgets/birthday_date_picker.dart';
import 'package:fsof/ui/screen/login/widgets/min_age_bottom_sheet.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:phone_number/phone_number.dart';

VoidCallback useCountrySelectorCallback(ValueNotifier<RegionInfo> region) {
  final context = useContext();

  return () {
    Navigator.push<RegionInfo>(
      context,
      RegionSelectorScreen.goTo(),
    ).then((result) => region.value = result ?? region.value);
    /*appRouter
        .goTo<RegionInfo>(context: context, route: const RegionSelectorScreen())!
        .then((result) => region.value = result ?? region.value);*/
  };
}

VoidCallback useOnSubmitCallback({
  required String phone,
  required String code,
}) {
  final context = useContext();

  return () {
    Navigator.push(
      context,
      LoginCodeScreen.goTo(
        phoneNumber: '+$code $phone',
      ),
    );
  };
}

void Function(String) useCodeSubmittedCallback() {
  final context = useContext();

  return (code) {
    Navigator.push(context, EnterBirthdayScreen.goTo());
  };
}

VoidCallback useBirthdayCallback(Function(DateTime?) setNewDate) {
  final context = useContext();

  return () {
    showCupertinoModalPopup<DateTime?>(
      context: context,
      builder: (_) => const BirthdayDatePicker(),
    ).then((newDate) => setNewDate(newDate));
  };
}

VoidCallback? useBirthdaySubmitCallback(DateTime? date) {
  if (date == null) {
    return null;
  }

  final context = useContext();

  return () {
    final currentTime = DateTime.now();
    final daysDif = date.difference(currentTime).inDays.abs();

    if (daysDif < kDaysPerYear * kMinAge) {
      showModalBottomSheet(
        context: context,
        builder: (_) => const MinAgeBottomSheet(),
      );
    } else {
      // TODO(Artem): Set user's birthday
      //showNotImplemented(context);
    }
  };
}
