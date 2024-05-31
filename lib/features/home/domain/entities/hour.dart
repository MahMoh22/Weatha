import 'package:my_weather/features/home/domain/entities/hour_condition.dart';

class Hour {
  String time;
  double tempC;
  double tempF;
  int isDay;
  double windMph;
  double windKph;
  double windDegree;
  String windDir;
  double pressureMb;
  double pressureIn;
  double precipMm;
  double precipIn;
  double humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  double chanceOfRain;
  double chanceOfSnow;
  double visKm;
  double visMiles;
  double uv;
  HourCondition condition;

  Hour({
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.chanceOfRain,
    required this.chanceOfSnow,
    required this.condition,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
  });
}
