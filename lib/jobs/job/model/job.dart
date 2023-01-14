import 'package:equatable/equatable.dart';
import 'package:ibmq/jobs/job/model/info_queue.dart';
import 'package:ibmq/jobs/job/model/summary_data.dart';
import 'package:ibmq/jobs/model/job_backend.dart';
import 'package:ibmq/utils/job_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

/// Model class for a job
///
/// Contains all information about a job.
/// This class is used to display a job in the job details page.
///
/// Ignored fields:
/// - `objectStorageInfo`
/// - `allowObjectStorage`
/// - `hubInfo`
/// - `liveDataEnabled`
/// - `clientInfo`
@JsonSerializable()
class Job extends Equatable {
  /// The job kind
  final String kind;

  /// The job backend
  ///
  /// See [JobBackend] for more information
  final JobBackend backend;

  /// The job status
  ///
  /// See [JobStatus] for possible values
  final JobStatus status;

  /// The job creation date
  final DateTime creationDate;

  /// Whether the job has been deleted
  final bool deleted;

  /// The job data summary
  ///
  /// See [SummaryData] for more information
  final SummaryData summaryData;

  /// The job time per step
  ///
  /// See [TimePerStep] for more information
  final TimePerStep timePerStep;

  /// The job end date
  final DateTime? endDate;

  /// The job run mode
  final String? runMode;

  /// The job id
  final String id;

  /// The user id
  final String userId;

  /// The job queue info
  ///
  /// If `status` is [JobStatus.QUEUED], this field will be populated.
  /// See [InfoQueue] for more information
  final InfoQueue? infoQueue;

  /// The job was created locally or remotely
  final String createdBy;

  const Job({
    required this.kind,
    required this.backend,
    required this.status,
    required this.creationDate,
    required this.deleted,
    required this.summaryData,
    required this.timePerStep,
    required this.endDate,
    required this.runMode,
    required this.id,
    required this.userId,
    required this.infoQueue,
    required this.createdBy,
  });

  @override
  List<Object?> get props => [
        kind,
        backend,
        status,
        creationDate,
        deleted,
        summaryData,
        timePerStep,
        endDate,
        runMode,
        id,
        userId,
        infoQueue,
        createdBy,
      ];

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}

/// Model class for time per step
///
/// Used in [Job]
@JsonSerializable(fieldRename: FieldRename.screamingSnake)
class TimePerStep extends Equatable {
  final DateTime? creating;
  final DateTime? created;
  final DateTime? transpiling;
  final DateTime? transpiled;
  final DateTime? validating;
  final DateTime? validated;
  final DateTime? queued;
  final DateTime? running;
  final DateTime? completed;

  const TimePerStep({
    required this.creating,
    required this.created,
    required this.transpiling,
    required this.transpiled,
    required this.validating,
    required this.validated,
    required this.queued,
    required this.running,
    required this.completed,
  });

  @override
  List<Object?> get props => [
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

  Map<String, dynamic> toJson() => _$TimePerStepToJson(this);
}
