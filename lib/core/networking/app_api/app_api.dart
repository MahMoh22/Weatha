import 'package:dio/dio.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/helper/constants.dart';
import 'package:my_weather/features/home/data/models/home_response.dart';
import 'package:my_weather/features/home/data/models/search_response.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  //final AppPreferences appPreferences = instance();

  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @GET(
      '/forecast.json?key=${Constants.apiKey}&q=,&days=3&aqi=no&alerts=no&lang=')
//'/forecast.json?key=7b46ffb131da4cc4a60212247243005&q=${appPreferences.getLat()},${appPreferences.getLong()}&days=3&aqi=no&alerts=no&lang=${appPreferences.getLang()}'
  Future<WeatherResponse> byLocatin();

  @GET(
      '/forecast.json?key=${Constants.apiKey}&q=,&days=3&aqi=no&alerts=no&lang=')
//'/forecast.json?key=7b46ffb131da4cc4a60212247243005&q=${appPreferences.getName()}&days=3&aqi=no&alerts=no&lang=${appPreferences.getLang()}'
  Future<WeatherResponse> byName();

  @GET('http://api.weatherapi.com/v1/search.json?key=${Constants.apiKey}&q=')
//'http://api.weatherapi.com/v1/search.json?key=7b46ffb131da4cc4a60212247243005&q=${appPreferences.getSearchText()}'
  Future<SearchResponse> searchCity();
}
