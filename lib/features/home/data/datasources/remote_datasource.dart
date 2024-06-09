import 'package:my_weather/core/networking/app_api/app_api.dart';
import 'package:my_weather/features/home/data/models/home_response.dart';

abstract class HomeRemoteDatasource {
  Future<WeatherResponse> byLocation();
  Future<WeatherResponse> byName();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final AppServiceClient appServiceClient;
  HomeRemoteDatasourceImpl({required this.appServiceClient});

  @override
  Future<WeatherResponse> byLocation() async {
    return await appServiceClient.byLocatin();
  }

  @override
  Future<WeatherResponse> byName() async {
    return await appServiceClient.byName();
  }
}
