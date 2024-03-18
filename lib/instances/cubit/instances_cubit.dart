import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/instances/instances_repository.dart';

part 'instances_state.dart';

class InstancesCubit extends Cubit<InstancesState> {
  final InstancesRepository _instancesRepository;

  InstancesCubit({required InstancesRepository instancesRepository})
      : _instancesRepository = instancesRepository,
        super(InstancesInitial());

  /// Load the user instances
  ///
  /// Emits [InstancesLoadInProgress] while the instances are being loaded.
  ///
  /// Emits [InstancesLoadSuccess] with the list of instances if the request is
  /// successful.
  ///
  /// Emits [InstancesLoadFailure] with the error message if the request fails.
  Future<void> loadInstances() async {
    emit(InstancesLoadInProgress());
    switch (await _instancesRepository.getUserInstances().run()) {
      case Left(value: final l):
        emit(InstancesLoadFailure(error: l));
        break;
      case Right(value: final r):
        emit(InstancesLoadSuccess(instances: r));
        break;
      default:
    }
  }
}
