part of 'data_clients_cubit.dart';

sealed class DataClientsState extends Equatable {
  const DataClientsState();

  @override
  List<Object> get props => [];
}

final class DataClientsInitial extends DataClientsState {}

final class DataClientsCreateSuccess extends DataClientsState {
  final HTTPDataProvider httpDataProvider;
  final RuntimeDataProvider runtimeDataProvider;

  const DataClientsCreateSuccess({
    required this.httpDataProvider,
    required this.runtimeDataProvider,
  });

  @override
  List<Object> get props => [httpDataProvider, runtimeDataProvider];
}

final class DataClientsCreateFailure extends DataClientsState {
  final String message;

  const DataClientsCreateFailure(this.message);

  @override
  List<Object> get props => [message];
}
