// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runtime_job_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuntimeJobMetrics _$RuntimeJobMetricsFromJson(Map<String, dynamic> json) =>
    RuntimeJobMetrics(
      timestamps: RuntimeJobTimestamps.fromJson(
          json['timestamps'] as Map<String, dynamic>),
      seconds: RuntimeJobMetrics._secondsFromJson(json, 'seconds') as int,
      qiskitVersion: json['qiskit_version'] as String,
    );

Map<String, dynamic> _$RuntimeJobMetricsToJson(RuntimeJobMetrics instance) =>
    <String, dynamic>{
      'timestamps': instance.timestamps,
      'seconds': instance.seconds,
      'qiskit_version': instance.qiskitVersion,
    };

RuntimeJobTimestamps _$RuntimeJobTimestampsFromJson(
        Map<String, dynamic> json) =>
    RuntimeJobTimestamps(
      created: DateTime.parse(json['created'] as String),
      finished: json['finished'] == null
          ? null
          : DateTime.parse(json['finished'] as String),
      running: json['running'] == null
          ? null
          : DateTime.parse(json['running'] as String),
    );

Map<String, dynamic> _$RuntimeJobTimestampsToJson(
        RuntimeJobTimestamps instance) =>
    <String, dynamic>{
      'created': instance.created.toIso8601String(),
      'finished': instance.finished?.toIso8601String(),
      'running': instance.running?.toIso8601String(),
    };
