// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runtime_job_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuntimeJobMetrics _$RuntimeJobMetricsFromJson(Map<String, dynamic> json) =>
    RuntimeJobMetrics(
      timestamps: _$recordConvert(
        json['timestamps'],
        ($jsonValue) => (
          created: DateTime.parse($jsonValue['created'] as String),
          finished: Option<DateTime>.fromJson($jsonValue['finished'],
              (value) => DateTime.parse(value as String)),
          running: Option<DateTime>.fromJson($jsonValue['running'],
              (value) => DateTime.parse(value as String)),
        ),
      ),
      bss: _$recordConvert(
        json['bss'],
        ($jsonValue) => (seconds: ($jsonValue['seconds'] as num).toInt(),),
      ),
      qiskitVersion: Option<String>.fromJson(
          json['qiskit_version'], (value) => value as String),
      usage: RuntimeJobMetrics._usageFromJson(
          json['usage'] as Map<String, dynamic>),
      executions: Option<int>.fromJson(
          json['executions'], (value) => (value as num).toInt()),
      numCircuits: Option<int>.fromJson(
          json['num_circuits'], (value) => (value as num).toInt()),
      numQubits: Option<IList<int>>.fromJson(
          json['num_qubits'],
          (value) =>
              IList<int>.fromJson(value, (value) => (value as num).toInt())),
      circuitDepths: Option<IList<int>>.fromJson(
          json['circuit_depths'],
          (value) =>
              IList<int>.fromJson(value, (value) => (value as num).toInt())),
      estimatedStartTime: Option<DateTime>.fromJson(
          json['estimated_start_time'],
          (value) => DateTime.parse(value as String)),
      estimatedCompletionTime: Option<DateTime>.fromJson(
          json['estimated_completion_time'],
          (value) => DateTime.parse(value as String)),
      positionInQueue: Option<int>.fromJson(
          json['position_in_queue'], (value) => (value as num).toInt()),
      positionInProvider: Option<int>.fromJson(
          json['position_in_provider'], (value) => (value as num).toInt()),
    );

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
