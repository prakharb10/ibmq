part of 'version_cubit.dart';

sealed class VersionState extends Equatable {
  const VersionState();

  @override
  List<Object> get props => [];
}

final class VersionInitial extends VersionState {}

final class VersionLoadInProgress extends VersionState {}

final class VersionLoadSuccess extends VersionState {
  final String version;

  const VersionLoadSuccess(this.version);

  @override
  List<Object> get props => [version];
}

final class VersionLoadFailure extends VersionState {
  final String error;

  const VersionLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
