import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/backends/data/backends_repository.dart';
import 'package:ibmq/backends/model/backend.dart';

part 'backends_event.dart';
part 'backends_state.dart';
part 'backends_bloc.freezed.dart';

class BackendsBloc extends Bloc<BackendsEvent, BackendsState> {
  final BackendsRepository _backendsRepository;
  BackendsBloc({required BackendsRepository backendsRepository})
      : _backendsRepository = backendsRepository,
        super(const Initial()) {
    on<_BackendsFetched>((event, emit) async {
      emit(const Loading());
      switch (await _backendsRepository.getBackends().run()) {
        case Left(:final value):
          emit(Failure(value));
          break;
        case Right(:final value):
          emit(Success(value));
          break;
      }
    });
  }
}
