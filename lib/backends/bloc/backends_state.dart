part of 'backends_bloc.dart';

@freezed
class BackendsState with _$BackendsState {
  const factory BackendsState.initial() = Initial;
  const factory BackendsState.loading() = Loading;
  const factory BackendsState.success(IList<Backend> backends) = Success;
  const factory BackendsState.failure(String message) = Failure;
}
