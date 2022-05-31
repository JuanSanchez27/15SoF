import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/ui/screen/login/account_guest_screen.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

VoidCallback useOnCreateFameCallback() {
  final context = useContext();
  return () {
    showDialog(
      context: context,
      builder: (_) => const AccountGuestScreen(),
      useSafeArea: false,
      routeSettings: const RouteSettings(
        name: kRouteLoginAccountGuest,
      ),
    );
  };
}
