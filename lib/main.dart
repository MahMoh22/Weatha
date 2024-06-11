import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/helper/my_bloc_observer.dart';
import 'package:my_weather/weather_app.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await initAppModule();
  runApp(WeatherApp());
}
