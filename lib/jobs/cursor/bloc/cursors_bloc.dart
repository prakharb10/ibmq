import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/jobs/cursor/model/paging_cursor.dart';
import 'package:ibmq/jobs/model/job.dart';
import 'package:ibmq/jobs/model/runtime_job.dart';

part 'cursors_event.dart';
part 'cursors_state.dart';

class CursorsBloc extends Bloc<CursorsEvent, CursorsState> {
  /// Cursor for the jobs API
  PagingCursor<Job> cursor = const PagingCursor<Job>();

  /// Cursor for Runtime jobs API
  PagingCursor<RuntimeJob> runtimeCursor = const PagingCursor<RuntimeJob>();

  CursorsBloc() : super(CursorInitial()) {
    on<GetCursors>((event, emit) {
      emit(CursorsLoaded(cursor: cursor, runtimeCursor: runtimeCursor));
    });

    on<UpdateCursors>((event, emit) {
      cursor = event.cursor;
      runtimeCursor = event.runtimeCursor;
      emit(CursorsLoaded(cursor: cursor, runtimeCursor: runtimeCursor));
    });

    on<ResetCursors>((event, emit) {
      cursor = const PagingCursor<Job>();
      runtimeCursor = const PagingCursor<RuntimeJob>();
      emit(CursorsLoaded(cursor: cursor, runtimeCursor: runtimeCursor));
    });
  }
}
