// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/screen/home/widgets/dialogs.dart';
import 'package:fsof/ui/screen/login/consting_parent_screen.dart';
import 'package:fsof/ui/screen/login/enter_birthday_screen.dart';
import 'package:fsof/ui/screen/login/logic/providers/login_provider.dart';
import 'package:fsof/ui/screen/login/login_code_screen.dart';
import 'package:fsof/ui/screen/login/region_selector_screen.dart';
import 'package:fsof/ui/screen/login/widgets/birthday_date_picker.dart';
import 'package:fsof/ui/screen/login/widgets/min_age_bottom_sheet.dart';
import 'package:fsof/ui/screen/web_view/web_view_screen.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_number/phone_number.dart';

VoidCallback useCountrySelectorCallback(ValueNotifier<RegionInfo> region) {
  final context = useContext();

  return () {
    Navigator.push<RegionInfo>(
      context,
      RegionSelectorScreen.goTo(),
    ).then((result) => region.value = result ?? region.value);
  };
}

VoidCallback useOnSubmitCallback({
  required String phone,
  required String code,
  required WidgetRef ref,
  required bool navigate,
}) {
  final context = useContext();
  return () {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      deviceInfo.androidInfo.then((value) {
        postPhoneNumer(ref: ref,
          code: code,
          phone: phone,
          context: context,
          navigate: navigate,
          deviceId: value.androidId!//'7B8D0912-278E-40C4-9D13-8863F2C0D984',
        );
      });
    }

    if (Platform.isIOS) {
      deviceInfo.iosInfo.then((value) {
        postPhoneNumer(ref: ref,
          code: code,
          phone: phone,
          navigate: navigate,
          context: context,
          deviceId: value.identifierForVendor!,);
      });
    }
  };
}

void postPhoneNumer({
  required WidgetRef ref,
  required String code,
  required String phone,
  required String deviceId,
  required context,
  required bool navigate
}) {
  ref
      .read(postPhoneNumberNotifierProvider.notifier)
      .getPhoneCode(
      phoneNumber: '+$code${phone
              .replaceAll('(', kEmptyString)
              .replaceAll(')', kEmptyString)
              .replaceAll(' ', kEmptyString)
              .replaceAll('-', kEmptyString)}',
      //deviceUniqueIdentifier: value.androidId!,
      deviceUniqueIdentifier: deviceId,
      phoneNumberCountryCode: '+$code')
      .then((value) {
    final state = ref.watch(postPhoneNumberNotifierProvider);
    if (state.data != null) {
      if(navigate){
        Navigator.push(
          context,
          LoginCodeScreen.goTo(
            phoneNumber: '+$code${phone
                .replaceAll('(', kEmptyString)
                .replaceAll(')', kEmptyString)
                .replaceAll(' ', kEmptyString)
                .replaceAll('-', kEmptyString)}',
            code: '+$code',
            deviceUniqueIdentifier: deviceId,
          ),
        );
      }
    } else if (state.error != null) {
      showErrorDialog(
        context: context,
        message: I18n
            .of(context)
            .eWarning,
        onRetry: () {},
        barrierDismissible: false,
      );
    }
  });
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
    final daysDif = date
        .difference(currentTime)
        .inDays
        .abs();

    if (daysDif < kDaysPerYear * kMinAge) {
      showModalBottomSheet(
        context: context,
        builder: (_) => const MinAgeBottomSheet(),
      );
    } else if (daysDif < kDaysPerYear * kMidAge) {
      Navigator.push(
          context,
          ConsentingParentScreen.goTo()
      );
    }else{
      Navigator.push(
          context,
          WebViewScreen.goToPrivacyPolicy()
      );
    }
  };
}
