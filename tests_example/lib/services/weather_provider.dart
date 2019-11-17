import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tests_example/models/weather.dart';

class WeatherProvider {
  static Future<Weather> getCurrentWeather(http.Client client) async {
    final response = await client.get(
        'https://api.openweathermap.org/data/2.5/weather?q=Kharkiv&units=metric&APPID=1ea55013049215603ece3fee22806975');
    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
