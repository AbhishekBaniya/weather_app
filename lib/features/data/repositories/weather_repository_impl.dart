import '../../../core/error/failures.dart';
import '../../../core/network/endpoints.dart';
import '../../domain/entities/get_weather_lat_lon_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../data_source/remote_data_source/weather_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, WeatherLatLonEntity>> getWeatherLatLon({required String lat, required String lon}) async {
    try {
      final weatherLatLonModels = await remoteDataSource.getWeatherLatLon(endPoint: EndPoints.weather, lat: lat, lon: lat);
      return Right(WeatherLatLonEntity(
          windSpeed: weatherLatLonModels.windSpeed,
          windDegrees: weatherLatLonModels.windDegrees,
          temp: weatherLatLonModels.temp,
          humidity: weatherLatLonModels.humidity,
          sunset: weatherLatLonModels.sunset,
          minTemp: weatherLatLonModels.minTemp,
          cloudPct: weatherLatLonModels.cloudPct,
          feelsLike: weatherLatLonModels.feelsLike,
          sunrise: weatherLatLonModels.sunrise,
          maxTemp: weatherLatLonModels.maxTemp));
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
