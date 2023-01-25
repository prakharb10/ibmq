import 'package:equatable/equatable.dart';

/// A paging cursor for fetching jobs from the API.
///
/// The cursor stores the following information:
/// - `skip` - the number of jobs to skip (based on the number of jobs already
/// displayed from the previous call)
/// - `jobs` - a list of jobs that have already been fetched from the API
/// but not yet displayed
class PagingCursor<T> extends Equatable {
  /// The number of jobs to skip.
  final int skip;

  /// The list of jobs that have already been fetched from the API but not yet
  /// displayed.
  final List<T> jobs;

  /// Total number of jobs.
  final int total;

  /// Creates a new paging cursor.
  const PagingCursor({this.skip = 0, this.jobs = const [], this.total = 0});

  @override
  List<Object> get props => [skip, jobs];
}
