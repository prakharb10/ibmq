import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:ibmq/hgp/model/group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hub.g.dart';

/// Model class for a hub.
@JsonSerializable()
class Hub extends Equatable {
  /// The ID of the hub.
  final String id;

  /// The name of the hub.
  final String name;

  /// The title of the hub.
  final String title;

  /// The class of the hub.
  @JsonKey(name: 'class')
  final String class_;

  /// The date the hub was created.
  final DateTime creationDate;

  /// The hub priority.
  final int priority;

  /// The groups associated with the hub.
  final IMap<String, Group> groups;

  const Hub({
    required this.id,
    required this.name,
    required this.title,
    required this.class_,
    required this.creationDate,
    required this.priority,
    required this.groups,
  });

  factory Hub.fromJson(Map<String, dynamic> json) => _$HubFromJson(json);

  Map<String, dynamic> toJson() => _$HubToJson(this);

  @override
  List<Object?> get props =>
      [id, name, title, class_, creationDate, priority, groups];
}
