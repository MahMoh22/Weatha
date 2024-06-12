import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/core/theming/text_styles_manager.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';

class HoursList extends StatelessWidget {
  HoursList({super.key, required this.weather, required this.index});
  final AppPreferences appPreferences = instance();
  final Weather weather;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 24,
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
              padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: ColorManager.white.withOpacity(0.7),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.Hm().format(
                        DateTime.parse(
                          weather.forcast.forcastDay[index].hour[i].time,
                        ),
                      ),
                      style: TextStyles.font8LightBlack400,
                    ),
                    SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Image.network(
                          'https:${weather.forcast.forcastDay[index].hour[i].condition.icon}',
                        )),
                    Text(
                      appPreferences.getUnits() == 'C'
                          ? '${weather.forcast.forcastDay[index].hour[i].tempC.round().toString()} °'
                          : '${weather.forcast.forcastDay[index].hour[i].tempF.round().toString()} °',
                      style: TextStyles.font8LightBlack700,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
