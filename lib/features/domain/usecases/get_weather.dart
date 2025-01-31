import 'package:dartz/dartz.dart';
import 'package:weather/core/utils/app_logger.dart';
import '../../../core/error/failures.dart';
import '../repositories/weather_repository.dart';
import '../entities/get_weather_lat_lon_entity.dart';

class GetWeather {
  final WeatherRepository repository;

  // Constructor to inject the repository dependency
  GetWeather(this.repository);

  /// Fetches a portfolio, returning either a [Failure] or a list of [PortfolioEntity].
  Future<Either<Failure, WeatherLatLonEntity>> call({required String lat, required String lon,}) async {
    try {
      // Attempt to fetch the portfolio from the repository
      return await repository.getWeatherLatLon(lat: lat, lon: lon);
    } catch (e, stackTrace) {
      // Log the error and stack trace for debugging purposes
      Logger().error('Error in GetPortfolio call: $e');
      Logger().info('StackTrace: $stackTrace');

      // Return a generic Failure to the caller
      return Left(ServerFailure('Unable to fetch portfolio'));
    }
  }
}

