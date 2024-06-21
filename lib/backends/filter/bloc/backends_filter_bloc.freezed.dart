// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backends_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BackendsFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(IList<Backend> backends) backendsChanged,
    required TResult Function(int columnIndex, bool ascending) sortBy,
    required TResult Function(String search) searchChanged,
    required TResult Function(List<String> features) featuresChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(IList<Backend> backends)? backendsChanged,
    TResult? Function(int columnIndex, bool ascending)? sortBy,
    TResult? Function(String search)? searchChanged,
    TResult? Function(List<String> features)? featuresChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(IList<Backend> backends)? backendsChanged,
    TResult Function(int columnIndex, bool ascending)? sortBy,
    TResult Function(String search)? searchChanged,
    TResult Function(List<String> features)? featuresChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BackendsChanged value) backendsChanged,
    required TResult Function(_SortBy value) sortBy,
    required TResult Function(_SearchChanged value) searchChanged,
    required TResult Function(_FeaturesChanged value) featuresChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BackendsChanged value)? backendsChanged,
    TResult? Function(_SortBy value)? sortBy,
    TResult? Function(_SearchChanged value)? searchChanged,
    TResult? Function(_FeaturesChanged value)? featuresChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BackendsChanged value)? backendsChanged,
    TResult Function(_SortBy value)? sortBy,
    TResult Function(_SearchChanged value)? searchChanged,
    TResult Function(_FeaturesChanged value)? featuresChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendsFilterEventCopyWith<$Res> {
  factory $BackendsFilterEventCopyWith(
          BackendsFilterEvent value, $Res Function(BackendsFilterEvent) then) =
      _$BackendsFilterEventCopyWithImpl<$Res, BackendsFilterEvent>;
}

/// @nodoc
class _$BackendsFilterEventCopyWithImpl<$Res, $Val extends BackendsFilterEvent>
    implements $BackendsFilterEventCopyWith<$Res> {
  _$BackendsFilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$BackendsFilterEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'BackendsFilterEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(IList<Backend> backends) backendsChanged,
    required TResult Function(int columnIndex, bool ascending) sortBy,
    required TResult Function(String search) searchChanged,
    required TResult Function(List<String> features) featuresChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(IList<Backend> backends)? backendsChanged,
    TResult? Function(int columnIndex, bool ascending)? sortBy,
    TResult? Function(String search)? searchChanged,
    TResult? Function(List<String> features)? featuresChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(IList<Backend> backends)? backendsChanged,
    TResult Function(int columnIndex, bool ascending)? sortBy,
    TResult Function(String search)? searchChanged,
    TResult Function(List<String> features)? featuresChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BackendsChanged value) backendsChanged,
    required TResult Function(_SortBy value) sortBy,
    required TResult Function(_SearchChanged value) searchChanged,
    required TResult Function(_FeaturesChanged value) featuresChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BackendsChanged value)? backendsChanged,
    TResult? Function(_SortBy value)? sortBy,
    TResult? Function(_SearchChanged value)? searchChanged,
    TResult? Function(_FeaturesChanged value)? featuresChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BackendsChanged value)? backendsChanged,
    TResult Function(_SortBy value)? sortBy,
    TResult Function(_SearchChanged value)? searchChanged,
    TResult Function(_FeaturesChanged value)? featuresChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements BackendsFilterEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$BackendsChangedImplCopyWith<$Res> {
  factory _$$BackendsChangedImplCopyWith(_$BackendsChangedImpl value,
          $Res Function(_$BackendsChangedImpl) then) =
      __$$BackendsChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({IList<Backend> backends});
}

/// @nodoc
class __$$BackendsChangedImplCopyWithImpl<$Res>
    extends _$BackendsFilterEventCopyWithImpl<$Res, _$BackendsChangedImpl>
    implements _$$BackendsChangedImplCopyWith<$Res> {
  __$$BackendsChangedImplCopyWithImpl(
      _$BackendsChangedImpl _value, $Res Function(_$BackendsChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backends = null,
  }) {
    return _then(_$BackendsChangedImpl(
      null == backends
          ? _value.backends
          : backends // ignore: cast_nullable_to_non_nullable
              as IList<Backend>,
    ));
  }
}

/// @nodoc

class _$BackendsChangedImpl implements _BackendsChanged {
  const _$BackendsChangedImpl(this.backends);

