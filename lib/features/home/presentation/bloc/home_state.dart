part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final Weather weather;
  const HomeSuccessState(this.weather);
}

class HomeFailureState extends HomeState {
  final String message;
  const HomeFailureState(this.message);
}
