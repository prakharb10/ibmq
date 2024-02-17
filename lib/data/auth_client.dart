import 'package:dio/dio.dart';
import 'package:ibmq/user/model/user.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: "https://auth.quantum-computing.ibm.com/api")
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST("/users/loginWithToken")
  Future<HttpResponse> tokenLogin(@Body() Map<String, dynamic> data);

  @GET("/users/me")
  Future<User> getUser(@Header("X-Access-Token") String accessToken);

  @GET("/version")
  Future<HttpResponse<Map<String, String>>> getVersion();
}
