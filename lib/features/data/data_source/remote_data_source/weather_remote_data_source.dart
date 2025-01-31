import 'package:weather/core/network/endpoints.dart';
import 'package:weather/features/data/model/weather_lat_lon_model.dart';

import '../../../../config/res/strings.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_log_tracer.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/app_logger.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherLatLonModel> getWeatherLatLon({required String endPoint, required String lat, required String lon});
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final DioClient dioClient;

  WeatherRemoteDataSourceImpl(this.dioClient);

  @override
  Future<WeatherLatLonModel> getWeatherLatLon({required String endPoint,required String lat, required String lon,}) async {
    try {
      final response = await dioClient.getRequest(endPoint,
        headers: {
          'X-Api-Key': Strings.apiKeyPart+EndPoints.key,
        },
        queryParams: {
        'lat': lat,
        'lon': lon,
      },);
      //dioClient.logRequest('GET', endPoint);
      //dioClient.logResponse(endPoint, response);
     
      ApiLogTracer().logResponse(endPoint, response.data, DateTime.now().difference(DateTime.now()));
      if(response.data is Map<String, dynamic>){
        return WeatherLatLonModel.fromJson(response.data);
      } else {
        throw Exception('Unexpected response format');
      }
      //return (response.data as List<dynamic>).map((item) => WeatherLatLonModel.fromJson(item)).toList(growable: false);
    } catch (error) {
      Logger().error('Failed to fetch data: $error');
      throw ServerException();
    }
  }
}
