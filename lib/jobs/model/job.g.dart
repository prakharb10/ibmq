// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: json['id'] as String,
      backend: JobBackend.fromJson(json['backend'] as Map<String, dynamic>),
      status: $enumDecode(_$JobStatusEnumMap, json['status']),
      creationDate: DateTime.parse(json['creationDate'] as String),
      name: json['name'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      liveDataEnabled: json['liveDataEnabled'] as bool,
      provider: Provider.fromJson(json['provider'] as Map<String, dynamic>),
      runMode: json['runMode'] as String,
      userId: json['userId'] as String,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'backend': instance.backend,
      'status': _$JobStatusEnumMap[instance.status]!,
      'creationDate': instance.creationDate.toIso8601String(),
      'name': instance.name,
      'tags': instance.tags,
      'liveDataEnabled': instance.liveDataEnabled,
      'provider': instance.provider,
      'runMode': instance.runMode,
      'userId': instance.userId,
      'endDate': instance.endDate?.toIso8601String(),
      'createdBy': instance.createdBy,
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

JobBackend _$JobBackendFromJson(Map<String, dynamic> json) => JobBackend(
      name: json['name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$JobBackendToJson(JobBackend instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
