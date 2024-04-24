import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homme/app/core/auth/cubit/auth_cubit.dart';
import 'package:homme/app/pages/auth/bloc/login/login_bloc.dart';
import 'package:homme/app/pages/auth/login.dart';
import 'package:homme/app/pages/auth/signup.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppRouter {
  final AuthCubit authCubit;
  AppRouter(this.authCubit);

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
          name: 'home',
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const Login()),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) => const Signup(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = authCubit.state == const AuthState.authenticated();
      final bool loggingIn = state.name == '/login';
      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }
      if (loggingIn) {
        return '/';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
  );
}


class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
