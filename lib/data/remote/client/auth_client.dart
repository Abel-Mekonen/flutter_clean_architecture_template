import 'package:dio/dio.dart';
import 'package:homme/constants/string_constants.dart';
import 'package:homme/data/remote/model/jsend_response.dart';
import 'package:homme/data/remote/model/login_dto.dart';
import 'package:homme/data/remote/model/login_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';


@RestApi(baseUrl: baseUrl)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('v4/articles/')
  Future<HttpResponse<JSendResponse<LoginResponseDto>>> login(
      @Body() LoginDto loginDto);
}
