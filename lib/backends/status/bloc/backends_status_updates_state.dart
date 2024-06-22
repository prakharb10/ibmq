part of 'backends_status_updates_bloc.dart';

@freezed
class BackendsStatusUpdatesState with _$BackendsStatusUpdatesState {
  const factory BackendsStatusUpdatesState.initial() = _Initial;
  const factory BackendsStatusUpdatesState.connecting() = Connecting;
  const factory BackendsStatusUpdatesState.listening(
      BackendStatusUpdate statusUpdate) = Listening;
}
