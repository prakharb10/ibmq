import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'runtime_job.freezed.dart';
part 'runtime_job.g.dart';

@freezed
class RuntimeJob extends Equatable with _$RuntimeJob {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory RuntimeJob({
    /// Identifier of the job.
    required String id,

    /// Name of hub where the job was executed.
    required String hub,

    /// Name of group where the job was executed.
    required String group,

    /// Name of project where the job was executed.
    required String project,

    /// The backend where the job was executed.
    required String backend,

    /// The job state.
    required ({RuntimeJobStatus status, String reason}) state,

    /// The job status.
    ///
    /// See [RuntimeJobStatus] for possible values.
    required RuntimeJobStatus status,

    // TODO: Add PUBs field
    /// Parameters of the job.
    required ({Option<int> shots, Option<List<Map>> circuits}) params,

    /// Program associated with the job.
    required ({
      String id,
    }) program,

    /// Timestamp of when the job was created.
    required DateTime created,

    /// Timestamp of when the job ended.
    required Option<DateTime> ended,

    /// Name and tag of image used to run the job.
    required String runtime,

    /// Cost of the job.
    required Option<int> cost,

    /// List of tags associated with the job.
    required Option<IList<String>> tags,

    /// Identifier of the session where the job was executed.
    required Option<String> sessionId,

    /// Usage in seconds of the job.
    required ({
      double seconds,
    })? usage,

    /// estimated running time of the job in seconds
    required Option<double> estimatedRunningTimeSeconds,

    /// estimated max running time of the job in seconds
    required Option<double> estimatedMaxRunningTimeSeconds,
  }) = _RuntimeJob;

  factory RuntimeJob.fromJson(Map<String, dynamic> json) =>
      _$RuntimeJobFromJson(json);

  const RuntimeJob._();

  @override
  List<Object?> get props => [
        id,
        hub,
        group,
        project,
        backend,
        state,
        status,
        params,
        program,
        created,
        ended,
        runtime,
        cost,
        tags,
        sessionId,
        usage,
        estimatedRunningTimeSeconds,
        estimatedMaxRunningTimeSeconds,
      ];
}

/// Enum for Runtime Job status
@JsonEnum(fieldRename: FieldRename.pascal)
enum RuntimeJobStatus {
  queued,
  running,
  completed,
  cancelled,
  @JsonValue("Cancelled - Ran too long")
  cancelledRanTooLong,
  failed,
}
