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
          $enumDecode(_$RuntimeJobStatusEnumMap, $jsonValue[r'$1']),
          $jsonValue[r'$2'] as String,
        ),
      ),
      status: $enumDecode(_$RuntimeJobStatusEnumMap, json['status']),
      params: IMap<String, dynamic>.fromJson(
          json['params'] as Map<String, dynamic>,
          (value) => value as String,
          (value) => value),
      program: _$recordConvert(
        json['program'],
        ($jsonValue) => ($jsonValue[r'$1'] as String,),
      ),
      created: DateTime.parse(json['created'] as String),
      ended: Option<DateTime>.fromJson(
          json['ended'], (value) => DateTime.parse(value as String)),
      runtime: json['runtime'] as String,
      cost:
          Option<int>.fromJson(json['cost'], (value) => (value as num).toInt()),
      tags: IList<String>.fromJson(json['tags'], (value) => value as String),
      sessionId: json['session_id'] as String,
      usage: _$recordConvert(
        json['usage'],
        ($jsonValue) => (($jsonValue[r'$1'] as num).toDouble(),),
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
        r'$1': _$RuntimeJobStatusEnumMap[instance.state.$1]!,
        r'$2': instance.state.$2,
      },
      'status': _$RuntimeJobStatusEnumMap[instance.status]!,
      'params': instance.params.toJson(
        (value) => value,
        (value) => value,
      ),
      'program': <String, dynamic>{
        r'$1': instance.program.$1,
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
        (value) => value,
      ),
      'session_id': instance.sessionId,
      'usage': <String, dynamic>{
        r'$1': instance.usage.$1,
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
