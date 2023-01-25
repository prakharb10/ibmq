part of 'cursors_bloc.dart';

abstract class CursorsState extends Equatable {
  const CursorsState();

  @override
  List<Object> get props => [];
}

class CursorInitial extends CursorsState {}

class CursorsLoaded extends CursorsState {
  final PagingCursor<Job> cursor;
  final PagingCursor<RuntimeJob> runtimeCursor;

  const CursorsLoaded({
    required this.cursor,
    required this.runtimeCursor,
  });

  @override
  List<Object> get props => [cursor, runtimeCursor];
}
