import 'package:equatable/equatable.dart';
import 'package:ibmq/utils/job_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info_queue.g.dart';

/// Model class for a job info queue
@JsonSerializable()
class InfoQueue extends Equatable {
  /// The job status
  ///
  /// See [JobStatus] for possible values
  final JobStatus status;

  /// Position in the queue
  final int position;

  /// Position of the provider
  final int providerPosition;

  /// Priority of the hub
  final int hubPriority;

  /// Priority of the group
  final int groupPriority;

  /// Priority of the project
  final int projectPriority;

  /// Estimated time to start
  final DateTime estimatedStartTime;

  /// Estimated time to finish
  final DateTime estimatedCompleteTime;

  const InfoQueue({
    required this.status,
    required this.position,
    required this.providerPosition,
    required this.hubPriority,
    required this.groupPriority,
    required this.projectPriority,
    required this.estimatedStartTime,
    required this.estimatedCompleteTime,
  });

  @override
  List<Object> get props => [
        status,
        position,
        providerPosition,
        hubPriority,
        groupPriority,
        projectPriority,
        estimatedStartTime,
        estimatedCompleteTime,
      ];

  factory InfoQueue.fromJson(Map<String, dynamic> json) =>
      _$InfoQueueFromJson(json);

  Map<String, dynamic> toJson() => _$InfoQueueToJson(this);
}
