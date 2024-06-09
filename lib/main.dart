import 'package:flutter/material.dart';
import 'package:my_weather/weather_app.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await initAppModule();
  runApp(WeatherApp());
}
