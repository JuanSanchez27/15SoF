import 'dart:async';

import 'package:async_redux/async_redux.dart' hide Store;
import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' hide Store;
import 'package:fsof/app/app_state.dart';

class _GlobalStateHook<T, S extends GlobalState> extends Hook<T> {
  const _GlobalStateHook({
    required this.store,
    required this.converter,
    this.distinct = true,
  });

  final T Function(S) converter;
  final bool distinct;
  final Store<S> store;

  @override
  HookState<T, Hook<T>> createState() {
    return _GlobalStateStateHook<T, S>();
  }
}

class _GlobalStateStateHook<T, S extends GlobalState>
    extends HookState<T, _GlobalStateHook<T, S>> {
  StreamSubscription? _storeSubscription;
  late T _state;

  @override
  void initHook() {
    super.initHook();

    _updateState(hook.store.state);

    final onStoreChanged = hook.store.onChange;
    _storeSubscription = onStoreChanged.listen(_updateState);
  }

  @override
  T build(BuildContext context) {
    return _state;
  }

  @override
  void dispose() {
    _storeSubscription?.cancel();

    super.dispose();
  }

  void _updateState(S globalState) {
    final state = hook.converter(globalState);

    if (hook.distinct && state == _state) {
      return;
    }

    setState(() => _state = state);
  }
}

T useGlobalState<T>(
  T Function(AppState) converter, {
  bool distinct = true,
}) {
  final context = useContext();
  final store = StoreProvider.of<AppState>(context, 'useGlobalState hook')
      // ignore: avoid_as
      as Store<AppState>;

  return use(_GlobalStateHook(
    store: store,
    converter: converter,
    distinct: distinct,
  ));
}