import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:ibmq/jobs/model/job.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_jobs.g.dart';

/// Model class for response from the API when listing user jobs
@JsonSerializable(createToJson: false)
class UserJobs extends Equatable {
  /// The list of jobs
  final IList<Job> jobs;

  /// The total number of jobs
  final int count;

  /// Offset of the jobs
  final int offset;

  /// Limit of the jobs
  final int limit;

  const UserJobs({
    required this.jobs,
    required this.count,
    required this.offset,
    required this.limit,
  });

  @override
  List<Object> get props => [jobs, count, offset, limit];

  factory UserJobs.fromJson(Map<String, dynamic> json) =>
      _$UserJobsFromJson(json);
}
