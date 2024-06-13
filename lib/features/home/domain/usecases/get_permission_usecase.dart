import 'package:my_weather/features/home/domain/repositories/weather_repository.dart';

class GetPermissionUsecase {
  final WeatherRepository weatherRepository;
  GetPermissionUsecase({required this.weatherRepository});

  Future<bool> excute() async {
    return await weatherRepository.handleLocationPermission();
  }
}
