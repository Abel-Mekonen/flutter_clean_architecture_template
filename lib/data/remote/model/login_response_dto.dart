import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homme/domain/entity/login_response.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  final String token;

  LoginResponseDto({
    required this.token,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  LoginResponse toLoginResponse() => LoginResponse(token: token);
}
