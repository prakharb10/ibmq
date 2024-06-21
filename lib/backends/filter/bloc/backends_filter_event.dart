part of 'backends_filter_bloc.dart';

@freezed
class BackendsFilterEvent with _$BackendsFilterEvent {
  const factory BackendsFilterEvent.started() = _Started;
  const factory BackendsFilterEvent.backendsChanged(IList<Backend> backends) =
      _BackendsChanged;
  const factory BackendsFilterEvent.sortBy({
    required int columnIndex,
    required bool ascending,
  }) = _SortBy;
  const factory BackendsFilterEvent.searchChanged(String search) =
      _SearchChanged;
  const factory BackendsFilterEvent.featuresChanged(List<String> features) =
      _FeaturesChanged;
}
