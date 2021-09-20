import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:fsof/app/app_state.dart';
import 'package:fsof/core/app_store_connector.dart';

class ConnectedBlockedLoadable extends StatelessWidget {
  const ConnectedBlockedLoadable({
    required this.child,
    required this.converter,
    this.indicatorColor = Colors.white,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Color indicatorColor;
  final bool Function(AppState) converter;

  @override
  Widget build(BuildContext context) {
    return AppStateConnector<bool>(
      converter: converter,
      builder: (context, isLoading) => BlockedLoadableView(
        isLoading: isLoading,
        child: child,
      ),
    );
  }
}
