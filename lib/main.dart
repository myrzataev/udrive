import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/data/data_source/create_user_repo.dart';
import 'package:udrive/data/data_source/login_ds.dart';
import 'package:udrive/presentation/blocs/create_user_bloc/create_user_bloc.dart';
import 'package:udrive/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:udrive/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => CreateUserRepo()),
        RepositoryProvider(create: (context) => LoginDs())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CreateUserBloc(
                  createUserRepo:
                      RepositoryProvider.of<CreateUserRepo>(context))),
          BlocProvider(
              create: (context) =>
                  LoginBloc(loginDs: RepositoryProvider.of<LoginDs>(context)))
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            theme: ThemeData(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
