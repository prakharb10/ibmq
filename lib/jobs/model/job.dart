import 'package:equatable/equatable.dart';
import 'package:ibmq/jobs/model/job_backend.dart';
import 'package:ibmq/jobs/model/provider.dart';
import 'package:ibmq/utils/job_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

/// Model class for a job in the jobs list
///
/// This class is used to display a job in the jobs list
/// and to navigate to the job details page.
/// Contains limited information about the job.
@JsonSerializable()
class Job extends Equatable {
  /// The job id
  final String id;

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

  /// The job name
  final String? name;

  /// Tags associated with the job
  final List<String> tags;

  final bool liveDataEnabled;

  /// The job provider
  ///
  /// See [Provider] for more information
  final Provider provider;

  /// The job run mode
  final String? runMode;

  /// The user id
  final String userId;

  /// The job end date
  final DateTime? endDate;

  /// The job was created locally or remotely
  final String createdBy;

  const Job({
    required this.id,
    required this.backend,
    required this.status,
    required this.creationDate,
    this.name,
    required this.tags,
    required this.liveDataEnabled,
    required this.provider,
    this.runMode,
    required this.userId,
    this.endDate,
    required this.createdBy,
  });

  @override
  List<Object?> get props => [
        id,
        backend,
        status,
        creationDate,
        name,
        tags,
        liveDataEnabled,
        provider,
        runMode,
        userId,
        endDate,
        createdBy,
      ];

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}
