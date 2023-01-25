part of 'jobs_cache_cubit.dart';

abstract class JobsCacheState extends Equatable {
  const JobsCacheState();

  @override
  List<Object> get props => [];
}

class JobsCacheInitial extends JobsCacheState {}

/// State when job cache is loaded.
class JobsCacheLoaded extends JobsCacheState {
  /// The list of jobs.
  final List<BaseJob> jobs;

  /// Creates a new state when job cache is loaded.
  const JobsCacheLoaded(this.jobs);

  @override
  List<Object> get props => [jobs];
}
