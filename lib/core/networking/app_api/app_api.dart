import 'package:dio/dio.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/helper/constants.dart';
import 'package:my_weather/features/home/data/models/home_response.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  //final AppPreferences appPreferences = instance();

  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @GET(
      '/forecast.json?key=${Constants.apiKey}&q=,&days=3&aqi=no&alerts=no&lang=')
  Future<WeatherResponse> byLocatin();
  @GET(
      '/forecast.json?key=${Constants.apiKey}&q=,&days=3&aqi=no&alerts=no&lang=')
  Future<WeatherResponse> byName();
}
