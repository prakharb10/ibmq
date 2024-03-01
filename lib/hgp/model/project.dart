import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Model for a project within a [Group].
///
/// The [devices] property is read but not parsed.
@JsonSerializable()
class Project extends Equatable {
  /// The name of the project.
  final String name;

  /// The title of the project.
  final String title;

  /// The description of the project.
  final String description;

  /// The date the project was created.
  final DateTime creationDate;

  /// The project priority.
  final int priority;

  /// The devices associated with the project.
  ///
  /// This is not parsed.
  final Map<String, dynamic> devices;

  const Project({
    required this.name,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.priority,
    required this.devices,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @override
  List<Object?> get props =>
      [name, title, description, creationDate, priority, devices];
}
