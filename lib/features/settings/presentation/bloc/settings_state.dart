part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsTHemeLoadingState extends SettingsState {}

class SettingsTHemeFailureState extends SettingsState {}

class SettingsTHemeSuccessState extends SettingsState {}
