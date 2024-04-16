import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/environment.dart';
import 'package:learning_shop_bloc/global.dart';
import 'package:learning_shop_bloc/common/routes/page_entity.dart';
import 'package:learning_shop_bloc/global_theme.dart';
import 'package:learning_shop_bloc/pages/home/home_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: GTheme.lightTheme,
          darkTheme: GTheme.darkTheme,
          themeMode: ThemeMode.system,
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}
