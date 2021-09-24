import 'package:flutter/material.dart';
import 'package:fsof/presentation/common/image_viewer/image_viewer.dart';
import 'package:fsof/utils/routes/transparent_fade_material_page_route.dart';

final AppRouter appRouter = AppRouter();

class AppRouter {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context {
    return navigatorKey.currentState!.overlay!.context;
  }

  void startWith({
    required BuildContext context,
    required Widget route,
    bool rootNavigator = false,
  }) {
    Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).pushAndRemoveUntil<Widget>(
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(
          name: route.runtimeType.toString(),
        ),
      ),
      (route) => false,
    );
  }

  Future<T?>? goTo<T extends Object?>({
    required BuildContext context,
    required Widget route,
    bool rootNavigator = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).push<T>(
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(
          name: route.runtimeType.toString(),
        ),
      ),
    );
  }

  Future<T?>? goToAndRemoveUntil<T extends Object?>({
    required BuildContext context,
    required Widget route,
    required RoutePredicate predicate,
    bool rootNavigator = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).pushAndRemoveUntil<T>(
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(
          name: route.runtimeType.toString(),
        ),
      ),
      predicate,
    );
  }

  void goToRoot({
    required BuildContext context,
    bool rootNavigator = false,
  }) {
    Navigator.of(context, rootNavigator: rootNavigator)
        .popUntil((predicate) => predicate.isFirst);
  }

  void goBackUntil({
    required BuildContext context,
    required String name,
    bool rootNavigator = false,
  }) {
    Navigator.of(context, rootNavigator: rootNavigator).popUntil(
      (predicate) => predicate.settings.name == name,
    );
  }

  void goBack(
    BuildContext context, {
    bool rootNavigator = false,
  }) {
    final navState = Navigator.of(context, rootNavigator: rootNavigator);
    if (navState.canPop()) {
      navState.pop();
    }
  }

  void showImage(BuildContext context, Image image) {
    Navigator.of(context).push<MaterialPageRoute>(
      TransparentFadeMaterialPageRoute(
        builder: (context) => ImageViewerPage([image]),
      ),
    );
  }

  void showImages({
    required BuildContext context,
    required List<Image> images,
    int currentIndex = 0,
  }) {
    if (images.isEmpty) {
      return;
    }

    Navigator.of(context).push<MaterialPageRoute>(
      TransparentFadeMaterialPageRoute(
        builder: (context) => ImageViewerPage(
          images,
          selectedIndex: currentIndex,
        ),
      ),
    );
  }
}
