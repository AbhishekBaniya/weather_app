import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../entities/get_weather_lat_lon_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherLatLonEntity>> getWeatherLatLon({required String lat, required String lon});
}
