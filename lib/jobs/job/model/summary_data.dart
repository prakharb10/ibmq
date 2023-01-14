import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary_data.g.dart';

/// Model class for the summary data of a job
@JsonSerializable()
class SummaryData extends Equatable {
  /// The job size
  final Map<String, int> size;

  /// Whether the job is success
  final bool success;

  /// The job summary
  ///
  /// See [Summary] for more information
  final Summary summary;

  /// The time taken for the result
  final double? resultTime;

  const SummaryData({
    required this.size,
    required this.success,
    required this.summary,
    required this.resultTime,
  });

  @override
  List<Object?> get props => [size, success, summary, resultTime];

  factory SummaryData.fromJson(Map<String, dynamic> json) =>
      _$SummaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryDataToJson(this);
}

/// Model class for a [SummaryData] summary
///
/// Ignored fields:
/// - `partial_validation`
@JsonSerializable(fieldRename: FieldRename.snake)
class Summary extends Equatable {
  /// Number of maximum qubits used
  final int maxQubitsUsed;

  /// Number of circuits
  final int numCircuits;

  /// The Quantum Object Configuration
  ///
  /// See [QobjConfig] for more information
  final QobjConfig qobjConfig;

  /// The number of gates executed
  final int gatesExecuted;

  const Summary({
    required this.maxQubitsUsed,
    required this.numCircuits,
    required this.qobjConfig,
    required this.gatesExecuted,
  });

  @override
  List<Object> get props =>
      [maxQubitsUsed, numCircuits, qobjConfig, gatesExecuted];

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}

/// Model class for a Quantum Object Configuration
///
/// Used in [Summary]
@JsonSerializable(fieldRename: FieldRename.snake)
class QobjConfig extends Equatable {
  /// The number of qubits
  final int nQubits;

  /// The number of memory slots
  final int memorySlots;

  /// The cost of the job
  final double cost;

  /// The number of shots
  final int shots;

  /// The object type
  final String? type;

  const QobjConfig({
    required this.nQubits,
    required this.memorySlots,
    required this.cost,
    required this.shots,
    this.type,
  });

  @override
  List<Object?> get props => [nQubits, memorySlots, cost, shots, type];

  factory QobjConfig.fromJson(Map<String, dynamic> json) =>
      _$QobjConfigFromJson(json);

  Map<String, dynamic> toJson() => _$QobjConfigToJson(this);
}
