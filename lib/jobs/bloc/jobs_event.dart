part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

/// Event to request jobs
///
/// * [order] is the order of the jobs
/// * [limit] is the number of jobs to return
/// * [skip] is the number of jobs to skip
class JobsRequested extends JobsEvent {
  final String order;
  final int limit;
  final int skip;

  const JobsRequested({
    this.order = "creationDateDESC",
    this.limit = 10,
    required this.skip,
  });

  @override
  List<Object> get props => [order, limit, skip];

  @override
  String toString() =>
      'JobsRequested { order: $order, limit: $limit, skip: $skip }';
}
