import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/backends/data/backends_repository.dart';
import 'package:ibmq/backends/model/backend.dart';

part 'backends_state.dart';
part 'backends_cubit.freezed.dart';

class BackendsCubit extends Cubit<BackendsState> {
  final BackendsRepository _backendsRepository;
  BackendsCubit({required BackendsRepository backendsRepository})
      : _backendsRepository = backendsRepository,
        super(const BackendsState.initial());

  Future<void> fetchBackends() async {
    emit(const Loading());
    switch (await _backendsRepository.getBackends().run()) {
      case Left(:final value):
        emit(Failure(value));
        break;
      case Right(:final value):
        emit(Success(value));
        break;
    }
  }
}
