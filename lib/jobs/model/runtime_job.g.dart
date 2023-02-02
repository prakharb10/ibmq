// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runtime_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuntimeJob _$RuntimeJobFromJson(Map<String, dynamic> json) => RuntimeJob(
      id: json['id'] as String,
      hub: json['hub'] as String?,
      group: json['group'] as String?,
      project: json['project'] as String?,
      backend: json['backend'] as String?,
      status: $enumDecode(_$RuntimeJobStatusEnumMap, json['status']),
      program: RuntimeJob._readProgram(json, 'program') as String,
      created: DateTime.parse(json['created'] as String),
      runtime: json['runtime'] as String?,
      cost: json['cost'] as int?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      sessionId: json['session_id'] as String?,
      shots: RuntimeJob._readShots(json, 'shots') as int,
      circuits: RuntimeJob._readCircuits(json, 'circuits') as int,
    );

Map<String, dynamic> _$RuntimeJobToJson(RuntimeJob instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hub': instance.hub,
      'group': instance.group,
      'project': instance.project,
      'backend': instance.backend,
      'status': _$RuntimeJobStatusEnumMap[instance.status]!,
      'program': instance.program,
      'created': instance.created.toIso8601String(),
      'runtime': instance.runtime,
      'cost': instance.cost,
      'tags': instance.tags,
      'session_id': instance.sessionId,
      'shots': instance.shots,
      'circuits': instance.circuits,
    };

const _$RuntimeJobStatusEnumMap = {
  RuntimeJobStatus.queued: 'Queued',
  RuntimeJobStatus.running: 'Running',
  RuntimeJobStatus.completed: 'Completed',
  RuntimeJobStatus.cancelled: 'Cancelled',
  RuntimeJobStatus.cancelledRanTooLong: 'Cancelled - Ran too long',
  RuntimeJobStatus.failed: 'Failed',
};
