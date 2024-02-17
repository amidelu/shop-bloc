import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_shop_bloc/pages/register/bloc/register_bloc.dart';

import 'sign_in/bloc/bloc/sign_in_bloc.dart';
import 'welcome/bloc/welcome_bloc.dart';


class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => RegisterBloc()),
  ];
}