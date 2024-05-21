import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/jobs/job/iqx/model/summary_data.dart';
import 'package:ibmq/jobs/model/job.dart';
import 'package:ibmq/jobs/model/job_status.dart';

part 'iqx_job.freezed.dart';
part 'iqx_job.g.dart';

/// Model class for a job
///
/// Contains all information about a job.
/// This class is used to display a job in the job details page.
///
/// Ignored fields:
/// - `objectStorageInfo`
/// - `liveDataEnabled`
/// - `clientInfo`
/// - `code`, `codeId`
@Freezed(toJson: false)
class IQXJob extends Equatable with _$IQXJob {
  const factory IQXJob({
    /// The job kind
    required String kind,

    /// The job backend
    required ({String id, String name}) backend,

    /// The job status
    ///
    /// See [JobStatus] for possible values
    required JobStatus status,

    /// The job creation date
    required DateTime creationDate,

    /// Whether the job has been deleted
    required bool deleted,

    /// The job data summary
    ///
    /// See [SummaryData] for more information
    required SummaryData summaryData,

    /// The job time per step
    ///
    /// See [TimePerStep] for more information
    required TimePerStep timePerStep,

    /// Hub Information
    ///
    /// Contains the hub/group/project information
    required ({
      ({
        String name,
      }) hub,
      ({
        String name,
      }) group,
      ({
        String name,
      }) project
    }) hubInfo,

    /// The job end date
    required Option<DateTime> endDate,

    /// List of tags associated with the job.
    required IList<String> tags,

    /// The job run mode
    required Option<RunMode> runMode,

    /// The job id
    required String id,

    /// The user id
    required String userId,

    /// The job was created locally or remotely
    required String createdBy,
  }) = _IQXJob;

  factory IQXJob.fromJson(Map<String, dynamic> json) => _$IQXJobFromJson(json);

  const IQXJob._();

  @override
  List<Object> get props => [
        kind,
        backend,
        status,
        creationDate,
        deleted,
        summaryData,
        timePerStep,
        hubInfo,
        endDate,
        tags,
        runMode,
        id,
        userId,
        createdBy,
      ];
}

/// Model class for time per step
///
/// Used in [Job]
@Freezed(toJson: false)
class TimePerStep extends Equatable with _$TimePerStep {
  @JsonSerializable(
      fieldRename: FieldRename.screamingSnake, createToJson: false)
  const factory TimePerStep({
    required DateTime creating,
    required Option<DateTime> created,
    required Option<DateTime> transpiling,
    required Option<DateTime> transpiled,
    required Option<DateTime> validating,
    required Option<DateTime> validated,
    required Option<DateTime> queued,
    required Option<DateTime> running,
    required Option<DateTime> completed,
  }) = _TimePerStep;

  const TimePerStep._();

  @override
  List<Object> get props => [
        creating,
        created,
        transpiling,
        transpiled,
        validating,
        validated,
        queued,
        running,
        completed,
      ];

  factory TimePerStep.fromJson(Map<String, dynamic> json) =>
      _$TimePerStepFromJson(json);
}
