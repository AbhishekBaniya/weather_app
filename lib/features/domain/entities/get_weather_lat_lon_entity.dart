class WeatherLatLonEntity {
  double? windSpeed;
  int? windDegrees;
  int? temp;
  int? humidity;
  int? sunset;
  int? minTemp;
  int? cloudPct;
  int? feelsLike;
  int? sunrise;
  int? maxTemp;

  WeatherLatLonEntity({
    required this.windSpeed,
    required this.windDegrees,
    required this.temp,
    required this.humidity,
    required this.sunset,
    required this.minTemp,
    required this.cloudPct,
    required this.feelsLike,
    required this.sunrise,
    required this.maxTemp});
}
