class WeatherLatLonModel {
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

  WeatherLatLonModel(
      {this.windSpeed,
        this.windDegrees,
        this.temp,
        this.humidity,
        this.sunset,
        this.minTemp,
        this.cloudPct,
        this.feelsLike,
        this.sunrise,
        this.maxTemp});

  WeatherLatLonModel.fromJson(Map<String, dynamic> json) {
    windSpeed = json['wind_speed'];
    windDegrees = json['wind_degrees'];
    temp = json['temp'];
    humidity = json['humidity'];
    sunset = json['sunset'];
    minTemp = json['min_temp'];
    cloudPct = json['cloud_pct'];
    feelsLike = json['feels_like'];
    sunrise = json['sunrise'];
    maxTemp = json['max_temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['wind_speed'] = windSpeed;
    data['wind_degrees'] = windDegrees;
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['sunset'] = sunset;
    data['min_temp'] = minTemp;
    data['cloud_pct'] = cloudPct;
    data['feels_like'] = feelsLike;
    data['sunrise'] = sunrise;
    data['max_temp'] = maxTemp;
    return data;
  }
}
