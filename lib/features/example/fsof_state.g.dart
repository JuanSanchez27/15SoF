// GENERATED CODE - DO NOT MODIFY BY HAND

part of fsof_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FsofState extends FsofState {
  @override
  final int count;
  @override
  final String title;

  factory _$FsofState([void Function(FsofStateBuilder)? updates]) =>
      (new FsofStateBuilder()..update(updates))._build();

  _$FsofState._({required this.count, required this.title}) : super._() {
    BuiltValueNullFieldError.checkNotNull(count, 'FsofState', 'count');
    BuiltValueNullFieldError.checkNotNull(title, 'FsofState', 'title');
  }

  @override
  FsofState rebuild(void Function(FsofStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FsofStateBuilder toBuilder() => new FsofStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FsofState && count == other.count && title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, count.hashCode), title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FsofState')
          ..add('count', count)
          ..add('title', title))
        .toString();
  }
}

class FsofStateBuilder implements Builder<FsofState, FsofStateBuilder> {
  _$FsofState? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  FsofStateBuilder();

  FsofStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FsofState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FsofState;
  }

  @override
  void update(void Function(FsofStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FsofState build() => _build();

  _$FsofState _build() {
    final _$result = _$v ??
        new _$FsofState._(
            count: BuiltValueNullFieldError.checkNotNull(
                count, 'FsofState', 'count'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, 'FsofState', 'title'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
