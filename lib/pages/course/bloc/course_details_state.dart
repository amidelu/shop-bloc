import 'package:learning_shop_bloc/common/entities/course.dart';

final class CourseDetailsState {
  const CourseDetailsState({this.courseItem});
  final CourseItem? courseItem;

  CourseDetailsState copyWith({
    CourseItem? courseItem,
  }) {
    return CourseDetailsState(
      courseItem: courseItem ?? this.courseItem,
    );
  }
}
