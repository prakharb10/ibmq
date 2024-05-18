// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryData _$SummaryDataFromJson(Map<String, dynamic> json) => SummaryData(
      size: _$recordConvert(
        json['size'],
        ($jsonValue) => (
          $jsonValue[r'$1'] as num,
          $jsonValue[r'$2'] as num,
        ),
      ),
      success: json['success'] as bool,
      summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
      resultTime: Option<double>.fromJson(
          json['resultTime'], (value) => (value as num).toDouble()),
    );

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
      maxQubitsUsed: (json['max_qubits_used'] as num).toInt(),
      numCircuits: (json['num_circuits'] as num).toInt(),
      qobjConfig:
          QobjConfig.fromJson(json['qobj_config'] as Map<String, dynamic>),
      gatesExecuted: (json['gates_executed'] as num).toInt(),
    );

QobjConfig _$QobjConfigFromJson(Map<String, dynamic> json) => QobjConfig(
      nQubits: (json['n_qubits'] as num).toInt(),
      memorySlots: (json['memory_slots'] as num).toInt(),
      cost: (json['cost'] as num).toDouble(),
      shots: (json['shots'] as num).toInt(),
      type: Option<String>.fromJson(json['type'], (value) => value as String),
    );
