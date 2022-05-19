import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/presentation/login/account_guest_page.dart';

VoidCallback useOnCreateFameCallback() {
  final context = useContext();
  return () {
    showDialog(
      context: context,
      builder: (_) => const AccountGuestPage(),
      useSafeArea: false,
      routeSettings: RouteSettings(
        name: (AccountGuestPage).toString(),
      ),
    );
  };
}
