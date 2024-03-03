import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:ibmq/hgp/model/project.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

/// Model for a group within a [Hub].
@JsonSerializable()
class Group extends Equatable {
  /// The name of the group.
  final String name;

  /// The title of the group.
  final String title;

  /// The description of the group.
  final String description;

  /// The date the group was created.
  final DateTime creationDate;

  /// The group priority.
  final int priority;

  /// The projects associated with the group.
  final IMap<String, Project> projects;

  const Group({
    required this.name,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.priority,
    required this.projects,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  List<Object?> get props =>
      [name, title, description, creationDate, priority, projects];
}
