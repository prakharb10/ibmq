// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryData _$SummaryDataFromJson(Map<String, dynamic> json) => SummaryData(
      size: Map<String, int>.from(json['size'] as Map),
      success: json['success'] as bool,
      summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
      resultTime: (json['resultTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SummaryDataToJson(SummaryData instance) =>
    <String, dynamic>{
      'size': instance.size,
      'success': instance.success,
      'summary': instance.summary,
      'resultTime': instance.resultTime,
    };

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
      maxQubitsUsed: json['max_qubits_used'] as int,
      numCircuits: json['num_circuits'] as int,
      qobjConfig:
          QobjConfig.fromJson(json['qobj_config'] as Map<String, dynamic>),
      gatesExecuted: json['gates_executed'] as int,
    );

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'max_qubits_used': instance.maxQubitsUsed,
      'num_circuits': instance.numCircuits,
      'qobj_config': instance.qobjConfig,
      'gates_executed': instance.gatesExecuted,
    };

QobjConfig _$QobjConfigFromJson(Map<String, dynamic> json) => QobjConfig(
      nQubits: json['n_qubits'] as int,
      memorySlots: json['memory_slots'] as int,
      cost: (json['cost'] as num).toDouble(),
      shots: json['shots'] as int,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$QobjConfigToJson(QobjConfig instance) =>
    <String, dynamic>{
      'n_qubits': instance.nQubits,
      'memory_slots': instance.memorySlots,
      'cost': instance.cost,
      'shots': instance.shots,
      'type': instance.type,
    };
