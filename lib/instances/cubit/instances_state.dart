part of 'instances_cubit.dart';

sealed class InstancesState extends Equatable {
  const InstancesState();

  @override
  List<Object> get props => [];
}

final class InstancesInitial extends InstancesState {}

final class InstancesLoadInProgress extends InstancesState {}

/// State to represent the instances loaded successfully
///
/// [instances] is the list of instances
final class InstancesLoadSuccess extends InstancesState {
  final IList<({String name, IBMQPlan plan})> instances;

  const InstancesLoadSuccess({required this.instances});

  @override
  List<Object> get props => [instances];
}

/// State to represent the instances failed to load
///
/// [error] is the error message
final class InstancesLoadFailure extends InstancesState {
  final String error;

  const InstancesLoadFailure({required this.error});

  @override
  List<Object> get props => [error];
}
