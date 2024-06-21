import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/backends/filter/backends_filter.dart';
import 'package:ibmq/backends/model/backend.dart';

part 'backends_filter_event.dart';
part 'backends_filter_state.dart';
part 'backends_filter_bloc.freezed.dart';

class BackendsFilterBloc
    extends Bloc<BackendsFilterEvent, BackendsFilterState> {
  final IList<Backend> backends;
  BackendsFilterBloc({required this.backends})
      : super(Initial(backends: backends)) {
    on<_BackendsChanged>((event, emit) {
      emit(switch (state) {
        Filtered(:final filter) => Filtered(
            filter: filter,
            backends: switch (filter.sortColumn) {
              Some(:final value) =>
                sortBackends(value, filter.sortAscending, event.backends),
              None() => event.backends,
            },
          ),
        _ => Initial(backends: event.backends),
      });
    });
    on<_SortBy>((event, emit) {
      // Sort column indexes to properties
      // 1 -> qubits
      // 2 -> eplg
      // 3 -> clops
      // 5 -> pending jobs
      emit(switch (state) {
        Filtered(:final filter, :final backends) => Filtered(
            filter: filter.copyWith(
              sortColumn: Option.of(event.columnIndex),
              sortAscending: event.ascending,
            ),
            backends:
                sortBackends(event.columnIndex, event.ascending, backends),
          ),
        _ => Filtered(
            filter: BackendsFilter(
              sortColumn: Option.of(event.columnIndex),
              sortAscending: event.ascending,
            ),
            backends:
                sortBackends(event.columnIndex, event.ascending, backends),
          ),
      });
    });
  }

  IList<Backend> sortBackends(
      int sortColumn, bool ascending, IList<Backend> backends) {
    return switch (sortColumn) {
      1 => ascending
          ? backends.sort((a, b) => a.qubits.compareTo(b.qubits))
          : backends.sort((a, b) => b.qubits.compareTo(a.qubits)),
      2 => ascending
          ? backends
              .sort((a, b) => a.performance.eplg.compareTo(b.performance.eplg))
          : backends
              .sort((a, b) => b.performance.eplg.compareTo(a.performance.eplg)),
      5 => ascending
          ? backends.sort((a, b) => a.queueLength.compareTo(b.queueLength))
          : backends.sort((a, b) => b.queueLength.compareTo(a.queueLength)),
      _ => backends,
    };
  }
}
