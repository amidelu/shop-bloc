import 'package:learning_shop_bloc/common/entities/course.dart';

class HomePageState {
  const HomePageState({
    this.index = 0,
    this.courseList = const <CourseItem>[],
  });

  final int index;
  final List<CourseItem> courseList;

  HomePageState copyWith({int? index, List<CourseItem>? courseList}) {
    return HomePageState(
      index: index ?? this.index,
      courseList: courseList ?? this.courseList,
    );
  }
}
