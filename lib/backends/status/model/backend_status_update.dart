import 'package:freezed_annotation/freezed_annotation.dart';

part 'backend_status_update.freezed.dart';
part 'backend_status_update.g.dart';

@freezed
class BackendStatusUpdate with _$BackendStatusUpdate {
  factory BackendStatusUpdate({
    required String type,
    required List<({String name, int lengthQueue})> data,
  }) = _BackendStatusUpdate;

  factory BackendStatusUpdate.fromJson(Map<String, dynamic> json) =>
      _$BackendStatusUpdateFromJson(json);
}
