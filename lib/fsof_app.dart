import 'package:dash_kit_control_panel/dash_kit_control_panel.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fsof/navigation/app_router.dart';
import 'package:fsof/presentation/landing/landing_page.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/widgets/containers/connected_loadable.dart';
import 'package:fsof/widgets/inputs/drop_focus.dart';

class FsofApp extends StatefulWidget {
  FsofApp({
    required this.isAuthorized,
  }) : super(key: GlobalKey<FsofAppState>());

  final bool isAuthorized;

  @override
  State<StatefulWidget> createState() => FsofAppState();
}

class FsofAppState extends State<FsofApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: fontFamily,
      scaffoldBackgroundColor: ColorRes.ebonyClay,
    );

    return DropFocus(
      child: Application(
        child: MaterialApp(
          title: Strings.title,
          debugShowCheckedModeBanner: false,
          builder: (context, child) => Application.appBuilder(
            context,
            ConnectedLoadable(
              converter: (s) => false,
              child: child ?? const SizedBox(),
            ),
          ),
          navigatorKey: appRouter.navigatorKey,
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
          ],
          home: const LandingPage(),
          theme: theme.copyWith(
            colorScheme:
                theme.colorScheme.copyWith(primary: ColorRes.primary),
          ),
        ),
      ),
    );
  }
}
