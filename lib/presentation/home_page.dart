import 'package:dash_kit_control_panel/dash_kit_control_panel.dart';
import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/app/app_state.dart';
import 'package:fsof/app/operation.dart';
import 'package:fsof/core/app_store_connector.dart';
import 'package:fsof/features/example/actions/get_title_action.dart';
import 'package:fsof/features/example/actions/increment_action.dart';
import 'package:fsof/features/example/actions/reset_action.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/widgets/navigation/fsof_bottom_navigation_bar.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentTabIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: ControlPanelGate(child: Text(Strings.title)),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: FsofBottomNavigationBar(
        currentIndex: currentTabIndex.value,
        onTap: (pageIndex) => currentTabIndex.value = pageIndex,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody() {
    return AppStateConnector<AppState>(
      distinct: false,
      converter: (state) => state,
      builder: (context, state) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Strings.pressPlsButton),
            const SizedBox(height: 20),
            Text(
              Strings.getCount(state.template.count),
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            Text(
              'Skip state: '
              '${state.getOperationState(Operation.resetCounter).toString()}',
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => _skipCount(context),
              child: Text(Strings.skipCount),
            ),
            const SizedBox(height: 40),
            Text(Strings.getTitleString(state.template.title)),
            const SizedBox(height: 20),
            Text(
              'Get Title state: '
              '${state.getOperationState(Operation.getTitle).toString()}',
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => _getTitle(context),
              child: Text(Strings.getTitle),
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter(BuildContext context) {
    context.dispatch(IncrementAction(increment: 1));
  }

  void _skipCount(BuildContext context) {
    context.dispatch(ResetAction());
  }

  void _getTitle(BuildContext context) {
    context.dispatch(GetTitleAction());
  }
}
