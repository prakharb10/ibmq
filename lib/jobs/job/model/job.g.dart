// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      kind: json['kind'] as String,
      backend: JobBackend.fromJson(json['backend'] as Map<String, dynamic>),
      status: $enumDecode(_$JobStatusEnumMap, json['status']),
      creationDate: DateTime.parse(json['creationDate'] as String),
      deleted: json['deleted'] as bool,
      summaryData:
          SummaryData.fromJson(json['summaryData'] as Map<String, dynamic>),
      timePerStep:
          TimePerStep.fromJson(json['timePerStep'] as Map<String, dynamic>),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      runMode: json['runMode'] as String?,
      id: json['id'] as String,
      userId: json['userId'] as String,
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'kind': instance.kind,
      'backend': instance.backend,
      'status': _$JobStatusEnumMap[instance.status]!,
      'creationDate': instance.creationDate.toIso8601String(),
      'deleted': instance.deleted,
      'summaryData': instance.summaryData,
      'timePerStep': instance.timePerStep,
      'endDate': instance.endDate?.toIso8601String(),
      'runMode': instance.runMode,
      'id': instance.id,
      'userId': instance.userId,
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

TimePerStep _$TimePerStepFromJson(Map<String, dynamic> json) => TimePerStep(
      creating: DateTime.parse(json['CREATING'] as String),
      created: DateTime.parse(json['CREATED'] as String),
      validating: DateTime.parse(json['VALIDATING'] as String),
      validated: DateTime.parse(json['VALIDATED'] as String),
      queued: DateTime.parse(json['QUEUED'] as String),
      running: DateTime.parse(json['RUNNING'] as String),
      completed: DateTime.parse(json['COMPLETED'] as String),
    );

Map<String, dynamic> _$TimePerStepToJson(TimePerStep instance) =>
    <String, dynamic>{
      'CREATING': instance.creating.toIso8601String(),
      'CREATED': instance.created.toIso8601String(),
      'VALIDATING': instance.validating.toIso8601String(),
      'VALIDATED': instance.validated.toIso8601String(),
      'QUEUED': instance.queued.toIso8601String(),
      'RUNNING': instance.running.toIso8601String(),
      'COMPLETED': instance.completed.toIso8601String(),
    };