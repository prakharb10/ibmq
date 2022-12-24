// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provider _$ProviderFromJson(Map<String, dynamic> json) => Provider(
      hub: json['hub'] as String,
      group: json['group'] as String,
      project: json['project'] as String,
      backend: json['backend'] as String,
    );

Map<String, dynamic> _$ProviderToJson(Provider instance) => <String, dynamic>{
      'hub': instance.hub,
      'group': instance.group,
      'project': instance.project,
      'backend': instance.backend,
    };
