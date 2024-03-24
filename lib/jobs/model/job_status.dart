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
  Running,
  completed,
  @JsonValue("Completed")
  Completed,
  pendingInQueue,
  queued,
  @JsonValue("Queued")
  Queued,
  cancelled,
  @JsonValue("Cancelled")
  Cancelled,
  @JsonValue("CANCELLED - RAN TOO LONG")
  cancelledRanTooLong,
  failed,
  @JsonValue("Failed")
  Failed,
  errorCreatingJob,
  errorValidatingJob,
  errorTranspilingJob,
  errorRunningJob,
}
