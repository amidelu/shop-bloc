import 'package:bloc/bloc.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_event.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageState> emit) {
    emit(state.copyWith(state.index));
  }
}