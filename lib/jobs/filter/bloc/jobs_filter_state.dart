part of 'jobs_filter_bloc.dart';

@freezed
class JobsFilterState with _$JobsFilterState {
  const factory JobsFilterState.initial() = Initial;
  const factory JobsFilterState.filtered({required JobsFilter filter}) =
      Filtered;
}
