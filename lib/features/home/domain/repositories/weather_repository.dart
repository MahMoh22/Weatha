import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather/core/failure/failure.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> byLocation();
  Future<Either<Failure, Weather>> byName();
  Future<bool> handleLocationPermission();
  Future<Either<Failure, Position>> getCurrentPosition();
}
