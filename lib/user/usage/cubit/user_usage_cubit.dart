import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/instances/instances_repository.dart';
import 'package:ibmq/user/usage/model/user_usage.dart';
import 'package:ibmq/utils/talker.dart';

part 'user_usage_state.dart';
part 'user_usage_cubit.freezed.dart';

class UserUsageCubit extends Cubit<UserUsageState> {
  final InstancesRepository _instancesRepository;
  UserUsageCubit({required InstancesRepository instancesRepository})
      : _instancesRepository = instancesRepository,
        super(const UserUsageState.initial());

  /// Load the user's usage data
  Future<void> loadUsage() async {
    emit(const UserUsageState.loadInProgress());
    switch (await _instancesRepository.loadUserUsage().run()) {
      case Left(:final value):
        talker.error('Failed to load user usage data', value);
        emit(UserUsageState.loadFailure(value));
        break;
      case Right(:final value):
        emit(UserUsageState.loadSuccess(value));
        break;
    }
  }
}
