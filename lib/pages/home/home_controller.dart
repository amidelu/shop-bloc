import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_shop_bloc/common/apis/course_api.dart';
import 'package:learning_shop_bloc/global.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_bloc.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_event.dart';

class HomeController {
  final BuildContext context;
  final userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});

  Future<void> init() async {
    // For checking if user is logged in
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseApi.courseList();
      if (result.code == 200) {
        // For checking if the context is available and removing warning
        if (context.mounted) {
          context.read<HomePageBloc>().add(HomePageCourseItem(result.data!));
        }
      } else {
        debugPrint('From $runtimeType: ${result.code}');
      }
    }
  }
}
