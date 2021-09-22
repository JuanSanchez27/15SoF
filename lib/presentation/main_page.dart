import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/widgets/navigation/fsof_bottom_navigation_bar.dart';

class MainPage extends HookWidget {
  const MainPage({Key? key}) : super(key: key);

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
