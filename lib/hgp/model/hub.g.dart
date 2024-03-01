// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hub.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hub _$HubFromJson(Map<String, dynamic> json) => Hub(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      class_: json['class'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      priority: json['priority'] as int,
      groups: (json['groups'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Group.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$HubToJson(Hub instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'class': instance.class_,
      'creationDate': instance.creationDate.toIso8601String(),
      'priority': instance.priority,
      'groups': instance.groups,
    };
