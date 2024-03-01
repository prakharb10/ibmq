// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      name: json['name'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      priority: json['priority'] as int,
      projects: (json['projects'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Project.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'creationDate': instance.creationDate.toIso8601String(),
      'priority': instance.priority,
      'projects': instance.projects,
    };
