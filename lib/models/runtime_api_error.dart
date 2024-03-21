import 'package:json_annotation/json_annotation.dart';

part 'runtime_api_error.g.dart';

/// Class to represent an error response from the Runtime API
@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
final class RuntimeAPIError {
  final int code;
  final String message;
  final String solution;
  final String moreInfo;

  RuntimeAPIError({
    required this.code,
    required this.message,
    required this.solution,
    required this.moreInfo,
  });

  factory RuntimeAPIError.fromJson(Map<String, dynamic> json) =>
      _$RuntimeAPIErrorFromJson(json);
}
