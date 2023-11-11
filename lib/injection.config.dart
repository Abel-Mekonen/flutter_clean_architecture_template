// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:homme/app/navigation/navigator.dart' as _i14;
import 'package:homme/app/pages/auth/bloc/login/login_bloc.dart' as _i13;
import 'package:homme/data/remote/client/auth_client.dart' as _i10;
import 'package:homme/data/remote/client/user_client.dart' as _i9;
import 'package:homme/data/remote/config/network_config.dart' as _i4;
import 'package:homme/data/repository/auth_repository.dart' as _i12;
import 'package:homme/di/app_module.dart' as _i15;
import 'package:homme/domain/config/network_config.dart' as _i3;
import 'package:homme/domain/repository/auth_repository.dart' as _i11;
import 'package:homme/util/jwt_interceptor.dart' as _i5;
import 'package:homme/util/log_interceptor.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.INetworkConfig>(() => _i4.NetworkConfig());
    gh.factory<_i5.JwtInterceptor>(() => _i5.JwtInterceptor());
    gh.singleton<_i6.LogInterceptor>(_i6.LogInterceptor());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i8.Dio>(appModule.dio(
      gh<_i3.INetworkConfig>(),
      gh<_i6.LogInterceptor>(),
      gh<_i5.JwtInterceptor>(),
    ));
    gh.singleton<_i9.UserClient>(appModule.userClient(gh<_i8.Dio>()));
    gh.singleton<_i10.AuthClient>(appModule.authClient(gh<_i8.Dio>()));
    gh.lazySingleton<_i11.IAuthRepository>(
        () => _i12.AuthRepository(gh<_i10.AuthClient>()));
    gh.factory<_i13.LoginBloc>(
        () => _i13.LoginBloc(gh<_i11.IAuthRepository>()));
    gh.factory<_i14.AppRouter>(() => _i14.AppRouter(gh<_i13.LoginBloc>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
