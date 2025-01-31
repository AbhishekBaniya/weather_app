import '../utils/app_logger.dart';

class ApiLogTracer {
  // Singleton instance
  static final ApiLogTracer _instance = ApiLogTracer._internal();

  factory ApiLogTracer() => _instance;

  ApiLogTracer._internal();

  /// Log API request details
  void logRequest(String method, String url, {Map<String, dynamic>? body}) => Logger().info('API Request - Method: $method, URL: $url, Body: $body');

  /// Log API response details
  //void logResponse(String url, dynamic response, Duration duration) => Logger().info('API Response - URL: $url, Status Code: ${response.statusCode}, Duration: ${duration.inMilliseconds}ms, Response: $response');
  void logResponse(String url, dynamic response, Duration duration) => Logger().info('API Response - URL: $url, Duration: ${DateTime.now().difference(DateTime.now())}, Response: $response,');
}
