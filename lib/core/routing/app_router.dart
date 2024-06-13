import 'package:flutter/material.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/routing/routes.dart';
import 'package:my_weather/features/home/presentation/pages/home_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        initGetLocationModule();
        initByLocationModule();
        initByNameModule();
        initSearchNameModule();
        initSettingsModule();
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
