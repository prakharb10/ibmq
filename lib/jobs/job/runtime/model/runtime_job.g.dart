// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runtime_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RuntimeJobImpl _$$RuntimeJobImplFromJson(Map<String, dynamic> json) =>
    _$RuntimeJobImpl(
      id: json['id'] as String,
      hub: json['hub'] as String,
      group: json['group'] as String,
      project: json['project'] as String,
      backend: json['backend'] as String,
      state: _$recordConvert(
        json['state'],
        ($jsonValue) => (
          reason: $jsonValue['reason'] as String,
          status: $enumDecode(_$RuntimeJobStatusEnumMap, $jsonValue['status']),
        ),
      ),
      status: $enumDecode(_$RuntimeJobStatusEnumMap, json['status']),
      params: _$recordConvert(
        json['params'],
        ($jsonValue) => (
          circuits: ($jsonValue['circuits'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
          shots: ($jsonValue['shots'] as num).toInt(),
        ),
      ),
      program: _$recordConvert(
        json['program'],
        ($jsonValue) => (id: $jsonValue['id'] as String,),
      ),
      created: DateTime.parse(json['created'] as String),
      ended: Option<DateTime>.fromJson(
          json['ended'], (value) => DateTime.parse(value as String)),
      runtime: json['runtime'] as String,
      cost:
          Option<int>.fromJson(json['cost'], (value) => (value as num).toInt()),
      tags: Option<IList<String>>.fromJson(json['tags'],
          (value) => IList<String>.fromJson(value, (value) => value as String)),
      sessionId: Option<String>.fromJson(
          json['session_id'], (value) => value as String),
      usage: _$recordConvertNullable(
        json['usage'],
        ($jsonValue) => (seconds: ($jsonValue['seconds'] as num).toDouble(),),
      ),
      estimatedRunningTimeSeconds: Option<double>.fromJson(
          json['estimated_running_time_seconds'],
          (value) => (value as num).toDouble()),
      estimatedMaxRunningTimeSeconds: Option<double>.fromJson(
          json['estimated_max_running_time_seconds'],
          (value) => (value as num).toDouble()),
    );

Map<String, dynamic> _$$RuntimeJobImplToJson(_$RuntimeJobImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hub': instance.hub,
      'group': instance.group,
      'project': instance.project,
      'backend': instance.backend,
      'state': <String, dynamic>{
        'reason': instance.state.reason,
        'status': _$RuntimeJobStatusEnumMap[instance.state.status]!,
      },
      'status': _$RuntimeJobStatusEnumMap[instance.status]!,
      'params': <String, dynamic>{
        'circuits': instance.params.circuits,
        'shots': instance.params.shots,
      },
      'program': <String, dynamic>{
        'id': instance.program.id,
      },
      'created': instance.created.toIso8601String(),
      'ended': instance.ended.toJson(
        (value) => value.toIso8601String(),
      ),
      'runtime': instance.runtime,
      'cost': instance.cost.toJson(
        (value) => value,
      ),
      'tags': instance.tags.toJson(
        (value) => value.toJson(
          (value) => value,
        ),
      ),
      'session_id': instance.sessionId.toJson(
        (value) => value,
      ),
      'usage': instance.usage == null
          ? null
          : <String, dynamic>{
              'seconds': instance.usage!.seconds,
            },
      'estimated_running_time_seconds':
          instance.estimatedRunningTimeSeconds.toJson(
        (value) => value,
      ),
      'estimated_max_running_time_seconds':
          instance.estimatedMaxRunningTimeSeconds.toJson(
        (value) => value,
      ),
    };

const _$RuntimeJobStatusEnumMap = {
  RuntimeJobStatus.queued: 'Queued',
  RuntimeJobStatus.running: 'Running',
  RuntimeJobStatus.completed: 'Completed',
  RuntimeJobStatus.cancelled: 'Cancelled',
  RuntimeJobStatus.cancelledRanTooLong: 'Cancelled - Ran too long',
  RuntimeJobStatus.failed: 'Failed',
};

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    value == null ? null : convert(value as Map<String, dynamic>);
