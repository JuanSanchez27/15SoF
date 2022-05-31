import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/ui/screen/home/home_screen.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class FsofBottomNavigationBar extends StatelessWidget {
  const FsofBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: BottomBarItems.values
          .map(
            (item) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                item.properties.image,
                color: kWhite100,
              ),
              activeIcon: SvgPicture.asset(
                item.properties.image,
                color: kPrimaryColor,
              ),
              tooltip: kEmptyString,
              label: kEmptyString,
            ),
          )
          .toList(),
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBackgroundColor,
      enableFeedback: false,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}

enum BottomBarItems {
  home,
  search,
  challenge,
  checkIn,
  account,
}

class BottomBarItem {
  BottomBarItem({
    required this.image,
    required this.buildContent,
  });

  final String image;
  final Widget Function() buildContent;
}

extension BottomBarItemsExtension on BottomBarItems {
  int get index => BottomBarItems.values.indexOf(this);

  BottomBarItem get properties => {
        BottomBarItems.home: BottomBarItem(
          image: kImageIcHome,
          buildContent: () => const HomeScreen(),
        ),
        BottomBarItems.search: BottomBarItem(
          image: kImageIcSearch,
          buildContent: () => const SizedBox(),
        ),
        BottomBarItems.challenge: BottomBarItem(
          image: kImageIcChallenge,
          buildContent: () => const SizedBox(),
        ),
        BottomBarItems.checkIn: BottomBarItem(
          image: kImageIcCheckIn,
          buildContent: () => const SizedBox(),
        ),
        BottomBarItems.account: BottomBarItem(
          image: kImageIcAccount,
          buildContent: () => const SizedBox(),
        ),
      }[this]!;
}
