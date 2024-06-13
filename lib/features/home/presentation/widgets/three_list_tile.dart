import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/helper/extentions.dart';
import 'package:my_weather/core/theming/assets_manager.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';
import 'package:my_weather/features/home/presentation/widgets/list_tile_container.dart';

class ThreeListTile extends StatelessWidget {
  ThreeListTile({super.key, required this.weather, required this.index});
  final AppPreferences appPreferences = instance();
  final Weather weather;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      child: Column(children: [
        // rainfall
        ListTileContainer(
            image: ImagesManager.rainIc,
            title: 'RainFall'.tr(context),
            trailing: weather.forcast.forcastDay[index].day.dailyChanceOfRain
                    .round()
                    .toString() +
                'percent'.tr(context)),
        // wind speed
        ListTileContainer(
            image: ImagesManager.windIc,
            title: 'Wind'.tr(context),
            trailing: appPreferences.getUnits() == 'C'
                ? weather.forcast.forcastDay[index].day.maxwindKph
                        .round()
                        .toString() +
                    'km/h'.tr(context)
                : weather.forcast.forcastDay[index].day.maxwindMph
                        .round()
                        .toString() +
                    'm/h'.tr(context)),
        // humidity
        ListTileContainer(
          image: ImagesManager.humidityIc,
          title: 'Humidity'.tr(context),
          trailing: weather.forcast.forcastDay[index].day.avghumidity
                  .round()
                  .toString() +
              'percent'.tr(context),
          isTop: true,
        ),
      ]),
    );
  }
}
