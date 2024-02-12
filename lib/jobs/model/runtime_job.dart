import 'package:ibmq/jobs/model/job.dart';
import 'package:ibmq/jobs/model/runtime_job_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'runtime_job.g.dart';

/// Model class for a runtime job
///
/// This class is used to display a runtime job in the jobs list
/// and to navigate to the job details page.
/// Contains limited information about the job.
///
/// Ignored fields:
/// - `state` - use `status` instead
@JsonSerializable(fieldRename: FieldRename.snake)
class RuntimeJob extends BaseJob {
  /// Identifier of the job.
  final String id;

  /// Name of hub where the job was executed.
  ///
  /// This field is only present if the job was executed on IBM Quantum.
  final String? hub;

  /// Name of group where the job was executed.
  ///
  /// This field is only present if the job was executed on IBM Quantum.
  final String? group;

  /// Name of project where the job was executed.
  ///
  /// This field is only present if the job was executed on IBM Quantum.
  final String? project;

  /// The backend where the job was executed.
  final String? backend;

  /// The job status.
  ///
  /// See [RuntimeJobStatus] for possible values.
  final RuntimeJobStatus status;

  /// Program associated with the job.
  @JsonKey(readValue: _readProgram)
  final String program;

  /// Timestamp of when the job was created.
  final DateTime created;

  /// Name and tag of image used to run the job.
  ///
  /// This field is only present if the job was executed on IBM Quantum.
  final String? runtime;

  /// Cost of the job.
  final int? cost;

  /// List of tags associated with the job.
  final List<String>? tags;

  /// Identifier of the session where the job was executed.
  final String? sessionId;

  /// Number of shots used in the job.
  @JsonKey(readValue: _readShots)
  final int shots;

  /// Number of circuits.
  @JsonKey(readValue: _readCircuits)
  final int circuits;

  static _readProgram(Map<dynamic, dynamic> json, String key) =>
      json[key]['id'] as String;

  static _readShots(Map<dynamic, dynamic> json, String key) =>
      json['params']['run_options'][key] as int;

  static _readCircuits(Map<dynamic, dynamic> json, String key) =>
      (json['params'][key] as List).length;

  const RuntimeJob({
    required this.id,
    this.hub,
    this.group,
    this.project,
    this.backend,
    required this.status,
    required this.program,
    required this.created,
    this.runtime,
    this.cost,
    this.tags,
    this.sessionId,
    required this.shots,
    required this.circuits,
  });

  factory RuntimeJob.fromJson(Map<String, dynamic> json) =>
      _$RuntimeJobFromJson(json);

  Map<String, dynamic> toJson() => _$RuntimeJobToJson(this);

  @override
  List<Object?> get props => [
        id,
        hub,
        group,
        project,
        backend,
        status,
        program,
        created,
        runtime,
        cost,
        tags,
        sessionId,
        shots,
        circuits,
      ];
}
