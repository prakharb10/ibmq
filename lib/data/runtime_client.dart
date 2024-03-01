import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'runtime_client.g.dart';

@RestApi()
abstract class RuntimeClient {
  factory RuntimeClient(Dio dio, {String baseUrl}) = _RuntimeClient;
}
