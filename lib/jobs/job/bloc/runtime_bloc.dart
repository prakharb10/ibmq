import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/runtime_repository.dart';
import '../model/runtime_result.dart';

part 'runtime_event.dart';
part 'runtime_state.dart';

class RuntimeBloc extends Bloc<RuntimeEvent, RuntimeState> {
  final RuntimeRepository runtimeRepository;

  RuntimeBloc({required this.runtimeRepository}) : super(RuntimeInitial()) {
    on<RuntimeResultFetched>((event, emit) async {
      emit(RuntimeResultInProgress());
      try {
        final result = await runtimeRepository.getJobResults(event.jobId);
        if (result is EstimatorResult) {
          emit(RuntimeResultSuccess<EstimatorResult>(result: result));
        } else if (result is SamplerResult) {
          emit(RuntimeResultSuccess<SamplerResult>(result: result));
        } else {
          emit(RuntimeResultFailure());
        }
      } catch (e) {
        emit(RuntimeResultFailure());
      }
    });
  }
}
