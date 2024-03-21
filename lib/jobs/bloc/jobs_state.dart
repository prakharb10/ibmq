part of 'jobs_bloc.dart';

sealed class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

final class JobsInitial extends JobsState {}

final class JobsLoadInProgress extends JobsState {}

final class JobsLoadSuccess extends JobsState {
  final UserJobs userJobs;

  const JobsLoadSuccess({required this.userJobs});

  @override
  List<Object> get props => [userJobs];
}

final class JobsLoadFailure extends JobsState {
  final String error;

  const JobsLoadFailure({required this.error});

  @override
  List<Object> get props => [error];
}
