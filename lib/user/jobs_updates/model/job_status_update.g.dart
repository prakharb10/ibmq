// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_status_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobStatusUpdateImpl _$$JobStatusUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$JobStatusUpdateImpl(
      id: json['id'] as String,
      status: $enumDecode(_$JobStatusEnumMap, json['status']),
      backend: json['backend'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$JobStatusUpdateImplToJson(
        _$JobStatusUpdateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$JobStatusEnumMap[instance.status]!,
      'backend': instance.backend,
      'timestamp': instance.timestamp.toIso8601String(),
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
