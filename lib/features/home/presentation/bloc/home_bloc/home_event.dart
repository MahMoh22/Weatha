part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherByNameEvent extends HomeEvent {
  const GetWeatherByNameEvent();
}

class GetWeatherByLocationEvent extends HomeEvent {
  const GetWeatherByLocationEvent();
}

class GetLocationEvent extends HomeEvent {
  const GetLocationEvent();
}
