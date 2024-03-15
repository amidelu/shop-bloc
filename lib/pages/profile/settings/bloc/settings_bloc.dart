import 'package:bloc/bloc.dart';
import 'package:learning_shop_bloc/pages/profile/settings/bloc/settings_event.dart';
import 'package:learning_shop_bloc/pages/profile/settings/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingsEvent event, Emitter<SettingsState> emit) {
    emit(const SettingsState());
  }
}