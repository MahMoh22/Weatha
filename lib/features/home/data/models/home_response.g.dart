// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionResponse _$ConditionResponseFromJson(Map<String, dynamic> json) =>
    ConditionResponse(
      json['text'] as String?,
      json['icon'] as String?,
      (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ConditionResponseToJson(ConditionResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

HourResponse _$HourResponseFromJson(Map<String, dynamic> json) => HourResponse(
      time: json['time'] as String?,
      tempC: (json['temp_c'] as num?)?.toDouble(),
      tempF: (json['temp_f'] as num?)?.toDouble(),
      isDay: (json['is_day'] as num?)?.toInt(),
      windMph: (json['wind_mph'] as num?)?.toDouble(),
      windKph: (json['wind_kph'] as num?)?.toDouble(),
      windDegree: (json['wind_degree'] as num?)?.toDouble(),
      windDir: json['wind_dir'] as String?,
      chanceOfRain: (json['chance_of_rain'] as num?)?.toDouble(),
      chanceOfSnow: (json['chance_of_snow'] as num?)?.toDouble(),
      condition: json['condition'] == null
          ? null
          : ConditionResponse.fromJson(
              json['condition'] as Map<String, dynamic>),
      pressureMb: (json['pressure_mb'] as num?)?.toDouble(),
      pressureIn: (json['pressure_in'] as num?)?.toDouble(),
      precipMm: (json['precip_mm'] as num?)?.toDouble(),
      precipIn: (json['precip_in'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      cloud: (json['cloud'] as num?)?.toInt(),
      feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
      feelslikeF: (json['feelslike_f'] as num?)?.toDouble(),
      visKm: (json['vis_km'] as num?)?.toDouble(),
      visMiles: (json['vis_miles'] as num?)?.toDouble(),
      uv: (json['uv'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HourResponseToJson(HourResponse instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslikeC,
      'feelslike_f': instance.feelslikeF,
      'chance_of_rain': instance.chanceOfRain,
      'chance_of_snow': instance.chanceOfSnow,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'uv': instance.uv,
    };

AstroResponse _$AstroResponseFromJson(Map<String, dynamic> json) =>
    AstroResponse(
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      moonrise: json['moonrise'] as String?,
      moonset: json['moonset'] as String?,
      moonPhase: json['moon_phase'] as String?,
      moonIllumination: (json['moon_illumination'] as num?)?.toInt(),
      isMoonUp: (json['is_moon_up'] as num?)?.toInt(),
      isSunUp: (json['is_sun_up'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AstroResponseToJson(AstroResponse instance) =>
    <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'moon_illumination': instance.moonIllumination,
      'is_moon_up': instance.isMoonUp,
      'is_sun_up': instance.isSunUp,
    };

DayResponse _$DayResponseFromJson(Map<String, dynamic> json) => DayResponse(
      maxtempC: (json['maxtemp_c'] as num?)?.toDouble(),
      maxtempF: (json['maxtemp_f'] as num?)?.toDouble(),
      mintempC: (json['mintemp_c'] as num?)?.toDouble(),
      mintempF: (json['mintemp_f'] as num?)?.toDouble(),
      avgtempC: (json['avgtemp_c'] as num?)?.toDouble(),
      avgtempF: (json['avgtemp_f'] as num?)?.toDouble(),
      maxwindMph: (json['maxwind_mph'] as num?)?.toDouble(),
      maxwindKph: (json['maxwind_kph'] as num?)?.toDouble(),
      totalprecipMm: (json['totalprecip_mm'] as num?)?.toDouble(),
      totalprecipIn: (json['totalprecip_in'] as num?)?.toDouble(),
      totalsnowCm: (json['totalsnow_cm'] as num?)?.toDouble(),
      avgvisKm: (json['avgvis_km'] as num?)?.toDouble(),
      avgvisMiles: (json['avgvis_miles'] as num?)?.toDouble(),
      avghumidity: (json['avghumidity'] as num?)?.toDouble(),
      dailyWillItRain: (json['daily_will_it_rain'] as num?)?.toDouble(),
      dailyChanceOfRain: (json['daily_chance_of_rain'] as num?)?.toDouble(),
      dailyWillItSnow: (json['daily_will_it_snow'] as num?)?.toDouble(),
      dailyChanceOfSnow: (json['daily_chance_of_snow'] as num?)?.toDouble(),
      condition: json['condition'] == null
          ? null
          : ConditionResponse.fromJson(
              json['condition'] as Map<String, dynamic>),
      uv: (json['uv'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DayResponseToJson(DayResponse instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxtempC,
      'maxtemp_f': instance.maxtempF,
      'mintemp_c': instance.mintempC,
      'mintemp_f': instance.mintempF,
      'avgtemp_c': instance.avgtempC,
      'avgtemp_f': instance.avgtempF,
      'maxwind_mph': instance.maxwindMph,
      'maxwind_kph': instance.maxwindKph,
      'totalprecip_mm': instance.totalprecipMm,
      'totalprecip_in': instance.totalprecipIn,
      'totalsnow_cm': instance.totalsnowCm,
      'avgvis_km': instance.avgvisKm,
      'avgvis_miles': instance.avgvisMiles,
      'avghumidity': instance.avghumidity,
      'daily_will_it_rain': instance.dailyWillItRain,
      'daily_chance_of_rain': instance.dailyChanceOfRain,
      'daily_will_it_snow': instance.dailyWillItSnow,
      'daily_chance_of_snow': instance.dailyChanceOfSnow,
      'condition': instance.condition,
      'uv': instance.uv,
    };

ForcastDayResponse _$ForcastDayResponseFromJson(Map<String, dynamic> json) =>
    ForcastDayResponse(
      date: json['date'] as String?,
      day: json['day'] == null
          ? null
          : DayResponse.fromJson(json['day'] as Map<String, dynamic>),
      astro: json['astro'] == null
          ? null
          : AstroResponse.fromJson(json['astro'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>?)
          ?.map((e) => HourResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForcastDayResponseToJson(ForcastDayResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };

ForcastResponse _$ForcastResponseFromJson(Map<String, dynamic> json) =>
    ForcastResponse(
      forecastday: (json['forecastday'] as List<dynamic>?)
          ?.map((e) => ForcastDayResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForcastResponseToJson(ForcastResponse instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastday,
    };

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      name: json['name'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
      localtime: json['localtime'] as String?,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'localtime': instance.localtime,
    };

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      location: json['location'] == null
          ? null
          : LocationResponse.fromJson(json['location'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : ForcastResponse.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'location': instance.location,
      'forecast': instance.forecast,
    };
