import 'package:json_annotation/json_annotation.dart';

/// Enum for job status
@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum JobStatus {
  creating,
  created,
  transpiling,
  transpiled,
  validating,
  validated,
  running,
  completed,
  pendingInQueue,
  queued,
  cancelled,
  @JsonValue("CANCELLED - RAN TOO LONG")
  cancelledRanTooLong,
  failed,
  errorCreatingJob,
  errorValidatingJob,
  errorTranspilingJob,
  errorRunningJob,
}
