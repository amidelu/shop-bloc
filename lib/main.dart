import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/dashboard/dashboard_page.dart';
import 'package:learning_shop_bloc/sign_in/pages/sign_in_page.dart';
import 'package:learning_shop_bloc/welcome/bloc/welcome_bloc.dart';
import 'package:learning_shop_bloc/welcome/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        /// Others BlocProvider will go here
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const WelcomePage(),
          routes: {
            'signIn': (context) => SignInPage(),
            'dashboard': (context) => DashboardPage(),
          },
        ),
      ),
    );
  }
}
