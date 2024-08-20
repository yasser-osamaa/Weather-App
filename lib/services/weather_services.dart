import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  WeatherServices({required this.dio});
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '480bb9fa460a4238aea130755241808';
  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');

      Map<String, dynamic> jsonData = response.data;

      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops there was an error, try later');
    }
  }
}
