import 'package:dash_kit_control_panel/dash_kit_control_panel.dart';
import 'package:flutter/material.dart';
import 'package:fsof/configuration/app_configuration.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/widgets/buttons/fsof_back_button.dart';

const _titleStyle = TextStyle(
  fontFamily: fontFamily,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 15,
  height: 2,
  color: ColorRes.white,
  leadingDistribution: TextLeadingDistribution.even,
);

class SofAppBar extends StatelessWidget implements PreferredSizeWidget {
  SofAppBar({
    Key? key,
    this.backgroundColor = ColorRes.ebonyClay,
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

  factory SofAppBar.withTitle({required String title, Widget? leading}) {
    return SofAppBar(
      title: Text(
        title,
        style: _titleStyle,
      ),
      centerTitle: true,
      leading: leading,
    );
  }

  factory SofAppBar.withTitleAndBack({required String title}) {
    return SofAppBar(
      title: Text(
        title,
        style: _titleStyle,
      ),
      centerTitle: true,
      leading: const SofBackButton(color: ColorRes.white),
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
    return ControlPanelGate(
      isEnabled: AppConfiguration.controlPanelEnabled,
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
        shadowColor: ColorRes.errorRed.withAlpha(80),
      ),
    );
  }
}
