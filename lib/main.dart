import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homme/app/core/auth/bloc/auth_bloc.dart';
import 'package:homme/app/core/auth/cubit/auth_cubit.dart';
import 'package:homme/app/navigation/navigator.dart';
import 'package:homme/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
      ], 
      child: Builder(
        builder: (context) => MaterialApp.router(
          title: 'Flutter CA Template',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerConfig: getIt<AppRouter>().router,
          routerDelegate: getIt<AppRouter>().router.routerDelegate,
          routeInformationParser: getIt<AppRouter>().router.routeInformationParser,
          debugShowCheckedModeBanner: false,
        ),));
  }
}
