// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackendImpl _$$BackendImplFromJson(Map<String, dynamic> json) =>
    _$BackendImpl(
      hasAccess: json['hasAccess'] as bool,
      name: json['name'] as String,
      basisGates: IList<String>.fromJson(
          json['basisGates'], (value) => value as String),
      couplingMap: IList<IList<int>>.fromJson(
          json['couplingMap'],
          (value) =>
              IList<int>.fromJson(value, (value) => (value as num).toInt())),
      version:
          Option<String>.fromJson(json['version'], (value) => value as String),
      qubits: (json['qubits'] as num).toInt(),
      isSimulator: json['isSimulator'] as bool,
      quantumVolume: Option<int>.fromJson(
          json['quantumVolume'], (value) => (value as num).toInt()),
      performance:
          Performance.fromJson(json['performance'] as Map<String, dynamic>),
      processorType: _$recordConvert(
        json['processorType'],
        ($jsonValue) => (
          family: $jsonValue['family'] as String,
          revision: $jsonValue['revision'] as String,
        ),
      ),
      deviceStatus: _$recordConvert(
        json['deviceStatus'],
        ($jsonValue) => (
          message: $jsonValue['message'] as String,
          state: $jsonValue['state'] as bool,
          status: $jsonValue['status'] as String,
        ),
      ),
      queueLength: (json['queueLength'] as num).toInt(),
      inputAllowed: IList<String>.fromJson(
          json['inputAllowed'], (value) => value as String),
      supportedFeatures: IList<String>.fromJson(
          json['supportedFeatures'], (value) => value as String),
      coords: IList<IList<int>>.fromJson(
          json['coords'],
          (value) =>
              IList<int>.fromJson(value, (value) => (value as num).toInt())),
    );

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
