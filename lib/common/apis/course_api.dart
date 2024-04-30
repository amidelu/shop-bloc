import 'package:learning_shop_bloc/common/utils/http_util.dart';

class CourseApi {
  static courseList() async {
    var courses = HttpUtil().postApi('api/courseList');

    print('Course List: $courses');
  }
}