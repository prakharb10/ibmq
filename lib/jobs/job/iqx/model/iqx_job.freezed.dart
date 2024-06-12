// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iqx_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IQXJob _$IQXJobFromJson(Map<String, dynamic> json) {
  return _IQXJob.fromJson(json);
}

/// @nodoc
mixin _$IQXJob {
  /// The job kind
  String get kind => throw _privateConstructorUsedError;

  /// The job backend
  ({String id, String name}) get backend => throw _privateConstructorUsedError;

  /// The job status
  ///
  /// See [JobStatus] for possible values
  JobStatus get status => throw _privateConstructorUsedError;

  /// The job creation date
  DateTime get creationDate => throw _privateConstructorUsedError;

  /// Whether the job has been deleted
  bool get deleted => throw _privateConstructorUsedError;

  /// The job data summary
  ///
  /// See [SummaryData] for more information
  SummaryData get summaryData => throw _privateConstructorUsedError;

  /// The job time per step
  ///
  /// See [TimePerStep] for more information
  TimePerStep get timePerStep => throw _privateConstructorUsedError;

  /// Hub Information
  ///
  /// Contains the hub/group/project information
  ({({String name}) group, ({String name}) hub, ({String name}) project})
      get hubInfo => throw _privateConstructorUsedError;

  /// The job end date
  Option<DateTime> get endDate => throw _privateConstructorUsedError;

  /// List of tags associated with the job.
  Option<IList<String>> get tags => throw _privateConstructorUsedError;

  /// The job run mode
  Option<RunMode> get runMode => throw _privateConstructorUsedError;

  /// The job id
  String get id => throw _privateConstructorUsedError;

  /// The user id
  String get userId => throw _privateConstructorUsedError;

  /// The job was created locally or remotely
  String get createdBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IQXJobCopyWith<IQXJob> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IQXJobCopyWith<$Res> {
  factory $IQXJobCopyWith(IQXJob value, $Res Function(IQXJob) then) =
      _$IQXJobCopyWithImpl<$Res, IQXJob>;
  @useResult
  $Res call(
      {String kind,
      ({String id, String name}) backend,
      JobStatus status,
      DateTime creationDate,
      bool deleted,
      SummaryData summaryData,
      TimePerStep timePerStep,
      ({
        ({String name}) group,
        ({String name}) hub,
        ({String name}) project
      }) hubInfo,
      Option<DateTime> endDate,
      Option<IList<String>> tags,
      Option<RunMode> runMode,
      String id,
      String userId,
      String createdBy});

  $TimePerStepCopyWith<$Res> get timePerStep;
}

/// @nodoc
class _$IQXJobCopyWithImpl<$Res, $Val extends IQXJob>
    implements $IQXJobCopyWith<$Res> {
  _$IQXJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? backend = null,
    Object? status = null,
    Object? creationDate = null,
    Object? deleted = null,
    Object? summaryData = null,
    Object? timePerStep = null,
    Object? hubInfo = null,
    Object? endDate = null,
    Object? tags = null,
    Object? runMode = null,
    Object? id = null,
    Object? userId = null,
    Object? createdBy = null,
  }) {
    return _then(_value.copyWith(
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as ({String id, String name}),
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JobStatus,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      summaryData: null == summaryData
          ? _value.summaryData
          : summaryData // ignore: cast_nullable_to_non_nullable
              as SummaryData,
      timePerStep: null == timePerStep
          ? _value.timePerStep
          : timePerStep // ignore: cast_nullable_to_non_nullable
              as TimePerStep,
      hubInfo: null == hubInfo
          ? _value.hubInfo
          : hubInfo // ignore: cast_nullable_to_non_nullable
              as ({
              ({String name}) group,
              ({String name}) hub,
              ({String name}) project
            }),
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Option<IList<String>>,
      runMode: null == runMode
          ? _value.runMode
          : runMode // ignore: cast_nullable_to_non_nullable
              as Option<RunMode>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimePerStepCopyWith<$Res> get timePerStep {
    return $TimePerStepCopyWith<$Res>(_value.timePerStep, (value) {
      return _then(_value.copyWith(timePerStep: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IQXJobImplCopyWith<$Res> implements $IQXJobCopyWith<$Res> {
  factory _$$IQXJobImplCopyWith(
          _$IQXJobImpl value, $Res Function(_$IQXJobImpl) then) =
      __$$IQXJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String kind,
      ({String id, String name}) backend,
      JobStatus status,
      DateTime creationDate,
      bool deleted,
      SummaryData summaryData,
      TimePerStep timePerStep,
      ({
        ({String name}) group,
        ({String name}) hub,
        ({String name}) project
      }) hubInfo,
      Option<DateTime> endDate,
      Option<IList<String>> tags,
      Option<RunMode> runMode,
      String id,
      String userId,
      String createdBy});

  @override
  $TimePerStepCopyWith<$Res> get timePerStep;
}

/// @nodoc
class __$$IQXJobImplCopyWithImpl<$Res>
    extends _$IQXJobCopyWithImpl<$Res, _$IQXJobImpl>
    implements _$$IQXJobImplCopyWith<$Res> {
  __$$IQXJobImplCopyWithImpl(
      _$IQXJobImpl _value, $Res Function(_$IQXJobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? backend = null,
    Object? status = null,
    Object? creationDate = null,
    Object? deleted = null,
    Object? summaryData = null,
    Object? timePerStep = null,
    Object? hubInfo = null,
    Object? endDate = null,
    Object? tags = null,
    Object? runMode = null,
    Object? id = null,
    Object? userId = null,
    Object? createdBy = null,
  }) {
    return _then(_$IQXJobImpl(
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as ({String id, String name}),
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JobStatus,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      summaryData: null == summaryData
          ? _value.summaryData
          : summaryData // ignore: cast_nullable_to_non_nullable
              as SummaryData,
      timePerStep: null == timePerStep
          ? _value.timePerStep
          : timePerStep // ignore: cast_nullable_to_non_nullable
              as TimePerStep,
      hubInfo: null == hubInfo
          ? _value.hubInfo
          : hubInfo // ignore: cast_nullable_to_non_nullable
              as ({
              ({String name}) group,
              ({String name}) hub,
              ({String name}) project
            }),
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Option<IList<String>>,
      runMode: null == runMode
          ? _value.runMode
          : runMode // ignore: cast_nullable_to_non_nullable
              as Option<RunMode>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$IQXJobImpl extends _IQXJob {
  const _$IQXJobImpl(
      {required this.kind,
      required this.backend,
      required this.status,
      required this.creationDate,
      required this.deleted,
      required this.summaryData,
      required this.timePerStep,
      required this.hubInfo,
      required this.endDate,
      required this.tags,
      required this.runMode,
      required this.id,
      required this.userId,
      required this.createdBy})
      : super._();

  factory _$IQXJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$IQXJobImplFromJson(json);

  /// The job kind
  @override
  final String kind;

  /// The job backend
  @override
  final ({String id, String name}) backend;

  /// The job status
  ///
  /// See [JobStatus] for possible values
  @override
  final JobStatus status;

  /// The job creation date
  @override
  final DateTime creationDate;

  /// Whether the job has been deleted
  @override
  final bool deleted;

  /// The job data summary
  ///
  /// See [SummaryData] for more information
  @override
  final SummaryData summaryData;

  /// The job time per step
  ///
  /// See [TimePerStep] for more information
  @override
  final TimePerStep timePerStep;

  /// Hub Information
  ///
  /// Contains the hub/group/project information
  @override
  final ({
    ({String name}) group,
    ({String name}) hub,
    ({String name}) project
  }) hubInfo;

  /// The job end date
  @override
  final Option<DateTime> endDate;

  /// List of tags associated with the job.
  @override
  final Option<IList<String>> tags;

  /// The job run mode
  @override
  final Option<RunMode> runMode;

  /// The job id
  @override
  final String id;

  /// The user id
  @override
  final String userId;

  /// The job was created locally or remotely
  @override
  final String createdBy;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IQXJobImplCopyWith<_$IQXJobImpl> get copyWith =>
      __$$IQXJobImplCopyWithImpl<_$IQXJobImpl>(this, _$identity);
}

abstract class _IQXJob extends IQXJob {
  const factory _IQXJob(
      {required final String kind,
      required final ({String id, String name}) backend,
      required final JobStatus status,
      required final DateTime creationDate,
      required final bool deleted,
      required final SummaryData summaryData,
      required final TimePerStep timePerStep,
      required final ({
        ({String name}) group,
        ({String name}) hub,
        ({String name}) project
      }) hubInfo,
      required final Option<DateTime> endDate,
      required final Option<IList<String>> tags,
      required final Option<RunMode> runMode,
      required final String id,
      required final String userId,
      required final String createdBy}) = _$IQXJobImpl;
  const _IQXJob._() : super._();

  factory _IQXJob.fromJson(Map<String, dynamic> json) = _$IQXJobImpl.fromJson;

  @override

  /// The job kind
  String get kind;
  @override

  /// The job backend
  ({String id, String name}) get backend;
  @override

  /// The job status
  ///
  /// See [JobStatus] for possible values
  JobStatus get status;
  @override

  /// The job creation date
  DateTime get creationDate;
  @override

  /// Whether the job has been deleted
  bool get deleted;
  @override

  /// The job data summary
  ///
  /// See [SummaryData] for more information
  SummaryData get summaryData;
  @override

  /// The job time per step
  ///
  /// See [TimePerStep] for more information
  TimePerStep get timePerStep;
  @override

  /// Hub Information
  ///
  /// Contains the hub/group/project information
  ({({String name}) group, ({String name}) hub, ({String name}) project})
      get hubInfo;
  @override

  /// The job end date
  Option<DateTime> get endDate;
  @override

  /// List of tags associated with the job.
  Option<IList<String>> get tags;
  @override

  /// The job run mode
  Option<RunMode> get runMode;
  @override

  /// The job id
  String get id;
  @override

  /// The user id
  String get userId;
  @override

  /// The job was created locally or remotely
  String get createdBy;
  @override
  @JsonKey(ignore: true)
  _$$IQXJobImplCopyWith<_$IQXJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimePerStep _$TimePerStepFromJson(Map<String, dynamic> json) {
  return _TimePerStep.fromJson(json);
}

/// @nodoc
mixin _$TimePerStep {
  DateTime get creating => throw _privateConstructorUsedError;
  Option<DateTime> get created => throw _privateConstructorUsedError;
  Option<DateTime> get transpiling => throw _privateConstructorUsedError;
  Option<DateTime> get transpiled => throw _privateConstructorUsedError;
  Option<DateTime> get validating => throw _privateConstructorUsedError;
  Option<DateTime> get validated => throw _privateConstructorUsedError;
  Option<DateTime> get queued => throw _privateConstructorUsedError;
  Option<DateTime> get running => throw _privateConstructorUsedError;
  Option<DateTime> get completed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimePerStepCopyWith<TimePerStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimePerStepCopyWith<$Res> {
  factory $TimePerStepCopyWith(
          TimePerStep value, $Res Function(TimePerStep) then) =
      _$TimePerStepCopyWithImpl<$Res, TimePerStep>;
  @useResult
  $Res call(
      {DateTime creating,
      Option<DateTime> created,
      Option<DateTime> transpiling,
      Option<DateTime> transpiled,
      Option<DateTime> validating,
      Option<DateTime> validated,
      Option<DateTime> queued,
      Option<DateTime> running,
      Option<DateTime> completed});
}

/// @nodoc
class _$TimePerStepCopyWithImpl<$Res, $Val extends TimePerStep>
    implements $TimePerStepCopyWith<$Res> {
  _$TimePerStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creating = null,
    Object? created = null,
    Object? transpiling = null,
    Object? transpiled = null,
    Object? validating = null,
    Object? validated = null,
    Object? queued = null,
    Object? running = null,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      creating: null == creating
          ? _value.creating
          : creating // ignore: cast_nullable_to_non_nullable
              as DateTime,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      transpiling: null == transpiling
          ? _value.transpiling
          : transpiling // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      transpiled: null == transpiled
          ? _value.transpiled
          : transpiled // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      validating: null == validating
          ? _value.validating
          : validating // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      validated: null == validated
          ? _value.validated
          : validated // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      queued: null == queued
          ? _value.queued
          : queued // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      running: null == running
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimePerStepImplCopyWith<$Res>
    implements $TimePerStepCopyWith<$Res> {
  factory _$$TimePerStepImplCopyWith(
          _$TimePerStepImpl value, $Res Function(_$TimePerStepImpl) then) =
      __$$TimePerStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime creating,
      Option<DateTime> created,
      Option<DateTime> transpiling,
      Option<DateTime> transpiled,
      Option<DateTime> validating,
      Option<DateTime> validated,
      Option<DateTime> queued,
      Option<DateTime> running,
      Option<DateTime> completed});
}

/// @nodoc
class __$$TimePerStepImplCopyWithImpl<$Res>
    extends _$TimePerStepCopyWithImpl<$Res, _$TimePerStepImpl>
    implements _$$TimePerStepImplCopyWith<$Res> {
  __$$TimePerStepImplCopyWithImpl(
      _$TimePerStepImpl _value, $Res Function(_$TimePerStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creating = null,
    Object? created = null,
    Object? transpiling = null,
    Object? transpiled = null,
    Object? validating = null,
    Object? validated = null,
    Object? queued = null,
    Object? running = null,
    Object? completed = null,
  }) {
    return _then(_$TimePerStepImpl(
      creating: null == creating
          ? _value.creating
          : creating // ignore: cast_nullable_to_non_nullable
              as DateTime,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      transpiling: null == transpiling
          ? _value.transpiling
          : transpiling // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      transpiled: null == transpiled
          ? _value.transpiled
          : transpiled // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      validating: null == validating
          ? _value.validating
          : validating // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      validated: null == validated
          ? _value.validated
          : validated // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      queued: null == queued
          ? _value.queued
          : queued // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      running: null == running
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as Option<DateTime>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.screamingSnake, createToJson: false)
class _$TimePerStepImpl extends _TimePerStep {
  const _$TimePerStepImpl(
      {required this.creating,
      required this.created,
      required this.transpiling,
      required this.transpiled,
      required this.validating,
      required this.validated,
      required this.queued,
      required this.running,
      required this.completed})
      : super._();

  factory _$TimePerStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimePerStepImplFromJson(json);

  @override
  final DateTime creating;
  @override
  final Option<DateTime> created;
  @override
  final Option<DateTime> transpiling;
  @override
  final Option<DateTime> transpiled;
  @override
  final Option<DateTime> validating;
  @override
  final Option<DateTime> validated;
  @override
  final Option<DateTime> queued;
  @override
  final Option<DateTime> running;
  @override
  final Option<DateTime> completed;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimePerStepImplCopyWith<_$TimePerStepImpl> get copyWith =>
      __$$TimePerStepImplCopyWithImpl<_$TimePerStepImpl>(this, _$identity);
}

abstract class _TimePerStep extends TimePerStep {
  const factory _TimePerStep(
      {required final DateTime creating,
      required final Option<DateTime> created,
      required final Option<DateTime> transpiling,
      required final Option<DateTime> transpiled,
      required final Option<DateTime> validating,
      required final Option<DateTime> validated,
      required final Option<DateTime> queued,
      required final Option<DateTime> running,
      required final Option<DateTime> completed}) = _$TimePerStepImpl;
  const _TimePerStep._() : super._();

  factory _TimePerStep.fromJson(Map<String, dynamic> json) =
      _$TimePerStepImpl.fromJson;

  @override
  DateTime get creating;
  @override
  Option<DateTime> get created;
  @override
  Option<DateTime> get transpiling;
  @override
  Option<DateTime> get transpiled;
  @override
  Option<DateTime> get validating;
  @override
  Option<DateTime> get validated;
  @override
  Option<DateTime> get queued;
  @override
  Option<DateTime> get running;
  @override
  Option<DateTime> get completed;
  @override
  @JsonKey(ignore: true)
  _$$TimePerStepImplCopyWith<_$TimePerStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
