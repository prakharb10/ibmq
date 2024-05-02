import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/user/jobs_updates/model/job_status_update.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';
part 'notifications_bloc.freezed.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const Initial()) {
    on<_Received>((event, emit) {
      switch (state) {
        case const Initial():
          emit(Loaded({event.jobStatusUpdate.id: event.jobStatusUpdate}));
          break;
        case Loaded(:final jobStatusUpdates):
          final updates = {...jobStatusUpdates};
          if (updates.containsKey(event.jobStatusUpdate.id)) {
            updates.remove(event.jobStatusUpdate.id);
          }
          updates[event.jobStatusUpdate.id] = event.jobStatusUpdate;
          emit(Loaded(updates));
          break;
      }
    });
    on<_ClearAll>((event, emit) {
      emit(const Initial());
    });
    on<_Clear>((event, emit) {
      switch (state) {
        case const Initial():
          break;
        case Loaded(:final jobStatusUpdates):
          final updates = {...jobStatusUpdates};
          updates.remove(event.jobStatusUpdate.id);
          if (updates.isEmpty) {
            emit(const Initial());
          } else {
            emit(Loaded(updates));
          }
          break;
      }
    });
  }
}
