// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_usage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUsage _$UserUsageFromJson(Map<String, dynamic> json) => UserUsage(
      period: _$recordConvert(
        json['period'],
        ($jsonValue) => (
          end: DateTime.parse($jsonValue['end'] as String),
          start: DateTime.parse($jsonValue['start'] as String),
        ),
      ),
      byInstance: (json['byInstance'] as List<dynamic>)
          .map((e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  instance: $jsonValue['instance'] as String,
                  maxPendingJobs: ($jsonValue['maxPendingJobs'] as num).toInt(),
                  pendingJobs: ($jsonValue['pendingJobs'] as num).toInt(),
                  quota: ($jsonValue['quota'] as num).toDouble(),
                  usage: ($jsonValue['usage'] as num).toDouble(),
                ),
              ))
          .toList(),
    );

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
