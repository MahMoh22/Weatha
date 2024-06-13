import 'package:my_weather/core/helper/extentions.dart';
import 'package:my_weather/features/home/data/models/home_response.dart';
import 'package:my_weather/features/home/domain/entities/astro.dart';
import 'package:my_weather/features/home/domain/entities/condition.dart';
import 'package:my_weather/features/home/domain/entities/day.dart';
import 'package:my_weather/features/home/domain/entities/forcast.dart';
import 'package:my_weather/features/home/domain/entities/forcast_day.dart';
import 'package:my_weather/features/home/domain/entities/hour.dart';
import 'package:my_weather/features/home/domain/entities/location.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';

extension ConditionMapper on ConditionResponse {
  Condition toEntity() => Condition(
        text: text.orEmpty(),
        icon: icon.orEmpty(),
        code: code.orZerro(),
      );
}

extension HourMapper on HourResponse {
  Hour toEntity() => Hour(
        time: time.orEmpty(),
        tempC: tempC.orZerro(),
        tempF: tempF.orZerro(),
        isDay: isDay.orZerro(),
        condition: condition!.toEntity(),
        windMph: windMph.orZerro(),
        windKph: windKph.orZerro(),
        windDegree: windDegree.orZerro(),
        windDir: windDir.orEmpty(),
        pressureMb: pressureMb.orZerro(),
        pressureIn: pressureIn.orZerro(),
        precipMm: precipMm.orZerro(),
        precipIn: precipIn.orZerro(),
        humidity: humidity.orZerro(),
        cloud: cloud.orZerro(),
        feelslikeC: feelslikeC.orZerro(),
        feelslikeF: feelslikeF.orZerro(),
        visKm: visKm.orZerro(),
        visMiles: visMiles.orZerro(),
        uv: uv.orZerro(),
        chanceOfRain: chanceOfRain.orZerro(),
        chanceOfSnow: chanceOfSnow.orZerro(),
      );
}

extension AstroMapper on AstroResponse {
  Astro toEntity() => Astro(
        sunrise: sunrise.orEmpty(),
        sunset: sunset.orEmpty(),
        moonrise: moonrise.orEmpty(),
        moonset: moonset.orEmpty(),
        moonPhase: moonPhase.orEmpty(),
        moonIllumination: moonIllumination.orZerro(),
        isMoonUp: isMoonUp.orZerro(),
        isSunUp: isSunUp.orZerro(),
      );
}

extension DayMapper on DayResponse {
  Day toEntity() => Day(
        maxtempC: maxtempC.orZerro(),
        maxtempF: maxtempF.orZerro(),
        mintempC: mintempC.orZerro(),
        mintempF: mintempF.orZerro(),
        avgtempC: avgtempC.orZerro(),
        avgtempF: avgtempF.orZerro(),
        maxwindMph: maxwindMph.orZerro(),
        maxwindKph: maxwindKph.orZerro(),
        totalprecipMm: totalprecipMm.orZerro(),
        totalprecipIn: totalprecipIn.orZerro(),
        totalsnowCm: totalsnowCm.orZerro(),
        avgvisKm: avgvisKm.orZerro(),
        avgvisMiles: avgvisMiles.orZerro(),
        avghumidity: avghumidity.orZerro(),
        dailyWillItRain: dailyWillItRain.orZerro(),
        dailyChanceOfRain: dailyChanceOfRain.orZerro(),
        dailyWillItSnow: dailyWillItSnow.orZerro(),
        dailyChanceOfSnow: dailyChanceOfSnow.orZerro(),
        condition: condition!.toEntity(),
        uv: uv.orZerro(),
      );
}

extension ForcastDayMapper on ForcastDayResponse {
  ForcastDay toEntity() => ForcastDay(
        date: date.orEmpty(),
        day: day!.toEntity(),
        astro: astro!.toEntity(),
        hour: hour!.map((e) => e.toEntity()).toList(),
      );
}

extension ForcastMapper on ForcastResponse {
  Forcast toEntity() => Forcast(
        forcastDay: forecastday!.map((e) => e.toEntity()).toList(),
      );
}

extension LocationMapper on LocationResponse {
  Location toEntity() => Location(
        name: name.orEmpty(),
        region: region.orEmpty(),
        country: country.orEmpty(),
        localtime: localtime.orEmpty(),
      );
}

extension WeatherMapper on WeatherResponse {
  Weather toEntity() => Weather(
        location: location!.toEntity(),
        forcast: forecast!.toEntity(),
      );
}
