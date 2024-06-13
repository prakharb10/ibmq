// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerformanceImpl _$$PerformanceImplFromJson(Map<String, dynamic> json) =>
    _$PerformanceImpl(
      clopsH: Option<int>.fromJson(
          json['clopsH'], (value) => (value as num).toInt()),
      clopsV: Option<int>.fromJson(
          json['clopsV'], (value) => (value as num).toInt()),
      layerFidelity: IList<LayerFidelity>.fromJson(json['layerFidelity'],
          (value) => LayerFidelity.fromJson(value as Map<String, dynamic>)),
      eplg: (json['eplg'] as num).toDouble(),
    );

_$LayerFidelityImpl _$$LayerFidelityImplFromJson(Map<String, dynamic> json) =>
    _$LayerFidelityImpl(
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
      unit: json['unit'] as String,
      value: (json['value'] as num).toDouble(),
    );
