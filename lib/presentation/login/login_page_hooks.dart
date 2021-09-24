import 'package:dash_kit_network/dash_kit_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/navigation/app_router.dart';
import 'package:fsof/presentation/login/login_code_page.dart';
import 'package:fsof/presentation/login/region_selector.dart';
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
