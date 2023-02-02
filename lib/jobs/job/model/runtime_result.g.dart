// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runtime_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SamplerResult _$SamplerResultFromJson(Map<String, dynamic> json) =>
    SamplerResult(
      quasiDists: (json['quasi_dists'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      metadata: json['metadata'] as List<dynamic>,
    );

Map<String, dynamic> _$SamplerResultToJson(SamplerResult instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'quasi_dists': instance.quasiDists,
    };

EstimatorResult _$EstimatorResultFromJson(Map<String, dynamic> json) =>
    EstimatorResult(
      values: json['values'] as Map<String, dynamic>,
      metadata: json['metadata'] as List<dynamic>,
    );

Map<String, dynamic> _$EstimatorResultToJson(EstimatorResult instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'values': instance.values,
    };
