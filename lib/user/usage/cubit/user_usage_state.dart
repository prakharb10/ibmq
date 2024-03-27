part of 'user_usage_cubit.dart';

@freezed
class UserUsageState with _$UserUsageState {
  const factory UserUsageState.initial() = _Initial;
  const factory UserUsageState.loadInProgress() = LoadInProgress;
  const factory UserUsageState.loadSuccess(UserUsage userUsage) = LoadSuccess;
  const factory UserUsageState.loadFailure(String message) = LoadFailure;
}
