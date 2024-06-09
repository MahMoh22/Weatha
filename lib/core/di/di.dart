import 'package:get_it/get_it.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/networking/app_api/app_api.dart';
import 'package:my_weather/core/networking/dio_factory.dart';
import 'package:my_weather/core/networking/network_info.dart';
import 'package:my_weather/features/home/data/datasources/remote_datasource.dart';
import 'package:my_weather/features/home/data/repositories/weather_repository_impl.dart';
import 'package:my_weather/features/home/domain/repositories/weather_repository.dart';
import 'package:my_weather/features/home/domain/usecases/weather_by_location_usecase.dart';
import 'package:my_weather/features/home/domain/usecases/weather_by_name_usecase.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // app module, its module where we put all generic dependencies

  // shared prefs inestance
  final sheredPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sheredPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();

  // app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //Home remote data source
  instance.registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(appServiceClient: instance()));

  // Weather repository
  instance.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
      homeRemoteDatasource: instance(), networkInfo: instance()));
}

Future<void> initByLocationModule() async {
  if (!GetIt.I.isRegistered<WeatherByLocationUsecase>()) {
    instance.registerFactory<WeatherByLocationUsecase>(
        () => WeatherByLocationUsecase(weatherRepository: instance()));
    instance.registerFactory<HomeBloc>(() => HomeBloc(
        weatherByLocationUsecase: instance(),
        weatherByNameUsecase: instance()));
  }
}

Future<void> initByNameModule() async {
  if (!GetIt.I.isRegistered<WeatherByNameUsecase>()) {
    instance.registerFactory<WeatherByNameUsecase>(
        () => WeatherByNameUsecase(weatherRepository: instance()));
  }
}
