part of 'data_clients_cubit.dart';

sealed class DataClientsState extends Equatable {
  const DataClientsState();

  @override
  List<Object> get props => [];
}

final class DataClientsInitial extends DataClientsState {}

final class DataClientsCreateSuccess extends DataClientsState {
  final HttpClient httpClient;
  final RuntimeClient runtimeClient;

  const DataClientsCreateSuccess({
    required this.httpClient,
    required this.runtimeClient,
  });

  @override
  List<Object> get props => [httpClient, runtimeClient];
}

final class DataClientsCreateFailure extends DataClientsState {
  final String message;

  const DataClientsCreateFailure(this.message);

  @override
  List<Object> get props => [message];
}
