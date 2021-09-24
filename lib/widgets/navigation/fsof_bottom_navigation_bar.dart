import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fsof/presentation/home_page/home_page.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/images.dart';

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
                color: ColorRes.white,
              ),
              activeIcon: SvgPicture.asset(
                item.properties.image,
                color: ColorRes.primary,
              ),
              tooltip: '',
              label: '',
            ),
          )
          .toList(),
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorRes.ebonyClay,
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
          image: Images.icHome,
          buildContent: () => const HomePage(),
        ),
        BottomBarItems.search: BottomBarItem(
          image: Images.icSearch,
          buildContent: () => const SizedBox(),
        ),
        BottomBarItems.challenge: BottomBarItem(
          image: Images.icChallenge,
          buildContent: () => const SizedBox(),
        ),
        BottomBarItems.checkIn: BottomBarItem(
          image: Images.icCheckIn,
          buildContent: () => const SizedBox(),
        ),
        BottomBarItems.account: BottomBarItem(
          image: Images.icAccount,
          buildContent: () => const SizedBox(),
        ),
      }[this]!;
}
