// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'runtime_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RuntimeJob _$RuntimeJobFromJson(Map<String, dynamic> json) {
  return _RuntimeJob.fromJson(json);
}

/// @nodoc
mixin _$RuntimeJob {
  /// Identifier of the job.
  String get id => throw _privateConstructorUsedError;

  /// Name of hub where the job was executed.
  String get hub => throw _privateConstructorUsedError;

  /// Name of group where the job was executed.
  String get group => throw _privateConstructorUsedError;

  /// Name of project where the job was executed.
  String get project => throw _privateConstructorUsedError;

  /// The backend where the job was executed.
  String get backend => throw _privateConstructorUsedError;

  /// The job state.
  ({String reason, RuntimeJobStatus status}) get state =>
      throw _privateConstructorUsedError;

  /// The job status.
  ///
  /// See [RuntimeJobStatus] for possible values.
  RuntimeJobStatus get status =>
      throw _privateConstructorUsedError; // TODO: Add PUBs field
  /// Parameters of the job.
  ({Option<List<Map<dynamic, dynamic>>> circuits, Option<int> shots})
      get params => throw _privateConstructorUsedError;

  /// Program associated with the job.
  ({String id}) get program => throw _privateConstructorUsedError;

  /// Timestamp of when the job was created.
  DateTime get created => throw _privateConstructorUsedError;

  /// Timestamp of when the job ended.
  Option<DateTime> get ended => throw _privateConstructorUsedError;

  /// Name and tag of image used to run the job.
  String get runtime => throw _privateConstructorUsedError;

  /// Cost of the job.
  Option<int> get cost => throw _privateConstructorUsedError;

  /// List of tags associated with the job.
  Option<IList<String>> get tags => throw _privateConstructorUsedError;

  /// Identifier of the session where the job was executed.
  Option<String> get sessionId => throw _privateConstructorUsedError;

  /// Usage in seconds of the job.
  ({double seconds})? get usage => throw _privateConstructorUsedError;

  /// estimated running time of the job in seconds
  Option<double> get estimatedRunningTimeSeconds =>
      throw _privateConstructorUsedError;

  /// estimated max running time of the job in seconds
  Option<double> get estimatedMaxRunningTimeSeconds =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RuntimeJobCopyWith<RuntimeJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuntimeJobCopyWith<$Res> {
  factory $RuntimeJobCopyWith(
          RuntimeJob value, $Res Function(RuntimeJob) then) =
      _$RuntimeJobCopyWithImpl<$Res, RuntimeJob>;
  @useResult
  $Res call(
      {String id,
      String hub,
      String group,
      String project,
      String backend,
      ({String reason, RuntimeJobStatus status}) state,
      RuntimeJobStatus status,
      ({
        Option<List<Map<dynamic, dynamic>>> circuits,
        Option<int> shots
      }) params,
      ({String id}) program,
      DateTime created,
      Option<DateTime> ended,
      String runtime,
      Option<int> cost,
      Option<IList<String>> tags,
      Option<String> sessionId,
      ({double seconds})? usage,
      Option<double> estimatedRunningTimeSeconds,
      Option<double> estimatedMaxRunningTimeSeconds});
}

/// @nodoc
class _$RuntimeJobCopyWithImpl<$Res, $Val extends RuntimeJob>
    implements $RuntimeJobCopyWith<$Res> {
  _$RuntimeJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hub = null,
    Object? group = null,
    Object? project = null,
    Object? backend = null,
    Object? state = null,
    Object? status = null,
    Object? params = null,
    Object? program = null,
    Object? created = null,
    Object? ended = null,
    Object? runtime = null,
    Object? cost = null,
    Object? tags = null,
    Object? sessionId = null,
    Object? usage = freezed,
    Object? estimatedRunningTimeSeconds = null,
    Object? estimatedMaxRunningTimeSeconds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hub: null == hub
          ? _value.hub
          : hub // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ({String reason, RuntimeJobStatus status}),
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RuntimeJobStatus,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as ({
              Option<List<Map<dynamic, dynamic>>> circuits,
              Option<int> shots
            }),
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as ({String id}),
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ended: null == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Option<IList<String>>,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as ({double seconds})?,
      estimatedRunningTimeSeconds: null == estimatedRunningTimeSeconds
          ? _value.estimatedRunningTimeSeconds
          : estimatedRunningTimeSeconds // ignore: cast_nullable_to_non_nullable
              as Option<double>,
      estimatedMaxRunningTimeSeconds: null == estimatedMaxRunningTimeSeconds
          ? _value.estimatedMaxRunningTimeSeconds
          : estimatedMaxRunningTimeSeconds // ignore: cast_nullable_to_non_nullable
              as Option<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RuntimeJobImplCopyWith<$Res>
    implements $RuntimeJobCopyWith<$Res> {
  factory _$$RuntimeJobImplCopyWith(
          _$RuntimeJobImpl value, $Res Function(_$RuntimeJobImpl) then) =
      __$$RuntimeJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String hub,
      String group,
      String project,
      String backend,
      ({String reason, RuntimeJobStatus status}) state,
      RuntimeJobStatus status,
      ({
        Option<List<Map<dynamic, dynamic>>> circuits,
        Option<int> shots
      }) params,
      ({String id}) program,
      DateTime created,
      Option<DateTime> ended,
      String runtime,
      Option<int> cost,
      Option<IList<String>> tags,
      Option<String> sessionId,
      ({double seconds})? usage,
      Option<double> estimatedRunningTimeSeconds,
      Option<double> estimatedMaxRunningTimeSeconds});
}

