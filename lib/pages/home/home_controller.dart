import 'package:flutter/cupertino.dart';
import 'package:learning_shop_bloc/common/apis/course_api.dart';
import 'package:learning_shop_bloc/global.dart';

class HomeController {
  final BuildContext context;
  final userProfile = Global.storageService.getUserProfile();

  HomeController({required this.context});
  void init() async {
    await CourseApi.courseList();
  }
}