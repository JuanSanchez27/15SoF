import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/navigation/fsof_bottom_navigation_bar.dart';

class MainScreen extends HookWidget {
  const MainScreen({Key? key}) : super(key: key);

  static Route goto() => MaterialPageRoute(
        builder: (_) => const MainScreen(),
        settings: const RouteSettings(name: kRouteMain),
      );

  @override
  Widget build(BuildContext context) {
    final mainPageKey = GlobalKey<ScaffoldState>();
    final currentTabIndex = useState(0);

    return Scaffold(
      key: mainPageKey,
      body: IndexedStack(
        index: currentTabIndex.value,
        children: BottomBarItems.values
            .map((item) => item.properties.buildContent())
            .toList(),
      ),
      bottomNavigationBar: FsofBottomNavigationBar(
        currentIndex: currentTabIndex.value,
        onTap: (pageIndex) => currentTabIndex.value = pageIndex,
      ),
    );
  }
}
