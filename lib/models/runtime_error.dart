import 'package:json_annotation/json_annotation.dart';

part 'runtime_error.g.dart';

/// Class to represent an error response from the Runtime API
@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
final class RuntimeError {
  final int code;
  final String message;
  final String solution;
  final String moreInfo;

  RuntimeError({
    required this.code,
    required this.message,
    required this.solution,
    required this.moreInfo,
  });

  factory RuntimeError.fromJson(Map<String, dynamic> json) =>
      _$RuntimeErrorFromJson(json);
}
