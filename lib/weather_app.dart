import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/routing/app_router.dart';
import 'package:my_weather/core/routing/routes.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          instance<HomeBloc>()..add(const GetLocationEvent()),
      child: ScreenUtilInit(
        designSize: const Size(218, 471),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Weather App',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          onGenerateRoute: _appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
