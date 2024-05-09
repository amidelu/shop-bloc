import 'package:learning_shop_bloc/common/entities/course.dart';
import 'package:learning_shop_bloc/common/utils/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var courses = await HttpUtil().postApi('api/courseList');
    return CourseListResponseEntity.fromJson(courses);
  }
}