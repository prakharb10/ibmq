part of 'cursors_bloc.dart';

abstract class CursorsEvent extends Equatable {
  const CursorsEvent();

  @override
  List<Object> get props => [];
}

/// Event to get current cursors
class GetCursors extends CursorsEvent {}

/// Event to update cursors
///
/// [cursor] is the cursor for the jobs API
/// [runtimeCursor] is the cursor for the Runtime jobs API
class UpdateCursors extends CursorsEvent {
  final PagingCursor<Job> cursor;
  final PagingCursor<RuntimeJob> runtimeCursor;

  const UpdateCursors({
    required this.cursor,
    required this.runtimeCursor,
  });

  @override
  List<Object> get props => [cursor, runtimeCursor];
}

/// Event to reset cursors
class ResetCursors extends CursorsEvent {}
