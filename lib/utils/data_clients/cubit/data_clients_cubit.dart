import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/data/http_data_provider.dart';
import 'package:ibmq/data/runtime_data_provider.dart';

part 'data_clients_state.dart';

class DataClientsCubit extends Cubit<DataClientsState> {
  DataClientsCubit() : super(DataClientsInitial());

  /// Create the data clients
  void createDataClients({
    required String accessToken,
    required Uri httpBaseUrl,
    required Uri runtimeBaseUrl,
  }) {
    try {
      final httpClient =
          HTTPDataProvider(accessToken: accessToken, baseUrl: httpBaseUrl);
      final runtimeClient = RuntimeDataProvider(
          accessToken: accessToken, baseUrl: runtimeBaseUrl);
      emit(DataClientsCreateSuccess(
        httpDataProvider: httpClient,
        runtimeDataProvider: runtimeClient,
      ));
    } catch (e) {
      emit(DataClientsCreateFailure(e.toString()));
    }
  }
}
