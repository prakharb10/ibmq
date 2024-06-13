part of 'backends_bloc.dart';

@freezed
class BackendsEvent with _$BackendsEvent {
  const factory BackendsEvent.started() = _Started;
  const factory BackendsEvent.backendsFetched() = _BackendsFetched;
}
