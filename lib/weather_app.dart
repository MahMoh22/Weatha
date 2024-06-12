import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/routing/app_router.dart';
import 'package:my_weather/core/routing/routes.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:my_weather/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:my_weather/features/settings/presentation/bloc/settings_bloc.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
            create: (context) =>
                instance<HomeBloc>()..add(const GetLocationEvent())),
        BlocProvider<SearchBloc>(create: (context) => instance<SearchBloc>()),
        /*BlocProvider<SettingsBloc>(
            create: (context) => 
            instance<SettingsBloc>()),*/
      ],
      child: ScreenUtilInit(
        designSize: const Size(218, 471),
        minTextAdapt: true,
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) => MaterialApp(
            title: 'Weather App',
            theme: context.read<SettingsBloc>().themeStyle,
            //darkTheme: ThemeDataStyle.dark,
            //themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.home,
            onGenerateRoute: _appRouter.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
