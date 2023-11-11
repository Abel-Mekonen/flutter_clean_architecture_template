import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homme/domain/entity/login.dart';
import 'package:homme/domain/repository/auth_repository.dart';
import 'package:homme/util/resource.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthRepository _authRepository;
  LoginBloc(this._authRepository) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      var response = await _authRepository.login(event.login);
      response.fold(
          onSuccess: (data) => emit(const _Success()),
          onError: (error) => emit(const _Error()));
    });
  }
}
