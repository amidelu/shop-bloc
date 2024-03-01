import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_shop_bloc/common/routes/app_routes.dart';
import 'package:learning_shop_bloc/global.dart';
import 'package:learning_shop_bloc/pages/application/application_page.dart';
import 'package:learning_shop_bloc/pages/application/bloc/app_bloc.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_bloc.dart';
import 'package:learning_shop_bloc/pages/home/home_page.dart';
import 'package:learning_shop_bloc/pages/register/bloc/register_bloc.dart';
import 'package:learning_shop_bloc/pages/register/pages/register_page.dart';
import 'package:learning_shop_bloc/pages/sign_in/bloc/bloc/sign_in_bloc.dart';
import 'package:learning_shop_bloc/pages/sign_in/pages/sign_in_page.dart';
import 'package:learning_shop_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:learning_shop_bloc/pages/welcome/pages/welcome_page.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: const WelcomePage(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignInPage(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.register,
        page: const RegisterPage(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.application,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.homePage,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBloc()),
      ),
    ];
  }

  // All Bloc Provider list for main.dart
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    for (var data in routes()) {
      blocProviders.add(data.bloc);
    }
    return blocProviders;
  }

  // On Generate Route
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.initial && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_) => const SignInPage(), settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => const SignInPage(), settings: settings);
  }
}

// Unify BlocProvider, routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
