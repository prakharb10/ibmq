// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobsLoaded _$JobsLoadedFromJson(Map<String, dynamic> json) => JobsLoaded(
      skip: JobsLoaded._readMeta(json, 'skip') as int,
      limit: JobsLoaded._readMeta(json, 'limit') as int,
      count: JobsLoaded._readMeta(json, 'count') as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobsLoadedToJson(JobsLoaded instance) =>
    <String, dynamic>{
      'skip': instance.skip,
      'limit': instance.limit,
      'count': instance.count,
      'items': instance.items,
    };
