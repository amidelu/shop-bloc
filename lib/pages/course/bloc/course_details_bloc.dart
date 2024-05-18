import 'package:bloc/bloc.dart';
import 'package:learning_shop_bloc/common/entities/course.dart';
import 'package:meta/meta.dart';

import 'course_details_state.dart';

part 'course_details_event.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc() : super(const CourseDetailsState()) {
    on<TriggerCourseDetails>(_triggerCourseDetails);
  }

  void _triggerCourseDetails(TriggerCourseDetails event, Emitter<CourseDetailsState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
