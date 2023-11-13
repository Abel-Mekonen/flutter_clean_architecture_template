import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homme/app/core/widgets/dismiss_keyboard.dart';
import 'package:homme/app/navigation/navigator.dart';
import 'package:homme/app/pages/auth/bloc/login/login_bloc.dart';
import 'package:homme/injection.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        builder: (context) => MaterialApp(
          title: 'Property Management',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: SafeArea(
              child: DismissKeyboard(
                child: ResponsiveSizer(
                  builder: (context, orientation, screenType) =>
                      MaterialApp.router(
                    routerConfig: getIt<AppRouter>().router,
                    debugShowCheckedModeBanner: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
