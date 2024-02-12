import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'runtime_result.g.dart';

/// Base class for all runtime results
abstract class RuntimeResult extends Equatable {
  /// Job metadata
  final List<dynamic> metadata;

  const RuntimeResult({required this.metadata});

  @override
  List<Object> get props => [metadata];
}

/// Class for the runtime result of the `sampler` program
@JsonSerializable(fieldRename: FieldRename.snake)
class SamplerResult extends RuntimeResult {
  /// Quasi-probability distribution
  /// of the measurement outcomes
  final List<Map<String, dynamic>> quasiDists;

  const SamplerResult(
      {required this.quasiDists, required super.metadata});

  factory SamplerResult.fromJson(Map<String, dynamic> json) =>
      _$SamplerResultFromJson(json);

  Map<String, dynamic> toJson() => _$SamplerResultToJson(this);

  @override
  List<Object> get props => [quasiDists, ...super.props];
}

/// Class for the runtime result of the `estimator` program
@JsonSerializable()
class EstimatorResult extends RuntimeResult {
  /// Estimated expectation values
  final Map<String, dynamic> values;

  const EstimatorResult({required this.values, required super.metadata});

  factory EstimatorResult.fromJson(Map<String, dynamic> json) =>
      _$EstimatorResultFromJson(json);

  Map<String, dynamic> toJson() => _$EstimatorResultToJson(this);

  @override
  List<Object> get props => [values, ...super.props];
}
