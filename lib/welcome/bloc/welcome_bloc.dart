import 'package:bloc/bloc.dart';
import 'package:learning_shop_bloc/welcome/bloc/welcome_event.dart';
import 'package:learning_shop_bloc/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