  @override
  final IList<Backend> backends;

  @override
  String toString() {
    return 'BackendsFilterEvent.backendsChanged(backends: $backends)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendsChangedImpl &&
            const DeepCollectionEquality().equals(other.backends, backends));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(backends));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendsChangedImplCopyWith<_$BackendsChangedImpl> get copyWith =>
      __$$BackendsChangedImplCopyWithImpl<_$BackendsChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(IList<Backend> backends) backendsChanged,
    required TResult Function(int columnIndex, bool ascending) sortBy,
    required TResult Function(String search) searchChanged,
    required TResult Function(List<String> features) featuresChanged,
  }) {
    return backendsChanged(backends);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(IList<Backend> backends)? backendsChanged,
    TResult? Function(int columnIndex, bool ascending)? sortBy,
    TResult? Function(String search)? searchChanged,
    TResult? Function(List<String> features)? featuresChanged,
  }) {
    return backendsChanged?.call(backends);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(IList<Backend> backends)? backendsChanged,
    TResult Function(int columnIndex, bool ascending)? sortBy,
    TResult Function(String search)? searchChanged,
    TResult Function(List<String> features)? featuresChanged,
    required TResult orElse(),
  }) {
    if (backendsChanged != null) {
      return backendsChanged(backends);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BackendsChanged value) backendsChanged,
    required TResult Function(_SortBy value) sortBy,
    required TResult Function(_SearchChanged value) searchChanged,
    required TResult Function(_FeaturesChanged value) featuresChanged,
  }) {
    return backendsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BackendsChanged value)? backendsChanged,
    TResult? Function(_SortBy value)? sortBy,
    TResult? Function(_SearchChanged value)? searchChanged,
    TResult? Function(_FeaturesChanged value)? featuresChanged,
  }) {
    return backendsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BackendsChanged value)? backendsChanged,
    TResult Function(_SortBy value)? sortBy,
    TResult Function(_SearchChanged value)? searchChanged,
    TResult Function(_FeaturesChanged value)? featuresChanged,
    required TResult orElse(),
  }) {
    if (backendsChanged != null) {
      return backendsChanged(this);
    }
    return orElse();
  }
}

abstract class _BackendsChanged implements BackendsFilterEvent {
  const factory _BackendsChanged(final IList<Backend> backends) =
      _$BackendsChangedImpl;

  IList<Backend> get backends;
  @JsonKey(ignore: true)
  _$$BackendsChangedImplCopyWith<_$BackendsChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SortByImplCopyWith<$Res> {
  factory _$$SortByImplCopyWith(
          _$SortByImpl value, $Res Function(_$SortByImpl) then) =
      __$$SortByImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int columnIndex, bool ascending});
}

/// @nodoc
class __$$SortByImplCopyWithImpl<$Res>
    extends _$BackendsFilterEventCopyWithImpl<$Res, _$SortByImpl>
    implements _$$SortByImplCopyWith<$Res> {
  __$$SortByImplCopyWithImpl(
      _$SortByImpl _value, $Res Function(_$SortByImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnIndex = null,
    Object? ascending = null,
  }) {
    return _then(_$SortByImpl(
      columnIndex: null == columnIndex
          ? _value.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      ascending: null == ascending
          ? _value.ascending
          : ascending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SortByImpl implements _SortBy {
  const _$SortByImpl({required this.columnIndex, required this.ascending});

  @override
  final int columnIndex;
  @override
  final bool ascending;

  @override
  String toString() {
    return 'BackendsFilterEvent.sortBy(columnIndex: $columnIndex, ascending: $ascending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortByImpl &&
            (identical(other.columnIndex, columnIndex) ||
                other.columnIndex == columnIndex) &&
            (identical(other.ascending, ascending) ||
                other.ascending == ascending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, columnIndex, ascending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SortByImplCopyWith<_$SortByImpl> get copyWith =>
      __$$SortByImplCopyWithImpl<_$SortByImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(IList<Backend> backends) backendsChanged,
    required TResult Function(int columnIndex, bool ascending) sortBy,
    required TResult Function(String search) searchChanged,
    required TResult Function(List<String> features) featuresChanged,
  }) {
    return sortBy(columnIndex, ascending);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(IList<Backend> backends)? backendsChanged,
    TResult? Function(int columnIndex, bool ascending)? sortBy,
    TResult? Function(String search)? searchChanged,
    TResult? Function(List<String> features)? featuresChanged,
  }) {
    return sortBy?.call(columnIndex, ascending);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(IList<Backend> backends)? backendsChanged,
    TResult Function(int columnIndex, bool ascending)? sortBy,
    TResult Function(String search)? searchChanged,
    TResult Function(List<String> features)? featuresChanged,
    required TResult orElse(),
  }) {
    if (sortBy != null) {
      return sortBy(columnIndex, ascending);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BackendsChanged value) backendsChanged,
    required TResult Function(_SortBy value) sortBy,
    required TResult Function(_SearchChanged value) searchChanged,
    required TResult Function(_FeaturesChanged value) featuresChanged,
  }) {
    return sortBy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BackendsChanged value)? backendsChanged,
    TResult? Function(_SortBy value)? sortBy,
    TResult? Function(_SearchChanged value)? searchChanged,
    TResult? Function(_FeaturesChanged value)? featuresChanged,
  }) {
    return sortBy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BackendsChanged value)? backendsChanged,
    TResult Function(_SortBy value)? sortBy,
    TResult Function(_SearchChanged value)? searchChanged,
    TResult Function(_FeaturesChanged value)? featuresChanged,
    required TResult orElse(),
  }) {
    if (sortBy != null) {
      return sortBy(this);
    }
    return orElse();
  }
}

