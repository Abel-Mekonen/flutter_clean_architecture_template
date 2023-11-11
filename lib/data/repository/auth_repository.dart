import 'package:homme/data/remote/client/auth_client.dart';
import 'package:homme/domain/entity/login.dart';
import 'package:homme/domain/repository/auth_repository.dart';
import 'package:homme/util/resource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final AuthClient _authClient;

  AuthRepository(this._authClient);

  @override
  Future<Resource<void>> getProfile() async {
   // TODO: implement getProfile
   throw UnimplementedError(); 
  }

  @override
  Future<Resource<void>> login(Login login) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Resource<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Resource<void>> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
