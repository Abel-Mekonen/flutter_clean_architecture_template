import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homme/app/navigation/navigator.dart';
import 'package:homme/app/pages/auth/bloc/login/login_bloc.dart';
import 'package:homme/domain/repository/auth_repository.dart';
import 'package:homme/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => getIt<LoginBloc>()),
      ], 
      child: Builder(
        builder: (context) => MaterialApp.router(
          title: 'Homme',
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