abstract class _SortBy implements BackendsFilterEvent {
  const factory _SortBy(
      {required final int columnIndex,
      required final bool ascending}) = _$SortByImpl;

  int get columnIndex;
  bool get ascending;
  @JsonKey(ignore: true)
  _$$SortByImplCopyWith<_$SortByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchChangedImplCopyWith<$Res> {
  factory _$$SearchChangedImplCopyWith(
          _$SearchChangedImpl value, $Res Function(_$SearchChangedImpl) then) =
      __$$SearchChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String search});
}

/// @nodoc
class __$$SearchChangedImplCopyWithImpl<$Res>
    extends _$BackendsFilterEventCopyWithImpl<$Res, _$SearchChangedImpl>
    implements _$$SearchChangedImplCopyWith<$Res> {
  __$$SearchChangedImplCopyWithImpl(
      _$SearchChangedImpl _value, $Res Function(_$SearchChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
  }) {
    return _then(_$SearchChangedImpl(
      null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchChangedImpl implements _SearchChanged {
  const _$SearchChangedImpl(this.search);

  @override
  final String search;

  @override
  String toString() {
    return 'BackendsFilterEvent.searchChanged(search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchChangedImpl &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchChangedImplCopyWith<_$SearchChangedImpl> get copyWith =>
      __$$SearchChangedImplCopyWithImpl<_$SearchChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(IList<Backend> backends) backendsChanged,
    required TResult Function(int columnIndex, bool ascending) sortBy,
    required TResult Function(String search) searchChanged,
    required TResult Function(List<String> features) featuresChanged,
  }) {
    return searchChanged(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(IList<Backend> backends)? backendsChanged,
    TResult? Function(int columnIndex, bool ascending)? sortBy,
    TResult? Function(String search)? searchChanged,
    TResult? Function(List<String> features)? featuresChanged,
  }) {
    return searchChanged?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(IList<Backend> backends)? backendsChanged,
    TResult Function(int columnIndex, bool ascending)? sortBy,
    TResult Function(String search)? searchChanged,
    TResult Function(List<String> features)? featuresChanged,
    required TResult orElse(),
  }) {
    if (searchChanged != null) {
      return searchChanged(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BackendsChanged value) backendsChanged,
    required TResult Function(_SortBy value) sortBy,
    required TResult Function(_SearchChanged value) searchChanged,
    required TResult Function(_FeaturesChanged value) featuresChanged,
  }) {
    return searchChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BackendsChanged value)? backendsChanged,
    TResult? Function(_SortBy value)? sortBy,
    TResult? Function(_SearchChanged value)? searchChanged,
    TResult? Function(_FeaturesChanged value)? featuresChanged,
  }) {
    return searchChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BackendsChanged value)? backendsChanged,
    TResult Function(_SortBy value)? sortBy,
    TResult Function(_SearchChanged value)? searchChanged,
    TResult Function(_FeaturesChanged value)? featuresChanged,
    required TResult orElse(),
  }) {
    if (searchChanged != null) {
      return searchChanged(this);
    }
    return orElse();
  }
}

