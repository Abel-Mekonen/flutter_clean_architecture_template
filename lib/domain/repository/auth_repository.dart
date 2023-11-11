
import 'package:homme/domain/entity/login.dart';
import 'package:homme/util/resource.dart';

abstract class IAuthRepository {
  Future<Resource<void>> login(Login login);
  Future<Resource<void>> register(String email, String password);
  Future<Resource<void>> logout();
  Future<Resource<void>> getProfile();}