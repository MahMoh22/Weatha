import 'package:my_weather/features/home/domain/entities/day_condition.dart';

class Day {
  String maxtempC;
  String maxtempF;
  String mintempC;
  String mintempF;
  String avgtempC;
  String avgtempF;
  String maxwindMph;
  String maxwindKph;
  String totalprecipMm;
  String totalprecipIn;
  String totalsnowCm;
  String avgvisKm;
  String avgvisMiles;
  String avghumidity;
  String dailyWillItRain;
  String dailyChanceOfRain;
  String dailyWillItSnow;
  String dailyChanceOfSnow;
  String conditionText;
  String conditionIcon;
  String conditionCode;
  String uv;
  DayCondition dayCondition;
  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.avghumidity,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.conditionText,
    required this.conditionIcon,
    required this.conditionCode,
    required this.uv,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.dayCondition,
  });
}