abstract class _SearchChanged implements BackendsFilterEvent {
  const factory _SearchChanged(final String search) = _$SearchChangedImpl;

  String get search;
  @JsonKey(ignore: true)
  _$$SearchChangedImplCopyWith<_$SearchChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FeaturesChangedImplCopyWith<$Res> {
  factory _$$FeaturesChangedImplCopyWith(_$FeaturesChangedImpl value,
          $Res Function(_$FeaturesChangedImpl) then) =
      __$$FeaturesChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> features});
}

/// @nodoc
class __$$FeaturesChangedImplCopyWithImpl<$Res>
    extends _$BackendsFilterEventCopyWithImpl<$Res, _$FeaturesChangedImpl>
    implements _$$FeaturesChangedImplCopyWith<$Res> {
  __$$FeaturesChangedImplCopyWithImpl(
      _$FeaturesChangedImpl _value, $Res Function(_$FeaturesChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_$FeaturesChangedImpl(
      null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$FeaturesChangedImpl implements _FeaturesChanged {
  const _$FeaturesChangedImpl(final List<String> features)
      : _features = features;

  final List<String> _features;
  @override
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'BackendsFilterEvent.featuresChanged(features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturesChangedImpl &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturesChangedImplCopyWith<_$FeaturesChangedImpl> get copyWith =>
      __$$FeaturesChangedImplCopyWithImpl<_$FeaturesChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(IList<Backend> backends) backendsChanged,
    required TResult Function(int columnIndex, bool ascending) sortBy,
    required TResult Function(String search) searchChanged,
    required TResult Function(List<String> features) featuresChanged,
  }) {
    return featuresChanged(features);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(IList<Backend> backends)? backendsChanged,
    TResult? Function(int columnIndex, bool ascending)? sortBy,
    TResult? Function(String search)? searchChanged,
    TResult? Function(List<String> features)? featuresChanged,
  }) {
    return featuresChanged?.call(features);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(IList<Backend> backends)? backendsChanged,
    TResult Function(int columnIndex, bool ascending)? sortBy,
    TResult Function(String search)? searchChanged,
    TResult Function(List<String> features)? featuresChanged,
    required TResult orElse(),
  }) {
    if (featuresChanged != null) {
      return featuresChanged(features);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BackendsChanged value) backendsChanged,
    required TResult Function(_SortBy value) sortBy,
    required TResult Function(_SearchChanged value) searchChanged,
    required TResult Function(_FeaturesChanged value) featuresChanged,
  }) {
    return featuresChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_BackendsChanged value)? backendsChanged,
    TResult? Function(_SortBy value)? sortBy,
    TResult? Function(_SearchChanged value)? searchChanged,
    TResult? Function(_FeaturesChanged value)? featuresChanged,
  }) {
    return featuresChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BackendsChanged value)? backendsChanged,
    TResult Function(_SortBy value)? sortBy,
    TResult Function(_SearchChanged value)? searchChanged,
    TResult Function(_FeaturesChanged value)? featuresChanged,
    required TResult orElse(),
  }) {
    if (featuresChanged != null) {
      return featuresChanged(this);
    }
    return orElse();
  }
}

abstract class _FeaturesChanged implements BackendsFilterEvent {
  const factory _FeaturesChanged(final List<String> features) =
      _$FeaturesChangedImpl;

  List<String> get features;
  @JsonKey(ignore: true)
  _$$FeaturesChangedImplCopyWith<_$FeaturesChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BackendsFilterState {
  IList<Backend> get backends => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IList<Backend> backends) initial,
    required TResult Function(BackendsFilter filter, IList<Backend> backends)
        filtered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IList<Backend> backends)? initial,
    TResult? Function(BackendsFilter filter, IList<Backend> backends)? filtered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IList<Backend> backends)? initial,
    TResult Function(BackendsFilter filter, IList<Backend> backends)? filtered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Filtered value) filtered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Filtered value)? filtered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Filtered value)? filtered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BackendsFilterStateCopyWith<BackendsFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendsFilterStateCopyWith<$Res> {
  factory $BackendsFilterStateCopyWith(
          BackendsFilterState value, $Res Function(BackendsFilterState) then) =
      _$BackendsFilterStateCopyWithImpl<$Res, BackendsFilterState>;
  @useResult
  $Res call({IList<Backend> backends});
}

