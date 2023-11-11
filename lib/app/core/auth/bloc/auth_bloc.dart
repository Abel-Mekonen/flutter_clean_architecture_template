import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homme/app/core/auth/cubit/auth_cubit.dart';
import 'package:homme/constants/string_constants.dart';
import 'package:homme/data/local/pref/pref.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthCubit _authCubit;
  AuthBloc(this._authCubit) : super(const _Initial()) {
    on<_UpdateAuthStatus>((event, emit) {
      var token = SharedPreference.getString(tokenKey);
      if (token != null) {
        _authCubit.authenticated();
      } else {
        _authCubit.unauthenticated();
      }
    });
  }
}
