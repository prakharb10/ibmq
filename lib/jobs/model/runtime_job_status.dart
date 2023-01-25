import 'package:json_annotation/json_annotation.dart';

/// Enum for Runtime Job status
@JsonEnum(fieldRename: FieldRename.pascal)
enum RuntimeJobStatus {
  queued,
  running,
  completed,
  cancelled,
  @JsonValue("Cancelled - Ran too long")
  cancelledRanTooLong,
  failed,
}
