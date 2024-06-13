import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AppUnits extends StatelessWidget {
  AppUnits({super.key});
  final AppPreferences appPreferences = instance();
  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      textDirectionRTL: appPreferences.getLang() == 'ar' ? true : false,
      minWidth: 90.0,
      initialLabelIndex: appPreferences.getUnits() == 'C' ? 0 : 1,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: const ['°C', '°F'],
      activeBgColors: const [
        [ColorManager.gradientColor2],
        [ColorManager.gradientColor1]
      ],
      onToggle: (index) {
        if (index == 0) {
          appPreferences.setUnits('C');
          context.read<SettingsBloc>().add(UnitsCelesiusEvent());
        } else {
          appPreferences.setUnits('F');
          context.read<SettingsBloc>().add(UnitsFahrenheitEvent());
        }
      },
    );
  }
}
