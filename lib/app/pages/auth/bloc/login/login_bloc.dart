import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homme/app/core/auth/cubit/auth_cubit.dart';
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
  final AuthCubit _authCubit;
  LoginBloc(this._authRepository, this._authCubit) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      var response = await _authRepository.login(event.login);
      response.fold(
          onSuccess: (data) {
            _authCubit.authenticated();
            emit(const _Success());
          },
          onError: (error) => emit(_Error(error.message)));
    });
  }
}
