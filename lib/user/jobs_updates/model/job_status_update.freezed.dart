// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_status_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobStatusUpdate _$JobStatusUpdateFromJson(Map<String, dynamic> json) {
  return _JobStatusUpdate.fromJson(json);
}

/// @nodoc
mixin _$JobStatusUpdate {
  String get id => throw _privateConstructorUsedError;
  JobStatus get status => throw _privateConstructorUsedError;
  String get backend => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobStatusUpdateCopyWith<JobStatusUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobStatusUpdateCopyWith<$Res> {
  factory $JobStatusUpdateCopyWith(
          JobStatusUpdate value, $Res Function(JobStatusUpdate) then) =
      _$JobStatusUpdateCopyWithImpl<$Res, JobStatusUpdate>;
  @useResult
  $Res call({String id, JobStatus status, String backend, DateTime timestamp});
}

/// @nodoc
class _$JobStatusUpdateCopyWithImpl<$Res, $Val extends JobStatusUpdate>
    implements $JobStatusUpdateCopyWith<$Res> {
  _$JobStatusUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? backend = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JobStatus,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobStatusUpdateImplCopyWith<$Res>
    implements $JobStatusUpdateCopyWith<$Res> {
  factory _$$JobStatusUpdateImplCopyWith(_$JobStatusUpdateImpl value,
          $Res Function(_$JobStatusUpdateImpl) then) =
      __$$JobStatusUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, JobStatus status, String backend, DateTime timestamp});
}

/// @nodoc
class __$$JobStatusUpdateImplCopyWithImpl<$Res>
    extends _$JobStatusUpdateCopyWithImpl<$Res, _$JobStatusUpdateImpl>
    implements _$$JobStatusUpdateImplCopyWith<$Res> {
  __$$JobStatusUpdateImplCopyWithImpl(
      _$JobStatusUpdateImpl _value, $Res Function(_$JobStatusUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? backend = null,
    Object? timestamp = null,
  }) {
    return _then(_$JobStatusUpdateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JobStatus,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobStatusUpdateImpl implements _JobStatusUpdate {
  _$JobStatusUpdateImpl(
      {required this.id,
      required this.status,
      required this.backend,
      required this.timestamp});

  factory _$JobStatusUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobStatusUpdateImplFromJson(json);

  @override
  final String id;
  @override
  final JobStatus status;
  @override
  final String backend;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'JobStatusUpdate(id: $id, status: $status, backend: $backend, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobStatusUpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.backend, backend) || other.backend == backend) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, backend, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobStatusUpdateImplCopyWith<_$JobStatusUpdateImpl> get copyWith =>
      __$$JobStatusUpdateImplCopyWithImpl<_$JobStatusUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobStatusUpdateImplToJson(
      this,
    );
  }
}

abstract class _JobStatusUpdate implements JobStatusUpdate {
  factory _JobStatusUpdate(
      {required final String id,
      required final JobStatus status,
      required final String backend,
      required final DateTime timestamp}) = _$JobStatusUpdateImpl;

  factory _JobStatusUpdate.fromJson(Map<String, dynamic> json) =
      _$JobStatusUpdateImpl.fromJson;

  @override
  String get id;
  @override
  JobStatus get status;
  @override
  String get backend;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$JobStatusUpdateImplCopyWith<_$JobStatusUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
