import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homme/app/core/auth/cubit/auth_cubit.dart';
import 'package:homme/domain/repository/auth_repository.dart';
import 'package:homme/util/resource.dart';
import 'package:injectable/injectable.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

@injectable
class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthCubit _authCubit;
  final IAuthRepository _authRepository;
  LogoutBloc(this._authCubit, this._authRepository) : super(const _Initial()) {
    on<_Logout>((event, emit) async {
        var response = await _authRepository.logout();
        response.fold(
            onSuccess: (data) {
              _authCubit.unauthenticated();
              emit(const _Success());
            },
            onError: (error) => emit(_Error(error.message)));
      
    });
  }
}
