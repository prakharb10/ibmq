import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/jobs/model/job_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

/// Base class for all jobs.
///
/// Two types of jobs are supported:
/// - [Job] - A legacy job type
/// - [RuntimeJob] - A runtime job type
abstract class BaseJob extends Equatable {
  const BaseJob();

  @override
  List<Object?> get props => [];
}

/// Model class for a job in the jobs list
///
/// This class is used to display a job in the jobs list
/// and to navigate to the job details page.
/// Contains limited information about the job.
@JsonSerializable(fieldRename: FieldRename.snake)
final class Job extends Equatable {
  /// The job id
  final String id;

  /// Name of the hub of the instance in which the job is being executed
  final String hub;

  /// Name of the group of the instance in which the job is being executed
  final String group;

  /// Name of the project of the instance in which the job is being executed
  final String project;

  /// The system on which to run the program
  final String backend;

  /// The job status
  ///
  /// See [JobStatus] for possible values
  final JobStatus status;

  /// The job creation date
  final DateTime created;

  /// The job type
  final JobType type;

  /// Tags associated with the job
  final List<String> tags;

  /// Job name
  final String name;

  /// The job run mode
  final Option<RunMode> runMode;

  /// Job ran in private mode
  final bool private;

  /// UTC timestamp for when the job finished running
  final Option<DateTime> endTime;

  /// estimated running time of the job in seconds
  final Option<double> estimatedRunningTimeSeconds;

  /// estimated max running time of the job in seconds
  final Option<double> estimatedMaxRunningTimeSeconds;

  /// Program details
  final ({String id}) program;

  /// Name and tag of the image to use when running a program
  final String runtime;

  /// Identifier of the session that the job is a part of
  final Option<String> sessionId;

  /// Current state of the job
  final ({JobStatus status, String reason}) state;

  const Job({
    required this.id,
    required this.hub,
    required this.group,
    required this.project,
    required this.backend,
    required this.status,
    required this.created,
    required this.type,
    required this.tags,
    required this.name,
    required this.runMode,
    required this.private,
    required this.endTime,
    required this.estimatedRunningTimeSeconds,
    required this.estimatedMaxRunningTimeSeconds,
    required this.program,
    required this.runtime,
    required this.sessionId,
    required this.state,
  });

  @override
  List<Object> get props => [
        id,
        hub,
        group,
        project,
        backend,
        status,
        created,
        type,
        tags,
        name,
        runMode,
        private,
        endTime,
        estimatedRunningTimeSeconds,
        estimatedMaxRunningTimeSeconds,
        program,
        runtime,
        sessionId,
        state,
      ];

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum JobType {
  iqx,
  runtime,
}

enum RunMode {
  fairshare,
  dedicated,
  priority,
  session,
}
