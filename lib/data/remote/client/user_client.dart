
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../constants/string_constants.dart';

part 'user_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @GET('profile')
  Future<void> getProfile();
}