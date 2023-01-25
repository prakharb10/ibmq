import 'package:json_annotation/json_annotation.dart';

part 'runtime_job_metrics.g.dart';

/// Class that represents the metrics of a Runtime Job
@JsonSerializable(fieldRename: FieldRename.snake)
class RuntimeJobMetrics {
  /// Timestamp of the job
  ///
  /// See [RuntimeJobTimestamps] for more information
  final RuntimeJobTimestamps timestamps;

  /// Time the job ran
  @JsonKey(readValue: _secondsFromJson)
  final int seconds;

  /// Version of qiskit
  final String qiskitVersion;

  static _secondsFromJson(Map<dynamic, dynamic> json, String key) =>
      json["bss"][key];

  const RuntimeJobMetrics({
    required this.timestamps,
    required this.seconds,
    required this.qiskitVersion,
  });

  factory RuntimeJobMetrics.fromJson(Map<String, dynamic> json) =>
      _$RuntimeJobMetricsFromJson(json);

  Map<String, dynamic> toJson() => _$RuntimeJobMetricsToJson(this);
}

/// Timestamps of a Runtime Job
@JsonSerializable()
class RuntimeJobTimestamps {
  /// The job creation date
  final DateTime created;

  /// The job finished date
  final DateTime? finished;

  /// The job running date
  final DateTime? running;

  const RuntimeJobTimestamps({
    required this.created,
    this.finished,
    this.running,
  });

  factory RuntimeJobTimestamps.fromJson(Map<String, dynamic> json) =>
      _$RuntimeJobTimestampsFromJson(json);

  Map<String, dynamic> toJson() => _$RuntimeJobTimestampsToJson(this);
}
