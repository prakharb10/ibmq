part of 'backends_filter_bloc.dart';

@freezed
class BackendsFilterState with _$BackendsFilterState {
  const factory BackendsFilterState.initial({
    required IList<Backend> backends,
  }) = Initial;
  const factory BackendsFilterState.filtered({
    required BackendsFilter filter,
    required IList<Backend> backends,
  }) = Filtered;
}
