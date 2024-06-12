import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/theming/theme_data_style.dart';
import 'package:my_weather/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppMode extends StatelessWidget {
  AppMode({super.key});
  final AppPreferences appPreferences = instance();
  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 70.w,
      minHeight: 30.h,
      initialLabelIndex:
          context.read<SettingsBloc>().themeStyle == ThemeDataStyle.light
              ? 1
              : 0,
      cornerRadius: 20.r,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      icons: const [
        FontAwesomeIcons.lightbulb,
        FontAwesomeIcons.solidLightbulb,
      ],
      iconSize: 30,
      activeBgColors: const [
        [Colors.black45, Colors.black26],
        [Colors.yellow, Colors.orange]
      ],
      animate:
          true, // with just animate set to true, default curve = Curves.easeIn
      curve: Curves
          .bounceInOut, // animate must be set to true when using custom curve
      onToggle: (index) {
        if (index == 0) {
          appPreferences.setTheme('dark');
          context.read<SettingsBloc>().add(DarkThemeEvent());
        } else {
          appPreferences.setTheme('light');
          context.read<SettingsBloc>().add(LightThemeEvent());
        }
      },
    );
  }
}
