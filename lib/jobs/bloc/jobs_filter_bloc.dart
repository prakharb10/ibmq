import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/jobs/bloc/jobs_filter.dart';

part 'jobs_filter_event.dart';
part 'jobs_filter_state.dart';
part 'jobs_filter_bloc.freezed.dart';

class JobsFilterBloc extends Bloc<JobsFilterEvent, JobsFilterState> {
  JobsFilterBloc() : super(const Initial()) {
    on<_ProviderChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(provider: Option.of(event.provider)),
          _ => JobsFilter(provider: Option.of(event.provider)),
        }),
      );
    });
    on<_PendingChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(pending: Option.of(event.pending)),
          _ => JobsFilter(pending: Option.of(event.pending)),
        }),
      );
    });
    on<_BackendChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(backend: Option.of(event.backend)),
          _ => JobsFilter(backend: Option.of(event.backend)),
        }),
      );
    });
    on<_SortChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(sort: Option.of(event.sort)),
          _ => JobsFilter(sort: Option.of(event.sort)),
        }),
      );
    });
    on<_LimitChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(limit: Option.of(event.limit)),
          _ => JobsFilter(limit: Option.of(event.limit)),
        }),
      );
    });
    on<_OffsetChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(offset: Option.of(event.offset)),
          _ => JobsFilter(offset: Option.of(event.offset)),
        }),
      );
    });
    on<_CreatedAfterChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(createdAfter: Option.of(event.createdAfter)),
          _ => JobsFilter(createdAfter: Option.of(event.createdAfter)),
        }),
      );
    });
    on<_CreatedBeforeChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(createdBefore: Option.of(event.createdBefore)),
          _ => JobsFilter(createdBefore: Option.of(event.createdBefore)),
        }),
      );
    });
    on<_TagsChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(tags: Option.of(event.tags)),
          _ => JobsFilter(tags: Option.of(event.tags)),
        }),
      );
    });
    on<_ProgramChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(program: Option.of(event.program)),
          _ => JobsFilter(program: Option.of(event.program)),
        }),
      );
    });
    on<_SessionIdChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(sessionId: Option.of(event.sessionId)),
          _ => JobsFilter(sessionId: Option.of(event.sessionId)),
        }),
      );
    });
    on<_SearchChanged>((event, emit) {
      emit(
        Filtered(
            filter: switch (state) {
          Filtered(:final filter) =>
            filter.copyWith(search: Option.of(event.search)),
          _ => JobsFilter(search: Option.of(event.search)),
        }),
      );
    });
  }
}
