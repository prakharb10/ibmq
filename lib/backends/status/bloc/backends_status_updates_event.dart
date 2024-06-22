part of 'backends_status_updates_bloc.dart';

@freezed
class BackendsStatusUpdatesEvent with _$BackendsStatusUpdatesEvent {
  const factory BackendsStatusUpdatesEvent.started() = _Started;
}