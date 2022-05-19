import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/navigation/app_router.dart';
import 'package:fsof/presentation/dialogs/dialogs.dart';
import 'package:fsof/presentation/login/enter_birthday_page.dart';
import 'package:fsof/presentation/login/login_code_page.dart';
import 'package:fsof/presentation/login/region_selector.dart';
import 'package:fsof/presentation/login/widgets/birthday_date_picker.dart';
import 'package:fsof/presentation/login/widgets/min_age_bottom_sheet.dart';
import 'package:fsof/resources/constants.dart';
import 'package:phone_number/phone_number.dart';

VoidCallback useCountrySelectorCallback(ValueNotifier<RegionInfo> region) {
  final context = useContext();

  return () {
    appRouter
        .goTo<RegionInfo>(context: context, route: const RegionSelector())!
        .then((result) => region.value = result ?? region.value);
  };
}

VoidCallback useOnSubmitCallback({
  required String phone,
  required String code,
}) {
  final context = useContext();

  return () {
    appRouter.goTo(
      context: context,
      route: LoginCodePage(phoneNumber: '+$code $phone'),
    );
  };
}

void Function(String) useCodeSubmittedCallback() {
  final context = useContext();

  return (code) {
    appRouter.startWith(context: context, route: const EnterBirthdayPage());
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

    if (daysDif < daysPerYear * minAge) {
      showModalBottomSheet(
        context: context,
        builder: (_) => const MinAgeBottomSheet(),
      );
    } else {
      // TODO(Artem): Set user's birthday
      showNotImplemented(context);
    }
  };
}
