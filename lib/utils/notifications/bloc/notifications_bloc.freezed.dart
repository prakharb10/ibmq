// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JobStatusUpdate jobStatusUpdate) received,
    required TResult Function(JobStatusUpdate jobStatusUpdate) clear,
    required TResult Function() clearAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult? Function()? clearAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult Function()? clearAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Received value) received,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ClearAll value) clearAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Received value)? received,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ClearAll value)? clearAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Received value)? received,
    TResult Function(_Clear value)? clear,
    TResult Function(_ClearAll value)? clearAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsEventCopyWith<$Res> {
  factory $NotificationsEventCopyWith(
          NotificationsEvent value, $Res Function(NotificationsEvent) then) =
      _$NotificationsEventCopyWithImpl<$Res, NotificationsEvent>;
}

/// @nodoc
class _$NotificationsEventCopyWithImpl<$Res, $Val extends NotificationsEvent>
    implements $NotificationsEventCopyWith<$Res> {
  _$NotificationsEventCopyWithImpl(this._value, this._then);

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
    extends _$NotificationsEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'NotificationsEvent.started()';
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
    required TResult Function(JobStatusUpdate jobStatusUpdate) received,
    required TResult Function(JobStatusUpdate jobStatusUpdate) clear,
    required TResult Function() clearAll,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult? Function()? clearAll,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult Function()? clearAll,
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
    required TResult Function(_Received value) received,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ClearAll value) clearAll,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Received value)? received,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ClearAll value)? clearAll,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Received value)? received,
    TResult Function(_Clear value)? clear,
    TResult Function(_ClearAll value)? clearAll,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NotificationsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ReceivedImplCopyWith<$Res> {
  factory _$$ReceivedImplCopyWith(
          _$ReceivedImpl value, $Res Function(_$ReceivedImpl) then) =
      __$$ReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({JobStatusUpdate jobStatusUpdate});

  $JobStatusUpdateCopyWith<$Res> get jobStatusUpdate;
}

/// @nodoc
class __$$ReceivedImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$ReceivedImpl>
    implements _$$ReceivedImplCopyWith<$Res> {
  __$$ReceivedImplCopyWithImpl(
      _$ReceivedImpl _value, $Res Function(_$ReceivedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobStatusUpdate = null,
  }) {
    return _then(_$ReceivedImpl(
      null == jobStatusUpdate
          ? _value.jobStatusUpdate
          : jobStatusUpdate // ignore: cast_nullable_to_non_nullable
              as JobStatusUpdate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $JobStatusUpdateCopyWith<$Res> get jobStatusUpdate {
    return $JobStatusUpdateCopyWith<$Res>(_value.jobStatusUpdate, (value) {
      return _then(_value.copyWith(jobStatusUpdate: value));
    });
  }
}

/// @nodoc

class _$ReceivedImpl implements _Received {
  const _$ReceivedImpl(this.jobStatusUpdate);

  @override
  final JobStatusUpdate jobStatusUpdate;

  @override
  String toString() {
    return 'NotificationsEvent.received(jobStatusUpdate: $jobStatusUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceivedImpl &&
            (identical(other.jobStatusUpdate, jobStatusUpdate) ||
                other.jobStatusUpdate == jobStatusUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobStatusUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceivedImplCopyWith<_$ReceivedImpl> get copyWith =>
      __$$ReceivedImplCopyWithImpl<_$ReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JobStatusUpdate jobStatusUpdate) received,
    required TResult Function(JobStatusUpdate jobStatusUpdate) clear,
    required TResult Function() clearAll,
  }) {
    return received(jobStatusUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult? Function()? clearAll,
  }) {
    return received?.call(jobStatusUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult Function()? clearAll,
    required TResult orElse(),
  }) {
    if (received != null) {
      return received(jobStatusUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Received value) received,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ClearAll value) clearAll,
  }) {
    return received(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Received value)? received,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ClearAll value)? clearAll,
  }) {
    return received?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Received value)? received,
    TResult Function(_Clear value)? clear,
    TResult Function(_ClearAll value)? clearAll,
    required TResult orElse(),
  }) {
    if (received != null) {
      return received(this);
    }
    return orElse();
  }
}

abstract class _Received implements NotificationsEvent {
  const factory _Received(final JobStatusUpdate jobStatusUpdate) =
      _$ReceivedImpl;

