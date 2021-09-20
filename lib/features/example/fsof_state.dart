library fsof_state;

import 'package:built_value/built_value.dart';

part 'fsof_state.g.dart';

abstract class FsofState implements Built<FsofState, FsofStateBuilder> {
  factory FsofState([void Function(FsofStateBuilder b) updates]) = _$FsofState;

  FsofState._();

  int get count;

  String get title;

  static FsofState initial() => FsofState((b) => b
    ..title = ''
    ..count = 0);
}
