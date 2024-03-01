import 'package:dio/dio.dart';
import 'package:ibmq/hgp/model/hub.dart';
import 'package:retrofit/retrofit.dart';

part 'http_client.g.dart';

@RestApi()
abstract class HttpClient {
  factory HttpClient(Dio dio, {String baseUrl}) = _HttpClient;

  @GET("/Network")
  Future<List<Hub>> getHGPs();
}
