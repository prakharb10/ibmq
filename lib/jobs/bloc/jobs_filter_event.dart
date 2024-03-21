part of 'jobs_filter_bloc.dart';

@freezed
class JobsFilterEvent with _$JobsFilterEvent {
  const factory JobsFilterEvent.started() = _Started;
  const factory JobsFilterEvent.providerChanged({required String provider}) =
      _ProviderChanged;
  const factory JobsFilterEvent.pendingChanged({required bool pending}) =
      _PendingChanged;
  const factory JobsFilterEvent.backendChanged(
      {required List<String> backend}) = _BackendChanged;
  const factory JobsFilterEvent.sortChanged({required String sort}) =
      _SortChanged;
  const factory JobsFilterEvent.limitChanged({required int limit}) =
      _LimitChanged;
  const factory JobsFilterEvent.offsetChanged({required int offset}) =
      _OffsetChanged;
  const factory JobsFilterEvent.createdAfterChanged(
      {required DateTime createdAfter}) = _CreatedAfterChanged;
  const factory JobsFilterEvent.createdBeforeChanged(
      {required DateTime createdBefore}) = _CreatedBeforeChanged;
  const factory JobsFilterEvent.tagsChanged({required List<String> tags}) =
      _TagsChanged;
  const factory JobsFilterEvent.programChanged({required String program}) =
      _ProgramChanged;
  const factory JobsFilterEvent.sessionIdChanged({required String sessionId}) =
      _SessionIdChanged;
  const factory JobsFilterEvent.searchChanged({required String search}) =
      _SearchChanged;
}