  JobStatusUpdate get jobStatusUpdate;
  @JsonKey(ignore: true)
  _$$ReceivedImplCopyWith<_$ReceivedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
          _$ClearImpl value, $Res Function(_$ClearImpl) then) =
      __$$ClearImplCopyWithImpl<$Res>;
  @useResult
  $Res call({JobStatusUpdate jobStatusUpdate});

  $JobStatusUpdateCopyWith<$Res> get jobStatusUpdate;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
      _$ClearImpl _value, $Res Function(_$ClearImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobStatusUpdate = null,
  }) {
    return _then(_$ClearImpl(
      null == jobStatusUpdate
          ? _value.jobStatusUpdate
          : jobStatusUpdate // ignore: cast_nullable_to_non_nullable
              as JobStatusUpdate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $JobStatusUpdateCopyWith<$Res> get jobStatusUpdate {
    return $JobStatusUpdateCopyWith<$Res>(_value.jobStatusUpdate, (value) {
      return _then(_value.copyWith(jobStatusUpdate: value));
    });
  }
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl(this.jobStatusUpdate);

  @override
  final JobStatusUpdate jobStatusUpdate;

  @override
  String toString() {
    return 'NotificationsEvent.clear(jobStatusUpdate: $jobStatusUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearImpl &&
            (identical(other.jobStatusUpdate, jobStatusUpdate) ||
                other.jobStatusUpdate == jobStatusUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobStatusUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearImplCopyWith<_$ClearImpl> get copyWith =>
      __$$ClearImplCopyWithImpl<_$ClearImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JobStatusUpdate jobStatusUpdate) received,
    required TResult Function(JobStatusUpdate jobStatusUpdate) clear,
    required TResult Function() clearAll,
  }) {
    return clear(jobStatusUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult? Function()? clearAll,
  }) {
    return clear?.call(jobStatusUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult Function()? clearAll,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(jobStatusUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Received value) received,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ClearAll value) clearAll,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Received value)? received,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ClearAll value)? clearAll,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Received value)? received,
    TResult Function(_Clear value)? clear,
    TResult Function(_ClearAll value)? clearAll,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements NotificationsEvent {
  const factory _Clear(final JobStatusUpdate jobStatusUpdate) = _$ClearImpl;

  JobStatusUpdate get jobStatusUpdate;
  @JsonKey(ignore: true)
  _$$ClearImplCopyWith<_$ClearImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearAllImplCopyWith<$Res> {
  factory _$$ClearAllImplCopyWith(
          _$ClearAllImpl value, $Res Function(_$ClearAllImpl) then) =
      __$$ClearAllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearAllImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$ClearAllImpl>
    implements _$$ClearAllImplCopyWith<$Res> {
  __$$ClearAllImplCopyWithImpl(
      _$ClearAllImpl _value, $Res Function(_$ClearAllImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearAllImpl implements _ClearAll {
  const _$ClearAllImpl();

  @override
  String toString() {
    return 'NotificationsEvent.clearAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearAllImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JobStatusUpdate jobStatusUpdate) received,
    required TResult Function(JobStatusUpdate jobStatusUpdate) clear,
    required TResult Function() clearAll,
  }) {
    return clearAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult? Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult? Function()? clearAll,
  }) {
    return clearAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JobStatusUpdate jobStatusUpdate)? received,
    TResult Function(JobStatusUpdate jobStatusUpdate)? clear,
    TResult Function()? clearAll,
    required TResult orElse(),
  }) {
    if (clearAll != null) {
      return clearAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Received value) received,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ClearAll value) clearAll,
  }) {
    return clearAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Received value)? received,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ClearAll value)? clearAll,
  }) {
    return clearAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Received value)? received,
    TResult Function(_Clear value)? clear,
    TResult Function(_ClearAll value)? clearAll,
    required TResult orElse(),
  }) {
    if (clearAll != null) {
      return clearAll(this);
    }
    return orElse();
  }
}

abstract class _ClearAll implements NotificationsEvent {
  const factory _ClearAll() = _$ClearAllImpl;
}

/// @nodoc
mixin _$NotificationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, JobStatusUpdate> jobStatusUpdates)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, JobStatusUpdate> jobStatusUpdates)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, JobStatusUpdate> jobStatusUpdates)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

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
    extends _$NotificationsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotificationsState.initial()';
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
    required TResult Function(Map<String, JobStatusUpdate> jobStatusUpdates)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, JobStatusUpdate> jobStatusUpdates)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, JobStatusUpdate> jobStatusUpdates)? loaded,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements NotificationsState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, JobStatusUpdate> jobStatusUpdates});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobStatusUpdates = null,
  }) {
    return _then(_$LoadedImpl(
      null == jobStatusUpdates
          ? _value._jobStatusUpdates
          : jobStatusUpdates // ignore: cast_nullable_to_non_nullable
              as Map<String, JobStatusUpdate>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(final Map<String, JobStatusUpdate> jobStatusUpdates)
      : _jobStatusUpdates = jobStatusUpdates;

  final Map<String, JobStatusUpdate> _jobStatusUpdates;
  @override
  Map<String, JobStatusUpdate> get jobStatusUpdates {
    if (_jobStatusUpdates is EqualUnmodifiableMapView) return _jobStatusUpdates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_jobStatusUpdates);
  }

  @override
  String toString() {
    return 'NotificationsState.loaded(jobStatusUpdates: $jobStatusUpdates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._jobStatusUpdates, _jobStatusUpdates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_jobStatusUpdates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, JobStatusUpdate> jobStatusUpdates)
        loaded,
  }) {
    return loaded(jobStatusUpdates);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, JobStatusUpdate> jobStatusUpdates)? loaded,
  }) {
    return loaded?.call(jobStatusUpdates);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, JobStatusUpdate> jobStatusUpdates)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(jobStatusUpdates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements NotificationsState {
  const factory Loaded(final Map<String, JobStatusUpdate> jobStatusUpdates) =
      _$LoadedImpl;

  Map<String, JobStatusUpdate> get jobStatusUpdates;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
