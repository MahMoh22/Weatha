import 'package:dartz/dartz.dart';
import 'package:my_weather/core/failure/failure.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';
import 'package:my_weather/features/home/domain/repositories/weather_repository.dart';

class WeatherByLocationUsecase {
  final WeatherRepository weatherRepository;
  WeatherByLocationUsecase({required this.weatherRepository});

  Future<Either<Failure, Weather>> excute() async {
    return await weatherRepository.byLocation();
  }
}
