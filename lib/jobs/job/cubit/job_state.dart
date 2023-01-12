part of 'job_cubit.dart';

abstract class JobState extends Equatable {
  const JobState();

  @override
  List<Object> get props => [];
}

class JobInitial extends JobState {}

/// State when the job is loading
class JobLoading extends JobState {}

/// State when the job is loaded
class JobLoaded extends JobState {
  /// The job
  final Job job;

  const JobLoaded(this.job);

  @override
  List<Object> get props => [job];
}

/// State when the job failed to load
class JobLoadFailed extends JobState {
  /// The error message
  final String message;

  const JobLoadFailed(this.message);

  @override
  List<Object> get props => [message];
}
