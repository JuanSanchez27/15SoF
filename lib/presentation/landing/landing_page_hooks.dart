import 'package:dash_kit_network/dash_kit_network.dart';
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
    );
  };
}
