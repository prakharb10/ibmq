// ignore_for_file: constant_identifier_names

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
  @JsonValue("Running")
  RUNNING,
  completed,
  @JsonValue("Completed")
  COMPLETED,
  pendingInQueue,
  queued,
  @JsonValue("Queued")
  QUEUED,
  cancelled,
  @JsonValue("Cancelled")
  CANCELLED,
  @JsonValue("CANCELLED - RAN TOO LONG")
  cancelledRanTooLong,
  failed,
  @JsonValue("Failed")
  FAILED,
  errorCreatingJob,
  errorValidatingJob,
  errorTranspilingJob,
  errorRunningJob,
}
