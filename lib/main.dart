import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/firebase_options.dart';
import 'package:learning_shop_bloc/pages/app_bloc_providers.dart';
import 'package:learning_shop_bloc/pages/register/pages/register_page.dart';

import 'pages/sign_in/pages/sign_in_page.dart';
import 'pages/welcome/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
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
            'signIn': (context) => const SignInPage(),
            'register': (context) => const RegisterPage(),
          },
        ),
      ),
    );
  }
}
