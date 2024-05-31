import 'package:my_weather/features/home/domain/entities/astro.dart';
import 'package:my_weather/features/home/domain/entities/day.dart';
import 'package:my_weather/features/home/domain/entities/hour.dart';

class ForcastDay {
  String date;
  Day day;
  Astro astro;
  List<Hour> hour;

  ForcastDay({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });
}
