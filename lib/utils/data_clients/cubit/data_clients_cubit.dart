import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/backends/status/data/wss_data_provider.dart';
import 'package:ibmq/data/http_data_provider.dart';
import 'package:ibmq/data/runtime_data_provider.dart';
import 'package:ibmq/utils/talker.dart';

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
      final wssClient = WssDataProvider(accessToken: accessToken);
      emit(DataClientsCreateSuccess(
        httpDataProvider: httpClient,
        runtimeDataProvider: runtimeClient,
        wssDataProvider: wssClient,
      ));
    } catch (e) {
      talker.error('Failed to create data clients', e);
      emit(DataClientsCreateFailure(e.toString()));
    }
  }
}
