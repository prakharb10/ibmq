part of 'runtime_bloc.dart';

abstract class RuntimeEvent extends Equatable {
  const RuntimeEvent();

  @override
  List<Object> get props => [];
}

/// Event for fetching the result of a runtime job
class RuntimeResultFetched extends RuntimeEvent {
  /// Job ID
  final String jobId;

  const RuntimeResultFetched({required this.jobId});

  @override
  List<Object> get props => [jobId];
}
