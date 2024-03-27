import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_usage.g.dart';

/// Model for instance usage by user
@JsonSerializable(createToJson: false)
class UserUsage extends Equatable {
  /// The usage period
  final ({DateTime start, DateTime end}) period;

  /// Array of usage data by instance
  final List<
      ({
        String instance,
        double quota,
        double usage,
        int pendingJobs,
        int maxPendingJobs,
      })> byInstance;

  const UserUsage({
    required this.period,
    required this.byInstance,
  });

  @override
  List<Object> get props => [period, byInstance];

  factory UserUsage.fromJson(Map<String, dynamic> json) =>
      _$UserUsageFromJson(json);
}
