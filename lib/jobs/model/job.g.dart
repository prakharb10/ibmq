// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: json['id'] as String,
      hub: json['hub'] as String,
      group: json['group'] as String,
      project: json['project'] as String,
      backend: json['backend'] as String,
      status: $enumDecode(_$JobStatusEnumMap, json['status']),
      created: DateTime.parse(json['created'] as String),
      type: $enumDecode(_$JobTypeEnumMap, json['type']),
      tags: IList<String>.fromJson(json['tags'], (value) => value as String),
      name: json['name'] as String,
      runMode: Option<RunMode>.fromJson(
          json['runMode'], (value) => $enumDecode(_$RunModeEnumMap, value)),
      private: json['private'] as bool,
      endTime: Option<DateTime>.fromJson(
          json['endTime'], (value) => DateTime.parse(value as String)),
      estimatedRunningTimeSeconds: Option<double>.fromJson(
          json['estimated_running_time_seconds'],
          (value) => (value as num).toDouble()),
      estimatedMaxRunningTimeSeconds: Option<double>.fromJson(
          json['estimated_max_running_time_seconds'],
          (value) => (value as num).toDouble()),
      program: _$recordConvert(
        json['program'],
        ($jsonValue) => (id: $jsonValue['id'] as String,),
      ),
      runtime: json['runtime'] as String,
      sessionId: Option<String>.fromJson(
          json['sessionId'], (value) => value as String),
      state: _$recordConvert(
        json['state'],
        ($jsonValue) => (
          reason: $jsonValue['reason'] as String,
          status: $enumDecode(_$JobStatusEnumMap, $jsonValue['status']),
        ),
      ),
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'hub': instance.hub,
      'group': instance.group,
      'project': instance.project,
      'backend': instance.backend,
      'status': _$JobStatusEnumMap[instance.status]!,
      'created': instance.created.toIso8601String(),
      'type': _$JobTypeEnumMap[instance.type]!,
      'tags': instance.tags.toJson(
        (value) => value,
      ),
      'name': instance.name,
      'runMode': instance.runMode.toJson(
        (value) => _$RunModeEnumMap[value]!,
      ),
      'private': instance.private,
      'endTime': instance.endTime.toJson(
        (value) => value.toIso8601String(),
      ),
      'estimated_running_time_seconds':
          instance.estimatedRunningTimeSeconds.toJson(
        (value) => value,
      ),
      'estimated_max_running_time_seconds':
          instance.estimatedMaxRunningTimeSeconds.toJson(
        (value) => value,
      ),
      'program': {
        'id': instance.program.id,
      },
      'runtime': instance.runtime,
      'sessionId': instance.sessionId.toJson(
        (value) => value,
      ),
      'state': {
        'reason': instance.state.reason,
        'status': _$JobStatusEnumMap[instance.state.status]!,
      },
    };

const _$JobStatusEnumMap = {
  JobStatus.creating: 'CREATING',
  JobStatus.created: 'CREATED',
  JobStatus.transpiling: 'TRANSPILING',
  JobStatus.transpiled: 'TRANSPILED',
  JobStatus.validating: 'VALIDATING',
  JobStatus.validated: 'VALIDATED',
  JobStatus.running: 'RUNNING',
  JobStatus.Running: 'Running',
  JobStatus.completed: 'COMPLETED',
  JobStatus.Completed: 'Completed',
  JobStatus.pendingInQueue: 'PENDING_IN_QUEUE',
  JobStatus.queued: 'QUEUED',
  JobStatus.Queued: 'Queued',
  JobStatus.cancelled: 'CANCELLED',
  JobStatus.Cancelled: 'Cancelled',
  JobStatus.cancelledRanTooLong: 'CANCELLED - RAN TOO LONG',
  JobStatus.failed: 'FAILED',
  JobStatus.Failed: 'Failed',
  JobStatus.errorCreatingJob: 'ERROR_CREATING_JOB',
  JobStatus.errorValidatingJob: 'ERROR_VALIDATING_JOB',
  JobStatus.errorTranspilingJob: 'ERROR_TRANSPILING_JOB',
  JobStatus.errorRunningJob: 'ERROR_RUNNING_JOB',
};

const _$JobTypeEnumMap = {
  JobType.iqx: 'IQX',
  JobType.runtime: 'RUNTIME',
};

const _$RunModeEnumMap = {
  RunMode.fairshare: 'fairshare',
  RunMode.dedicated: 'dedicated',
  RunMode.priority: 'priority',
  RunMode.session: 'session',
};

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
