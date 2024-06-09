import 'package:json_annotation/json_annotation.dart';
part 'home_response.g.dart';

// Condition
@JsonSerializable()
class ConditionResponse {
  @JsonKey(name: 'text')
  String? text;
  @JsonKey(name: 'icon')
  String? icon;
  @JsonKey(name: 'code')
  int? code;
  ConditionResponse(this.text, this.icon, this.code);

  //from json
  factory ConditionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConditionResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$ConditionResponseToJson(this);
}

// Hour
@JsonSerializable()
class HourResponse {
  @JsonKey(name: 'time')
  String? time;
  @JsonKey(name: 'temp_c')
  double? tempC;
  @JsonKey(name: 'temp_f')
  double? tempF;
  @JsonKey(name: 'is_day')
  int? isDay;
  @JsonKey(name: 'condition')
  ConditionResponse? condition;
  @JsonKey(name: 'wind_mph')
  double? windMph;
  @JsonKey(name: 'wind_kph')
  double? windKph;
  @JsonKey(name: 'wind_degree')
  double? windDegree;
  @JsonKey(name: 'wind_dir')
  String? windDir;
  @JsonKey(name: 'pressure_mb')
  double? pressureMb;
  @JsonKey(name: 'pressure_in')
  double? pressureIn;
  @JsonKey(name: 'precip_mm')
  double? precipMm;
  @JsonKey(name: 'precip_in')
  double? precipIn;
  @JsonKey(name: 'humidity')
  double? humidity;
  @JsonKey(name: 'cloud')
  int? cloud;
  @JsonKey(name: 'feelslike_c')
  double? feelslikeC;
  @JsonKey(name: 'feelslike_f')
  double? feelslikeF;
  @JsonKey(name: 'chance_of_rain')
  double? chanceOfRain;
  @JsonKey(name: 'chance_of_snow')
  double? chanceOfSnow;
  @JsonKey(name: 'vis_km')
  double? visKm;
  @JsonKey(name: 'vis_miles')
  double? visMiles;
  @JsonKey(name: 'uv')
  double? uv;

  HourResponse({
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.chanceOfRain,
    this.chanceOfSnow,
    this.condition,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
  });

  //from json
  factory HourResponse.fromJson(Map<String, dynamic> json) =>
      _$HourResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$HourResponseToJson(this);
}

// Astro
@JsonSerializable()
class AstroResponse {
  @JsonKey(name: 'sunrise')
  String? sunrise;
  @JsonKey(name: 'sunset')
  String? sunset;
  @JsonKey(name: 'moonrise')
  String? moonrise;
  @JsonKey(name: 'moonset')
  String? moonset;
  @JsonKey(name: 'moon_phase')
  String? moonPhase;
  @JsonKey(name: 'moon_illumination')
  int? moonIllumination;
  @JsonKey(name: 'is_moon_up')
  int? isMoonUp;
  @JsonKey(name: 'is_sun_up')
  int? isSunUp;
  AstroResponse({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });
  //from json
  factory AstroResponse.fromJson(Map<String, dynamic> json) =>
      _$AstroResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$AstroResponseToJson(this);
}

// Day
@JsonSerializable()
class DayResponse {
  @JsonKey(name: 'maxtemp_c')
  double? maxtempC;
  @JsonKey(name: 'maxtemp_f')
  double? maxtempF;
  @JsonKey(name: 'mintemp_c')
  double? mintempC;
  @JsonKey(name: 'mintemp_f')
  double? mintempF;
  @JsonKey(name: 'avgtemp_c')
  double? avgtempC;
  @JsonKey(name: 'avgtemp_f')
  double? avgtempF;
  @JsonKey(name: 'maxwind_mph')
  double? maxwindMph;
  @JsonKey(name: 'maxwind_kph')
  double? maxwindKph;
  @JsonKey(name: 'totalprecip_mm')
  double? totalprecipMm;
  @JsonKey(name: 'totalprecip_in')
  double? totalprecipIn;
  @JsonKey(name: 'totalsnow_cm')
  double? totalsnowCm;
  @JsonKey(name: 'avgvis_km')
  double? avgvisKm;
  @JsonKey(name: 'avgvis_miles')
  double? avgvisMiles;
  @JsonKey(name: 'avghumidity')
  double? avghumidity;
  @JsonKey(name: 'daily_will_it_rain')
  double? dailyWillItRain;
  @JsonKey(name: 'daily_chance_of_rain')
  double? dailyChanceOfRain;
  @JsonKey(name: 'daily_will_it_snow')
  double? dailyWillItSnow;
  @JsonKey(name: 'daily_chance_of_snow')
  double? dailyChanceOfSnow;
  @JsonKey(name: 'condition')
  ConditionResponse? condition;
  @JsonKey(name: 'uv')
  double? uv;
  DayResponse({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });
  //from json
  factory DayResponse.fromJson(Map<String, dynamic> json) =>
      _$DayResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$DayResponseToJson(this);
}

// ForcastDay
@JsonSerializable()
class ForcastDayResponse {
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'day')
  DayResponse? day;
  @JsonKey(name: 'astro')
  AstroResponse? astro;
  @JsonKey(name: 'hour')
  List<HourResponse>? hour;
  ForcastDayResponse({
    this.date,
    this.day,
    this.astro,
    this.hour,
  });
  //from json
  factory ForcastDayResponse.fromJson(Map<String, dynamic> json) =>
      _$ForcastDayResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$ForcastDayResponseToJson(this);
}

// Forcast
@JsonSerializable()
class ForcastResponse {
  @JsonKey(name: 'forecastday')
  List<ForcastDayResponse>? forecastday;
  ForcastResponse({
    this.forecastday,
  });
  //from json
  factory ForcastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForcastResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$ForcastResponseToJson(this);
}

// Location
@JsonSerializable()
class LocationResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'region')
  String? region;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'localtime')
  String? localtime;
  LocationResponse({
    this.name,
    this.region,
    this.country,
    this.localtime,
  });
  //from json
  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}

// Weather
@JsonSerializable()
class WeatherResponse {
  @JsonKey(name: 'location')
  LocationResponse? location;
  @JsonKey(name: 'forecast')
  ForcastResponse? forecast;
  WeatherResponse({
    this.location,
    this.forecast,
  });
  //from json
  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
