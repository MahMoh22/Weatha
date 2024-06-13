import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';
import 'package:my_weather/features/home/domain/usecases/get_location_usecase.dart';
import 'package:my_weather/features/home/domain/usecases/search_city_usecase.dart';
import 'package:my_weather/features/home/domain/usecases/weather_by_location_usecase.dart';
import 'package:my_weather/features/home/domain/usecases/weather_by_name_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppPreferences appPreferences = instance();
  final WeatherByLocationUsecase weatherByLocationUsecase;
  final WeatherByNameUsecase weatherByNameUsecase;
  final GetLocationUsecase getLocationUsecase;
  final SearchCityUsecase searchCityUsecase;

  HomeBloc({
    required this.weatherByLocationUsecase,
    required this.weatherByNameUsecase,
    required this.getLocationUsecase,
    required this.searchCityUsecase,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetWeatherByNameEvent) {
        emit(HomeLoadingState());
        (await weatherByNameUsecase.excute()).fold(
          (failure) => emit(HomeFailureState(failure.message)),
          (weather) => emit(HomeSuccessState(weather)),
        );
      } else if (event is GetWeatherByLocationEvent) {
        emit(HomeLoadingState());
        (await weatherByLocationUsecase.excute()).fold(
          (failure) => emit(HomeFailureState(failure.message)),
          (weather) => emit(HomeSuccessState(weather)),
        );
      } else if (event is GetLocationEvent) {
        emit(HomeLoadingState());
        (await getLocationUsecase.excute()).fold(
            (failure) => emit(HomeFailureState(failure.message)), (position) {
          appPreferences.setLat(position.latitude.toString());
          appPreferences.setLong(position.longitude.toString());
          add(const GetWeatherByLocationEvent());
        });
      }
    });
  }
}
