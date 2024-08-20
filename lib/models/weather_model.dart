class WeatherModel {
  final String cityName;
  final DateTime date;
  final String weatherCondition;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.weatherCondition,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
    );
  }
}