/// @nodoc
class __$$RuntimeJobImplCopyWithImpl<$Res>
    extends _$RuntimeJobCopyWithImpl<$Res, _$RuntimeJobImpl>
    implements _$$RuntimeJobImplCopyWith<$Res> {
  __$$RuntimeJobImplCopyWithImpl(
      _$RuntimeJobImpl _value, $Res Function(_$RuntimeJobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hub = null,
    Object? group = null,
    Object? project = null,
    Object? backend = null,
    Object? state = null,
    Object? status = null,
    Object? params = null,
    Object? program = null,
    Object? created = null,
    Object? ended = null,
    Object? runtime = null,
    Object? cost = null,
    Object? tags = null,
    Object? sessionId = null,
    Object? usage = freezed,
    Object? estimatedRunningTimeSeconds = null,
    Object? estimatedMaxRunningTimeSeconds = null,
  }) {
    return _then(_$RuntimeJobImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hub: null == hub
          ? _value.hub
          : hub // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ({String reason, RuntimeJobStatus status}),
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RuntimeJobStatus,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as ({
              Option<List<Map<dynamic, dynamic>>> circuits,
              Option<int> shots
            }),
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as ({String id}),
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ended: null == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Option<IList<String>>,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as ({double seconds})?,
      estimatedRunningTimeSeconds: null == estimatedRunningTimeSeconds
          ? _value.estimatedRunningTimeSeconds
          : estimatedRunningTimeSeconds // ignore: cast_nullable_to_non_nullable
              as Option<double>,
      estimatedMaxRunningTimeSeconds: null == estimatedMaxRunningTimeSeconds
          ? _value.estimatedMaxRunningTimeSeconds
          : estimatedMaxRunningTimeSeconds // ignore: cast_nullable_to_non_nullable
              as Option<double>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RuntimeJobImpl extends _RuntimeJob {
  _$RuntimeJobImpl(
      {required this.id,
      required this.hub,
      required this.group,
      required this.project,
      required this.backend,
      required this.state,
      required this.status,
      required this.params,
      required this.program,
      required this.created,
      required this.ended,
      required this.runtime,
      required this.cost,
      required this.tags,
      required this.sessionId,
      required this.usage,
      required this.estimatedRunningTimeSeconds,
      required this.estimatedMaxRunningTimeSeconds})
      : super._();

  factory _$RuntimeJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuntimeJobImplFromJson(json);

  /// Identifier of the job.
  @override
  final String id;

  /// Name of hub where the job was executed.
  @override
  final String hub;

  /// Name of group where the job was executed.
  @override
  final String group;

  /// Name of project where the job was executed.
  @override
  final String project;

  /// The backend where the job was executed.
  @override
  final String backend;

  /// The job state.
  @override
  final ({String reason, RuntimeJobStatus status}) state;

  /// The job status.
  ///
  /// See [RuntimeJobStatus] for possible values.
  @override
  final RuntimeJobStatus status;
// TODO: Add PUBs field
  /// Parameters of the job.
  @override
  final ({
    Option<List<Map<dynamic, dynamic>>> circuits,
    Option<int> shots
  }) params;

  /// Program associated with the job.
  @override
  final ({String id}) program;

  /// Timestamp of when the job was created.
  @override
  final DateTime created;

  /// Timestamp of when the job ended.
  @override
  final Option<DateTime> ended;

  /// Name and tag of image used to run the job.
  @override
  final String runtime;

  /// Cost of the job.
  @override
  final Option<int> cost;

  /// List of tags associated with the job.
  @override
  final Option<IList<String>> tags;

  /// Identifier of the session where the job was executed.
  @override
  final Option<String> sessionId;

  /// Usage in seconds of the job.
  @override
  final ({double seconds})? usage;

  /// estimated running time of the job in seconds
  @override
  final Option<double> estimatedRunningTimeSeconds;

  /// estimated max running time of the job in seconds
  @override
  final Option<double> estimatedMaxRunningTimeSeconds;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RuntimeJobImplCopyWith<_$RuntimeJobImpl> get copyWith =>
      __$$RuntimeJobImplCopyWithImpl<_$RuntimeJobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuntimeJobImplToJson(
      this,
    );
  }
}

abstract class _RuntimeJob extends RuntimeJob {
  factory _RuntimeJob(
          {required final String id,
          required final String hub,
          required final String group,
          required final String project,
          required final String backend,
          required final ({String reason, RuntimeJobStatus status}) state,
          required final RuntimeJobStatus status,
          required final ({
            Option<List<Map<dynamic, dynamic>>> circuits,
            Option<int> shots
          }) params,
          required final ({String id}) program,
          required final DateTime created,
          required final Option<DateTime> ended,
          required final String runtime,
          required final Option<int> cost,
          required final Option<IList<String>> tags,
          required final Option<String> sessionId,
          required final ({double seconds})? usage,
          required final Option<double> estimatedRunningTimeSeconds,
          required final Option<double> estimatedMaxRunningTimeSeconds}) =
      _$RuntimeJobImpl;
  _RuntimeJob._() : super._();

  factory _RuntimeJob.fromJson(Map<String, dynamic> json) =
      _$RuntimeJobImpl.fromJson;

  @override

  /// Identifier of the job.
  String get id;
  @override

  /// Name of hub where the job was executed.
  String get hub;
  @override

  /// Name of group where the job was executed.
  String get group;
  @override

  /// Name of project where the job was executed.
  String get project;
  @override

  /// The backend where the job was executed.
  String get backend;
  @override

  /// The job state.
  ({String reason, RuntimeJobStatus status}) get state;
  @override

  /// The job status.
  ///
  /// See [RuntimeJobStatus] for possible values.
  RuntimeJobStatus get status;
  @override // TODO: Add PUBs field
  /// Parameters of the job.
  ({Option<List<Map<dynamic, dynamic>>> circuits, Option<int> shots})
      get params;
  @override

  /// Program associated with the job.
  ({String id}) get program;
  @override

  /// Timestamp of when the job was created.
  DateTime get created;
  @override

  /// Timestamp of when the job ended.
  Option<DateTime> get ended;
  @override

  /// Name and tag of image used to run the job.
  String get runtime;
  @override

  /// Cost of the job.
  Option<int> get cost;
  @override

  /// List of tags associated with the job.
  Option<IList<String>> get tags;
  @override

  /// Identifier of the session where the job was executed.
  Option<String> get sessionId;
  @override

  /// Usage in seconds of the job.
  ({double seconds})? get usage;
  @override

  /// estimated running time of the job in seconds
  Option<double> get estimatedRunningTimeSeconds;
  @override

  /// estimated max running time of the job in seconds
  Option<double> get estimatedMaxRunningTimeSeconds;
  @override
  @JsonKey(ignore: true)
  _$$RuntimeJobImplCopyWith<_$RuntimeJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
