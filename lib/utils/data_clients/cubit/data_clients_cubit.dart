import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/data/http_client.dart';
import 'package:ibmq/data/runtime_client.dart';

part 'data_clients_state.dart';

class DataClientsCubit extends Cubit<DataClientsState> {
  DataClientsCubit() : super(DataClientsInitial());

  /// Create the data clients
  void createDataClients({
    required String accessToken,
    required Uri httpBaseUrl,
    required Uri runtimeBaseUrl,
  }) {
    final dio = Dio(BaseOptions(
      headers: {
        "X-Access-Token": accessToken,
      },
    ));
    try {
      final httpClient = HttpClient(dio, baseUrl: httpBaseUrl.toString());
      final runtimeClient =
          RuntimeClient(dio, baseUrl: runtimeBaseUrl.toString());
      emit(DataClientsCreateSuccess(
        httpClient: httpClient,
        runtimeClient: runtimeClient,
      ));
    } catch (e) {
      emit(DataClientsCreateFailure(e.toString()));
    }
  }
}
