// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      name: json['name'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      priority: json['priority'] as int,
      devices: IMap<String, dynamic>.fromJson(
          json['devices'] as Map<String, dynamic>,
          (value) => value as String,
          (value) => value),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'creationDate': instance.creationDate.toIso8601String(),
      'priority': instance.priority,
      'devices': instance.devices.toJson(
        (value) => value,
        (value) => value,
      ),
    };
