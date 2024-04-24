import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  void authenticated() => emit(const AuthState.authenticated());
  void unauthenticated() => emit(const AuthState.unauthenticated());
}
