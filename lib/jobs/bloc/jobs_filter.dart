import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobs_filter.freezed.dart';

/// Class to model filter options for user jobs.
///
/// This class is used to filter the user jobs in the user jobs page.
@freezed
class JobsFilter with _$JobsFilter {
  factory JobsFilter({
    @Default(Option.none()) Option<String> provider,
    @Default(Option.none()) Option<bool> pending,
    @Default(Option.none()) Option<List<String>> backend,
    @Default(Option.of('DESC')) Option<String> sort,
    @Default(Option.none()) Option<int> limit,
    @Default(Option.none()) Option<int> offset,
    @Default(Option.none()) Option<DateTime> createdAfter,
    @Default(Option.none()) Option<DateTime> createdBefore,
    @Default(Option.none()) Option<List<String>> tags,
    @Default(Option.none()) Option<String> program,
    @Default(Option.none()) Option<String> sessionId,
    @Default(Option.none()) Option<String> search,
  }) = _JobsFilter;
}
