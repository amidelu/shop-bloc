import 'package:flutter/cupertino.dart';
import 'package:learning_shop_bloc/common/apis/course_api.dart';
import 'package:learning_shop_bloc/global.dart';

class HomeController {
  final BuildContext context;
  final userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});

  Future<void> init() async {
    var result = await CourseApi.courseList();
    if (result.code == 200) {

    } else {

    }
  }
}