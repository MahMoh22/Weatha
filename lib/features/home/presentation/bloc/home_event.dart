part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherByNameEvent extends HomeEvent {
  final String cityName;
  const GetWeatherByNameEvent(this.cityName);
}

class GetWeatherByLocationEvent extends HomeEvent {
  const GetWeatherByLocationEvent();
}

class GetLocationEvent extends HomeEvent {
  const GetLocationEvent();
}
