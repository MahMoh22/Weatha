part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LightThemeEvent extends SettingsEvent {}

class DarkThemeEvent extends SettingsEvent {}

class UnitsCelesiusEvent extends SettingsEvent {}

class UnitsFahrenheitEvent extends SettingsEvent {}
