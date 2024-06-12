part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsThemeLoadingState extends SettingsState {}

class SettingsThemeFailureState extends SettingsState {}

class SettingsThemeSuccessState extends SettingsState {}

class SettingsUnitsSuccessState extends SettingsState {}
