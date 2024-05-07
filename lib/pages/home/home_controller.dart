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
    var result = await CourseApi.courseList();
    if (result.code == 200) {
      context.read<HomePageBloc>().add(HomePageCourseItem(result.data));
    } else {

    }
  }
}