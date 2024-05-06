import 'package:learning_shop_bloc/common/entities/course.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  HomePageDots(this.index);
  final int index;
}

class HomePageCourseItem extends HomePageEvent {
  const HomePageCourseItem(this.courseItem);
  final List<CourseItem> courseItem;
}