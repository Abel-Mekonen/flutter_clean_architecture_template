import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponse {
  final String token;

  LoginResponse({
    required this.token,});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
