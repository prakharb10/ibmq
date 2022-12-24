import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provider.g.dart';

/// The backend provider in a job
///
/// Contains the Hub/Group/Project information
@JsonSerializable()
class Provider extends Equatable {
  /// The hub name
  final String hub;

  /// The group name
  final String group;

  /// The project name
  final String project;

  /// The backend name
  final String backend;

  const Provider({
    required this.hub,
    required this.group,
    required this.project,
    required this.backend,
  });

  @override
  List<Object?> get props => [hub, group, project, backend];

  factory Provider.fromJson(Map<String, dynamic> json) =>
      _$ProviderFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderToJson(this);

  @override
  String toString() {
    return '$hub/$group/$project';
  }
}
