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
        emit(SettingsThemeSuccessState());
      } else if (event is DarkThemeEvent) {
        emit(SettingsInitial());
        themeStyle = ThemeDataStyle.dark;
        emit(SettingsThemeSuccessState());
      } else if (event is UnitsFahrenheitEvent) {
        emit(SettingsInitial());
        appPreferences.setUnits('F');
        emit(SettingsUnitsSuccessState());
      } else if (event is UnitsCelesiusEvent) {
        emit(SettingsInitial());
        appPreferences.setUnits('C');
        emit(SettingsUnitsSuccessState());
      } else if (event is LangEnglishEvent) {
        emit(SettingsInitial());
        appPreferences.setLang('en');
        emit(SettingsLangSuccessState());
      } else if (event is LangArabicEvent) {
        emit(SettingsInitial());
        appPreferences.setLang('ar');
        emit(SettingsLangSuccessState());
      }
    });
  }
}
