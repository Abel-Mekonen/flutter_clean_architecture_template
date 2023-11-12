import 'package:homme/constants/string_constants.dart';
import 'package:homme/data/local/pref/pref.dart';
import 'package:homme/data/remote/client/auth_client.dart';
import 'package:homme/data/remote/model/login_dto.dart';
import 'package:homme/data/remote/model/login_response_dto.dart';
import 'package:homme/domain/entity/login.dart';
import 'package:homme/domain/entity/login_response.dart';
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
  Future<Resource<LoginResponse>> login(Login login) async {
    var response =
        await handleApiCall(_authClient.login(LoginDto.fromLogin(login)));
    if (response is Success) {
      SharedPreference.setString(tokenKey, response.data!.token);
      return Success(response.data!.toLoginResponse());
    } else {
      return Error(response.error!);
    }
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