/// @nodoc
class _$BackendsFilterStateCopyWithImpl<$Res, $Val extends BackendsFilterState>
    implements $BackendsFilterStateCopyWith<$Res> {
  _$BackendsFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backends = null,
  }) {
    return _then(_value.copyWith(
      backends: null == backends
          ? _value.backends
          : backends // ignore: cast_nullable_to_non_nullable
              as IList<Backend>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $BackendsFilterStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IList<Backend> backends});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BackendsFilterStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backends = null,
  }) {
    return _then(_$InitialImpl(
      backends: null == backends
          ? _value.backends
          : backends // ignore: cast_nullable_to_non_nullable
              as IList<Backend>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl({required this.backends});

  @override
  final IList<Backend> backends;

  @override
  String toString() {
    return 'BackendsFilterState.initial(backends: $backends)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other.backends, backends));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(backends));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IList<Backend> backends) initial,
    required TResult Function(BackendsFilter filter, IList<Backend> backends)
        filtered,
  }) {
    return initial(backends);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IList<Backend> backends)? initial,
    TResult? Function(BackendsFilter filter, IList<Backend> backends)? filtered,
  }) {
    return initial?.call(backends);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IList<Backend> backends)? initial,
    TResult Function(BackendsFilter filter, IList<Backend> backends)? filtered,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(backends);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Filtered value) filtered,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Filtered value)? filtered,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Filtered value)? filtered,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements BackendsFilterState {
  const factory Initial({required final IList<Backend> backends}) =
      _$InitialImpl;

  @override
  IList<Backend> get backends;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilteredImplCopyWith<$Res>
    implements $BackendsFilterStateCopyWith<$Res> {
  factory _$$FilteredImplCopyWith(
          _$FilteredImpl value, $Res Function(_$FilteredImpl) then) =
      __$$FilteredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BackendsFilter filter, IList<Backend> backends});

  $BackendsFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$FilteredImplCopyWithImpl<$Res>
    extends _$BackendsFilterStateCopyWithImpl<$Res, _$FilteredImpl>
    implements _$$FilteredImplCopyWith<$Res> {
  __$$FilteredImplCopyWithImpl(
      _$FilteredImpl _value, $Res Function(_$FilteredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? backends = null,
  }) {
    return _then(_$FilteredImpl(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as BackendsFilter,
      backends: null == backends
          ? _value.backends
          : backends // ignore: cast_nullable_to_non_nullable
              as IList<Backend>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BackendsFilterCopyWith<$Res> get filter {
    return $BackendsFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value));
    });
  }
}

/// @nodoc

class _$FilteredImpl implements Filtered {
  const _$FilteredImpl({required this.filter, required this.backends});

  @override
  final BackendsFilter filter;
  @override
  final IList<Backend> backends;

  @override
  String toString() {
    return 'BackendsFilterState.filtered(filter: $filter, backends: $backends)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredImpl &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.backends, backends));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, filter, const DeepCollectionEquality().hash(backends));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteredImplCopyWith<_$FilteredImpl> get copyWith =>
      __$$FilteredImplCopyWithImpl<_$FilteredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IList<Backend> backends) initial,
    required TResult Function(BackendsFilter filter, IList<Backend> backends)
        filtered,
  }) {
    return filtered(filter, backends);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(IList<Backend> backends)? initial,
    TResult? Function(BackendsFilter filter, IList<Backend> backends)? filtered,
  }) {
    return filtered?.call(filter, backends);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IList<Backend> backends)? initial,
    TResult Function(BackendsFilter filter, IList<Backend> backends)? filtered,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(filter, backends);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Filtered value) filtered,
  }) {
    return filtered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Filtered value)? filtered,
  }) {
    return filtered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Filtered value)? filtered,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(this);
    }
    return orElse();
  }
}

abstract class Filtered implements BackendsFilterState {
  const factory Filtered(
      {required final BackendsFilter filter,
      required final IList<Backend> backends}) = _$FilteredImpl;

  BackendsFilter get filter;
  @override
  IList<Backend> get backends;
  @override
  @JsonKey(ignore: true)
  _$$FilteredImplCopyWith<_$FilteredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
