// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:homme/app/core/auth/bloc/auth_bloc.dart' as _i11;
import 'package:homme/app/core/auth/cubit/auth_cubit.dart' as _i4;
import 'package:homme/app/navigation/navigator.dart' as _i10;
import 'package:homme/app/pages/auth/bloc/login/login_bloc.dart' as _i17;
import 'package:homme/app/pages/auth/bloc/logout/logout_bloc.dart' as _i18;
import 'package:homme/data/local/db/app_database.dart' as _i3;
import 'package:homme/data/remote/client/auth_client.dart' as _i14;
import 'package:homme/data/remote/client/user_client.dart' as _i13;
import 'package:homme/data/remote/config/network_config.dart' as _i6;
import 'package:homme/data/repository/auth_repository.dart' as _i16;
import 'package:homme/di/app_module.dart' as _i19;
import 'package:homme/domain/config/network_config.dart' as _i5;
import 'package:homme/domain/repository/auth_repository.dart' as _i15;
import 'package:homme/util/jwt_interceptor.dart' as _i7;
import 'package:homme/util/log_interceptor.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

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
    await gh.singletonAsync<_i3.AppDatabase>(
      () => appModule.appDatabase(),
      preResolve: true,
    );
    gh.factory<_i4.AuthCubit>(() => _i4.AuthCubit());
    gh.factory<_i5.INetworkConfig>(() => _i6.NetworkConfig());
    gh.factory<_i7.JwtInterceptor>(() => _i7.JwtInterceptor());
    gh.singleton<_i8.LogInterceptor>(_i8.LogInterceptor());
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i10.AppRouter>(() => _i10.AppRouter(gh<_i4.AuthCubit>()));
    gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(gh<_i4.AuthCubit>()));
    gh.singleton<_i12.Dio>(appModule.dio(
      gh<_i5.INetworkConfig>(),
      gh<_i8.LogInterceptor>(),
      gh<_i7.JwtInterceptor>(),
    ));
    gh.singleton<_i13.UserClient>(appModule.userClient(gh<_i12.Dio>()));
    gh.singleton<_i14.AuthClient>(appModule.authClient(gh<_i12.Dio>()));
    gh.lazySingleton<_i15.IAuthRepository>(
        () => _i16.AuthRepository(gh<_i14.AuthClient>()));
    gh.factory<_i17.LoginBloc>(() => _i17.LoginBloc(
          gh<_i15.IAuthRepository>(),
          gh<_i4.AuthCubit>(),
        ));
    gh.factory<_i18.LogoutBloc>(() => _i18.LogoutBloc(
          gh<_i4.AuthCubit>(),
          gh<_i15.IAuthRepository>(),
        ));
    return this;
  }
}

class _$AppModule extends _i19.AppModule {}
