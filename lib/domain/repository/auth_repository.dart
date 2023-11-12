
import 'package:homme/domain/entity/login.dart';
import 'package:homme/domain/entity/login_response.dart';
import 'package:homme/util/resource.dart';

abstract class IAuthRepository {
  Future<Resource<LoginResponse>> login(Login login);
  Future<Resource<void>> register(String email, String password);
  Future<Resource<void>> logout();
  Future<Resource<void>> getProfile();}