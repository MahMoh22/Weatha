import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppMode extends StatelessWidget {
  const AppMode({super.key});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 70.w,
      minHeight: 30.h,
      initialLabelIndex: 0,
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
        print('switched to: $index');
      },
    );
  }
}
