import 'package:dio/dio.dart';
import 'package:homme/constants/string_constants.dart';
import 'package:homme/data/local/pref/pref.dart';
import 'package:injectable/injectable.dart';

@injectable
class JwtInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler)  {
    var token = SharedPreference.getString(tokenKey);
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
