import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';
import 'package:my_weather/core/theming/text_styles_manager.dart';

class IconAndTemp extends StatelessWidget {
  const IconAndTemp({super.key, required this.weather, required this.index});
  final Weather weather;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https:${weather.forcast.forcastDay[index].day.condition.icon}',
            width: 100.w,
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          ), // main icon
          SizedBox(
            width: 80.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      weather.forcast.forcastDay[index].day.avgtempC
                          .round()
                          .toString(), // temp
                      style: TextStyles.font43LightBlack700
                          .copyWith(color: Theme.of(context).colorScheme.scrim),
                    ),
                    SizedBox(
                      width: 65.w,
                      child: Text(
                        weather.forcast.forcastDay[index].day.condition
                            .text, // description
                        style: TextStyles.font12LightBlack300.copyWith(
                            color: Theme.of(context).colorScheme.scrim),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Text(
                  '°C', // unit
                  style: TextStyles.font12LightBlack300
                      .copyWith(color: Theme.of(context).colorScheme.scrim),
                ),
              ],
            ),
          ),
          //horizontalSpace(10.w)
        ],
      ),
    );
  }
}
