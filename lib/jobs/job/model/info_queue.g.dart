// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoQueue _$InfoQueueFromJson(Map<String, dynamic> json) => InfoQueue(
      status: $enumDecode(_$JobStatusEnumMap, json['status']),
      position: json['position'] as int,
      providerPosition: json['providerPosition'] as int,
      hubPriority: json['hubPriority'] as int,
      groupPriority: json['groupPriority'] as int,
      projectPriority: json['projectPriority'] as int,
      estimatedStartTime: DateTime.parse(json['estimatedStartTime'] as String),
      estimatedCompleteTime:
          DateTime.parse(json['estimatedCompleteTime'] as String),
    );

Map<String, dynamic> _$InfoQueueToJson(InfoQueue instance) => <String, dynamic>{
      'status': _$JobStatusEnumMap[instance.status]!,
      'position': instance.position,
      'providerPosition': instance.providerPosition,
      'hubPriority': instance.hubPriority,
      'groupPriority': instance.groupPriority,
      'projectPriority': instance.projectPriority,
      'estimatedStartTime': instance.estimatedStartTime.toIso8601String(),
      'estimatedCompleteTime': instance.estimatedCompleteTime.toIso8601String(),
    };

const _$JobStatusEnumMap = {
  JobStatus.creating: 'CREATING',
  JobStatus.created: 'CREATED',
  JobStatus.transpiling: 'TRANSPILING',
  JobStatus.transpiled: 'TRANSPILED',
  JobStatus.validating: 'VALIDATING',
  JobStatus.validated: 'VALIDATED',
  JobStatus.running: 'RUNNING',
  JobStatus.completed: 'COMPLETED',
  JobStatus.pendingInQueue: 'PENDING_IN_QUEUE',
  JobStatus.queued: 'QUEUED',
  JobStatus.cancelled: 'CANCELLED',
  JobStatus.cancelledRanTooLong: 'CANCELLED - RAN TOO LONG',
  JobStatus.failed: 'FAILED',
  JobStatus.errorCreatingJob: 'ERROR_CREATING_JOB',
  JobStatus.errorValidatingJob: 'ERROR_VALIDATING_JOB',
  JobStatus.errorTranspilingJob: 'ERROR_TRANSPILING_JOB',
  JobStatus.errorRunningJob: 'ERROR_RUNNING_JOB',
};
