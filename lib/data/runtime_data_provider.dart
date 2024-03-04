import 'package:dio/dio.dart';

/// Data Provider to interact with the IBM Runtime API
class RuntimeDataProvider {
  final Dio _dio;

  RuntimeDataProvider({required String accessToken, required Uri baseUrl})
      : _dio = Dio(
          BaseOptions(
            headers: {
              "X-Access-Token": accessToken,
            },
            baseUrl: baseUrl.toString(),
          ),
        );
}
