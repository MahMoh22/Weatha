import 'package:my_weather/features/home/domain/repositories/weather_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dartz/dartz.dart';
import 'package:my_weather/core/failure/failure.dart';
class GetLocationUsecase {
  final WeatherRepository weatherRepository;

  GetLocationUsecase({required this.weatherRepository});
  Future<Either<Failure, Position>> excute() async {
    return await weatherRepository.getCurrentPosition();
  }
}