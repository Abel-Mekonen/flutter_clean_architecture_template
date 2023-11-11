import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homme/domain/entity/login.dart';

part 'login_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginDto {
  final String email;
  final String password;

  LoginDto({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
  

  factory LoginDto.fromLogin(Login login) {
    return LoginDto(email: login.email, password: login.password);
  }

  Login toLogin() {
    return Login(email: email, password: password);
  }
}
