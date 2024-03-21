part of 'jobs_bloc.dart';

sealed class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

final class UserJobsRequested extends JobsEvent {
  final Option<String> provider;
  final Option<bool> pending;
  final Option<List<String>> backend;
  final Option<String> sort;
  final Option<int> limit;
  final Option<int> offset;
  final Option<String> createdAfter;
  final Option<String> createdBefore;
  final Option<List<String>> tags;
  final Option<String> program;
  final Option<String> sessionId;
  final Option<String> search;

  const UserJobsRequested({
    this.provider = const Option.none(),
    this.pending = const Option.none(),
    this.backend = const Option.none(),
    this.sort = const Option.none(),
    this.limit = const Option.none(),
    this.offset = const Option.none(),
    this.createdAfter = const Option.none(),
    this.createdBefore = const Option.none(),
    this.tags = const Option.none(),
    this.program = const Option.none(),
    this.sessionId = const Option.none(),
    this.search = const Option.none(),
  });

  @override
  List<Object> get props => [
        provider,
        pending,
        backend,
        sort,
        limit,
        offset,
        createdAfter,
        createdBefore,
        tags,
        program,
        sessionId,
        search,
      ];
}
