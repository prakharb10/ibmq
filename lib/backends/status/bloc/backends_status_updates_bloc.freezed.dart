// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backends_status_updates_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BackendsStatusUpdatesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendsStatusUpdatesEventCopyWith<$Res> {
  factory $BackendsStatusUpdatesEventCopyWith(BackendsStatusUpdatesEvent value,
          $Res Function(BackendsStatusUpdatesEvent) then) =
      _$BackendsStatusUpdatesEventCopyWithImpl<$Res,
          BackendsStatusUpdatesEvent>;
}

/// @nodoc
class _$BackendsStatusUpdatesEventCopyWithImpl<$Res,
        $Val extends BackendsStatusUpdatesEvent>
    implements $BackendsStatusUpdatesEventCopyWith<$Res> {
  _$BackendsStatusUpdatesEventCopyWithImpl(this._value, this._then);

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
    extends _$BackendsStatusUpdatesEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'BackendsStatusUpdatesEvent.started()';
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
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements BackendsStatusUpdatesEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$BackendsStatusUpdatesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connecting,
    required TResult Function(BackendStatusUpdate statusUpdate) listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(BackendStatusUpdate statusUpdate)? listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(BackendStatusUpdate statusUpdate)? listening,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Listening value) listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Listening value)? listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Listening value)? listening,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendsStatusUpdatesStateCopyWith<$Res> {
  factory $BackendsStatusUpdatesStateCopyWith(BackendsStatusUpdatesState value,
          $Res Function(BackendsStatusUpdatesState) then) =
      _$BackendsStatusUpdatesStateCopyWithImpl<$Res,
          BackendsStatusUpdatesState>;
}

/// @nodoc
class _$BackendsStatusUpdatesStateCopyWithImpl<$Res,
        $Val extends BackendsStatusUpdatesState>
    implements $BackendsStatusUpdatesStateCopyWith<$Res> {
  _$BackendsStatusUpdatesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BackendsStatusUpdatesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BackendsStatusUpdatesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connecting,
    required TResult Function(BackendStatusUpdate statusUpdate) listening,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(BackendStatusUpdate statusUpdate)? listening,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(BackendStatusUpdate statusUpdate)? listening,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Listening value) listening,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Listening value)? listening,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Listening value)? listening,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BackendsStatusUpdatesState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$BackendsStatusUpdatesStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
      _$ConnectingImpl _value, $Res Function(_$ConnectingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectingImpl implements Connecting {
  const _$ConnectingImpl();

  @override
  String toString() {
    return 'BackendsStatusUpdatesState.connecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connecting,
    required TResult Function(BackendStatusUpdate statusUpdate) listening,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(BackendStatusUpdate statusUpdate)? listening,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(BackendStatusUpdate statusUpdate)? listening,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Listening value) listening,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Listening value)? listening,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Listening value)? listening,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class Connecting implements BackendsStatusUpdatesState {
  const factory Connecting() = _$ConnectingImpl;
}

/// @nodoc
abstract class _$$ListeningImplCopyWith<$Res> {
  factory _$$ListeningImplCopyWith(
          _$ListeningImpl value, $Res Function(_$ListeningImpl) then) =
      __$$ListeningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BackendStatusUpdate statusUpdate});

  $BackendStatusUpdateCopyWith<$Res> get statusUpdate;
}

/// @nodoc
class __$$ListeningImplCopyWithImpl<$Res>
    extends _$BackendsStatusUpdatesStateCopyWithImpl<$Res, _$ListeningImpl>
    implements _$$ListeningImplCopyWith<$Res> {
  __$$ListeningImplCopyWithImpl(
      _$ListeningImpl _value, $Res Function(_$ListeningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusUpdate = null,
  }) {
    return _then(_$ListeningImpl(
      null == statusUpdate
          ? _value.statusUpdate
          : statusUpdate // ignore: cast_nullable_to_non_nullable
              as BackendStatusUpdate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BackendStatusUpdateCopyWith<$Res> get statusUpdate {
    return $BackendStatusUpdateCopyWith<$Res>(_value.statusUpdate, (value) {
      return _then(_value.copyWith(statusUpdate: value));
    });
  }
}

/// @nodoc

class _$ListeningImpl implements Listening {
  const _$ListeningImpl(this.statusUpdate);

  @override
  final BackendStatusUpdate statusUpdate;

  @override
  String toString() {
    return 'BackendsStatusUpdatesState.listening(statusUpdate: $statusUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningImpl &&
            (identical(other.statusUpdate, statusUpdate) ||
                other.statusUpdate == statusUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningImplCopyWith<_$ListeningImpl> get copyWith =>
      __$$ListeningImplCopyWithImpl<_$ListeningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connecting,
    required TResult Function(BackendStatusUpdate statusUpdate) listening,
  }) {
    return listening(statusUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connecting,
    TResult? Function(BackendStatusUpdate statusUpdate)? listening,
  }) {
    return listening?.call(statusUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connecting,
    TResult Function(BackendStatusUpdate statusUpdate)? listening,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(statusUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Listening value) listening,
  }) {
    return listening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Listening value)? listening,
  }) {
    return listening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Listening value)? listening,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(this);
    }
    return orElse();
  }
}

abstract class Listening implements BackendsStatusUpdatesState {
  const factory Listening(final BackendStatusUpdate statusUpdate) =
      _$ListeningImpl;

  BackendStatusUpdate get statusUpdate;
  @JsonKey(ignore: true)
  _$$ListeningImplCopyWith<_$ListeningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
