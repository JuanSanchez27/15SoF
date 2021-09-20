import 'package:flutter/material.dart';
import 'package:fsof/presentation/common/image_viewer/image_viewer.dart';
import 'package:fsof/utils/routes/transparent_fade_material_page_route.dart';

final AppRouter appRouter = AppRouter();

class AppRouter {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context {
    return navigatorKey.currentState!.overlay!.context;
  }

  void startWith(Widget route) {
    navigatorKey.currentState?.pushAndRemoveUntil<Widget>(
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(
          name: route.runtimeType.toString(),
        ),
      ),
      (route) => false,
    );
  }

  Future<T?>? goTo<T extends Object?>(Widget route) {
    return navigatorKey.currentState?.push<T>(
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(
          name: route.runtimeType.toString(),
        ),
      ),
    );
  }

  Future<T?>? goToAndRemoveUntil<T extends Object?>(
    Widget route,
    RoutePredicate predicate,
  ) {
    return navigatorKey.currentState?.pushAndRemoveUntil<T>(
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(
          name: route.runtimeType.toString(),
        ),
      ),
      predicate,
    );
  }

  void goToRoot() {
    navigatorKey.currentState?.popUntil((predicate) => predicate.isFirst);
  }

  void goBackUntil(String name) {
    navigatorKey.currentState?.popUntil(
      (predicate) => predicate.settings.name == name,
    );
  }

  void goBack() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
    }
  }

  void showImage(Image image) {
    navigatorKey.currentState?.push<MaterialPageRoute>(
      TransparentFadeMaterialPageRoute(
        builder: (context) => ImageViewerPage([image]),
      ),
    );
  }

  void showImages({required List<Image> images, int currentIndex = 0}) {
    if (images.isEmpty) {
      return;
    }

    navigatorKey.currentState?.push<MaterialPageRoute>(
      TransparentFadeMaterialPageRoute(
        builder: (context) => ImageViewerPage(
          images,
          selectedIndex: currentIndex,
        ),
      ),
    );
  }
}
