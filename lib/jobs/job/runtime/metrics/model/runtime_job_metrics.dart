import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'runtime_job_metrics.g.dart';

/// Class that represents the metrics of a Runtime Job
@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class RuntimeJobMetrics extends Equatable {
  /// Timestamp of the job
  final ({
    DateTime created,
    Option<DateTime> finished,
    Option<DateTime> running
  }) timestamps;

  /// Total billed time for the job - quantum seconds only.
  final ({int seconds}) bss;

  /// Usage details of the job
  @JsonKey(fromJson: _usageFromJson)
  final Option<({int seconds, int quantumSeconds})> usage;

  /// Number of executions during job
  final Option<int> executions;

  /// Number of circuits executed on quantum system
  final Option<int> numCircuits;

  /// Number of qubits on quantum system
  final Option<IList<int>> numQubits;

  /// An array of circuit depths
  final Option<IList<int>> circuitDepths;

  /// Version of qiskit
  final Option<String> qiskitVersion;

  /// UTC timestamp for when the job will start
  final Option<DateTime> estimatedStartTime;

  /// UTC timestamp for when the job will complete
  final Option<DateTime> estimatedCompletionTime;

  /// Current position of job in queue
  final Option<int> positionInQueue;

  /// Current position of job in instance
  final Option<int> positionInProvider;

  const RuntimeJobMetrics({
    required this.timestamps,
    required this.bss,
    required this.qiskitVersion,
    required this.usage,
    required this.executions,
    required this.numCircuits,
    required this.numQubits,
    required this.circuitDepths,
    required this.estimatedStartTime,
    required this.estimatedCompletionTime,
    required this.positionInQueue,
    required this.positionInProvider,
  });

  factory RuntimeJobMetrics.fromJson(Map<String, dynamic> json) =>
      _$RuntimeJobMetricsFromJson(json);

  @override
  List<Object> get props => [
        timestamps,
        bss,
        qiskitVersion,
        usage,
        executions,
        numCircuits,
        numQubits,
        circuitDepths,
        estimatedStartTime,
        estimatedCompletionTime,
        positionInQueue,
        positionInProvider
      ];

  static Option<({int seconds, int quantumSeconds})> _usageFromJson(
          Map<String, dynamic> json) =>
      Option.fromJson(
          json,
          (json) => (
                seconds: json['seconds'] as int,
                quantumSeconds: json['quantum_seconds'] as int
              ));
}
