part of 'course_details_bloc.dart';

@immutable
sealed class CourseDetailsEvent {
  const CourseDetailsEvent();
}

class TriggerCourseDetails extends CourseDetailsEvent{
  const TriggerCourseDetails(this.courseItem) : super();
  final CourseItem courseItem;
}