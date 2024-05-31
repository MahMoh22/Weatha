import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/routing/app_router.dart';
import 'package:my_weather/core/routing/routes.dart';
import 'package:my_weather/core/theming/colors.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primaryColor: ColorManager.primaryColor,
          scaffoldBackgroundColor: ColorManager.backgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onboarding,
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
