import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';
import 'package:my_weather/features/home/presentation/widgets/city_and_date.dart';
import 'package:my_weather/features/home/presentation/widgets/hours_list.dart';
import 'package:my_weather/features/home/presentation/widgets/icon_and_temp.dart';
import 'package:my_weather/features/home/presentation/widgets/three_list_tile.dart';

class TodayView extends StatelessWidget {
  const TodayView({super.key, required this.weather, required this.index});
  final Weather weather;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: ColorManager.gradientBackgroundColor,
      ),
      child: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 6.h, bottom: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*HomeSearchBar(
                title: 'Today',
              ),*/
              CityAndDate(
                weather: weather,
                index: index,
              ),
              IconAndTemp(
                weather: weather,
                index: index,
              ),
              ThreeListTile(
                weather: weather,
                index: index,
              ),
              HoursList(
                weather: weather,
                index: index,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
