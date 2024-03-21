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
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      runMode: Option<RunMode>.fromJson(
          json['run_mode'], (value) => $enumDecode(_$RunModeEnumMap, value)),
      private: json['private'] as bool,
      endTime: Option<DateTime>.fromJson(
          json['end_time'], (value) => DateTime.parse(value as String)),
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
          json['session_id'], (value) => value as String),
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
      'tags': instance.tags,
      'name': instance.name,
      'run_mode': instance.runMode.toJson(
        (value) => _$RunModeEnumMap[value]!,
      ),
      'private': instance.private,
      'end_time': instance.endTime.toJson(
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
      'session_id': instance.sessionId.toJson(
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
  JobStatus.RUNNING: 'Running',
  JobStatus.completed: 'COMPLETED',
  JobStatus.COMPLETED: 'Completed',
  JobStatus.pendingInQueue: 'PENDING_IN_QUEUE',
  JobStatus.queued: 'QUEUED',
  JobStatus.QUEUED: 'Queued',
  JobStatus.cancelled: 'CANCELLED',
  JobStatus.CANCELLED: 'Cancelled',
  JobStatus.cancelledRanTooLong: 'CANCELLED - RAN TOO LONG',
  JobStatus.failed: 'FAILED',
  JobStatus.FAILED: 'Failed',
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
