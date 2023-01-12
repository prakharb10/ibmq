import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_backend.g.dart';

/// Model class for a backend for a job
@JsonSerializable()
class JobBackend extends Equatable {
  /// The backend name
  final String name;

  /// The backend id
  final String id;

  const JobBackend({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [name, id];

  factory JobBackend.fromJson(Map<String, dynamic> json) =>
      _$JobBackendFromJson(json);

  Map<String, dynamic> toJson() => _$JobBackendToJson(this);
}
