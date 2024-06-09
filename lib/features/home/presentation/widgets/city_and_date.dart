import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/core/theming/text_styles_manager.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';

class CityAndDate extends StatelessWidget {
  const CityAndDate({super.key, required this.weather, required this.index});
  final Weather weather;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${weather.location.name},', // city
            style: TextStyles.font20LightBlack500,
          ),
          Text(
            weather.location.country, // country
            style: TextStyles.font20LightBlack500,
          ),
          Row(
            children: [
              Text(
                DateFormat.MMMEd().format(DateTime.parse(
                    weather.forcast.forcastDay[index].date)), // date
                style: TextStyles.font10Gray400,
              ),
              /*Text(
                ' ${weather.localtime}',
                style: TextStyles.font10Gray400,
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}
