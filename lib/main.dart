import 'package:flutter/material.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsof/ui/screen/landing/landing_page.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final ThemeData theme = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: kBackgroundColor,
  );

  runApp(
    ProviderScope(
      child: MaterialApp(
        home: const LandingPage(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          I18n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: I18n.delegate.supportedLocales,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: kPrimaryColor,
          ),
        ),
      ),
    ),
  );
}
