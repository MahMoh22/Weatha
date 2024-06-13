import 'package:dartz/dartz.dart';
import 'package:my_weather/core/failure/failure.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';
import 'package:my_weather/features/home/domain/repositories/weather_repository.dart';

class WeatherByNameUsecase {
  final WeatherRepository weatherRepository;
  WeatherByNameUsecase({required this.weatherRepository});

  Future<Either<Failure, Weather>> excute() async {
    return await weatherRepository.byName();
  }
}
