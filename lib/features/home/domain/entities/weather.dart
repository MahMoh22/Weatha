import 'package:my_weather/features/home/domain/entities/location.dart';
import 'package:my_weather/features/home/domain/entities/forcast.dart';

class Weather {
  Location location;
  Forcast forcast;
  Weather({required this.location, required this.forcast});
}
