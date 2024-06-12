import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/theming/theme_data_style.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AppPreferences appPreferences = instance();
  ThemeData themeStyle = ThemeDataStyle.light;
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      if (event is LightThemeEvent) {
        emit(SettingsInitial());

        themeStyle = ThemeDataStyle.light;
        emit(SettingsTHemeSuccessState());
      } else if (event is DarkThemeEvent) {
        emit(SettingsInitial());
        themeStyle = ThemeDataStyle.dark;
        emit(SettingsTHemeSuccessState());
      }
    });
  }
}
