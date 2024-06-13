import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:my_weather/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AppLang extends StatelessWidget {
  AppLang({super.key});
  final AppPreferences appPreferences = instance();
  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      /*minWidth: 90.0,
      cornerRadius: 20.0,
      activeBgColors: const [
        [ColorManager.gradientColor1],
        [ColorManager.gradientColor2]
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      initialLabelIndex: 1,
      totalSwitches: 2,
      labels: const ['En', 'Ar'],
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
      },*/
      textDirectionRTL: appPreferences.getLang() == 'ar' ? true : false,
      minWidth: 90.0,
      initialLabelIndex: appPreferences.getLang() == 'ar' ? 1 : 0,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: const ['En', 'Ar'],
      activeBgColors: const [
        [ColorManager.gradientColor2],
        [ColorManager.gradientColor1]
      ],
      onToggle: (index) {
        if (index == 0) {
          appPreferences.setLang('en');
          context.read<SettingsBloc>().add(LangEnglishEvent());
          context.read<HomeBloc>().add(const GetWeatherByLocationEvent());
          Navigator.of(context).pop();
        } else {
          appPreferences.setLang('ar');
          context.read<SettingsBloc>().add(LangArabicEvent());
          context.read<HomeBloc>().add(const GetWeatherByLocationEvent());
          Navigator.of(context).pop();
        }
      },
    );
  }
}
