import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:homme/data/remote/client/auth_client.dart';
import 'package:homme/data/remote/client/user_client.dart';
import 'package:homme/domain/config/network_config.dart';
import 'package:homme/util/jwt_interceptor.dart';
import 'package:homme/util/log_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio dio(
    INetworkConfig config,
    LogInterceptor logInterceptor,
    JwtInterceptor jwtInterceptor,
  ) {
    Dio dio = Dio();
    dio.options.headers = config.headers;
    return dio..interceptors.addAll([
      logInterceptor,
      jwtInterceptor,
      ]);
  }

  @singleton
  AuthClient authClient(Dio dio) => AuthClient(dio);

  @singleton
  UserClient userClient(Dio dio) => UserClient(dio);

  
}