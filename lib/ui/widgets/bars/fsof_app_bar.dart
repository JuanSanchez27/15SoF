import 'package:flutter/material.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/buttons/fsof_back_button.dart';

const _titleStyle = TextStyle(
  fontFamily: fontFamily,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: kDimens15,
  height: kDimens2,
  color: kWhite100,
  leadingDistribution: TextLeadingDistribution.even,
);

class FsofAppBar extends StatelessWidget implements PreferredSizeWidget {
  FsofAppBar({
    Key? key,
    this.backgroundColor = kBackgroundColor,
    this.title,
    this.centerTitle = true,
    this.leading,
    this.actions,
    this.brightness = Brightness.light,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.bottom,
    this.elevation,
    this.topWhiteSpace = 0.0,
  })  : preferredSize = Size.fromHeight(kToolbarHeight +
            topWhiteSpace! +
            (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  factory FsofAppBar.withTitle({required String title, Widget? leading}) {
    return FsofAppBar(
      title: Text(
        title,
        style: _titleStyle,
      ),
      centerTitle: true,
      leading: leading,
    );
  }

  factory FsofAppBar.withTitleAndBack({required String title}) {
    return FsofAppBar(
      title: Text(
        title,
        style: _titleStyle,
      ),
      centerTitle: true,
      leading: const SofBackButton(color: kWhite100),
    );
  }

  final Color backgroundColor;
  final Widget? title;
  final bool centerTitle;
  final Widget? leading;
  @override
  final Size preferredSize;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Brightness brightness;
  final double titleSpacing;
  final double? elevation;
  final double? topWhiteSpace;

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    /*return ControlPanelGate(
      //isEnabled: AppConfiguration.controlPanelEnabled,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        title: title,
        centerTitle: centerTitle,
        leading: leading != null
            ? Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: leading,
              )
            : null,
        actions:
            actions != null ? [...actions!, const SizedBox(width: 16)] : [],
        titleSpacing: titleSpacing,
        bottom: bottom,
        elevation: elevation ?? 0,
        toolbarHeight: kToolbarHeight + topWhiteSpace!,
        shadowColor: kDarkRed.withAlpha(80),
      ),
    );*/
  }
}
