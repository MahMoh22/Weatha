import 'package:flutter/material.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AppUnits extends StatelessWidget {
  const AppUnits({super.key});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 90.0,
      initialLabelIndex: 1,
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
        print('switched to: $index');
      },
    );
  }
}
