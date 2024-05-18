// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_jobs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJobs _$UserJobsFromJson(Map<String, dynamic> json) => UserJobs(
      jobs: IList<Job>.fromJson(
          json['jobs'], (value) => Job.fromJson(value as Map<String, dynamic>)),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );
