import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/jobs/model/job_status.dart';

part 'job_status_update.freezed.dart';
part 'job_status_update.g.dart';

@freezed
class JobStatusUpdate with _$JobStatusUpdate {
  // TODO: Add fields in case Job Failed
  factory JobStatusUpdate({
    required String id,
    required JobStatus status,
    required String backend,
    required DateTime timestamp,
  }) = _JobStatusUpdate;

  factory JobStatusUpdate.fromJson(Map<String, dynamic> json) =>
      _$JobStatusUpdateFromJson(json);
}
