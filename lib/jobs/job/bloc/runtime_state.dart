part of 'runtime_bloc.dart';

abstract class RuntimeState extends Equatable {
  const RuntimeState();

  @override
  List<Object?> get props => [];
}

class RuntimeInitial extends RuntimeState {}

/// State for a runtime job that is in progress
class RuntimeResultInProgress extends RuntimeState {}

/// State for a runtime job that has failed
class RuntimeResultFailure extends RuntimeState {}

/// State for a runtime job that has succeeded
/// with a result of type [T]
class RuntimeResultSuccess<T> extends RuntimeState {
  /// Result of the runtime job
  final T result;

  const RuntimeResultSuccess({required this.result});

  @override
  List<Object?> get props => [result];
}
