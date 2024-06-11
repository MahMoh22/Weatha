import 'package:dartz/dartz.dart';
import 'package:my_weather/core/failure/failure.dart';
import 'package:my_weather/features/home/domain/repositories/weather_repository.dart';
import 'package:my_weather/features/home/domain/entities/search.dart';

class SearchCityUsecase {
  final WeatherRepository weatherRepository;
  SearchCityUsecase({required this.weatherRepository});
  Future<Either<Failure, List<Search>>> excute() async {
    return await weatherRepository.searchCity();
  }
}
