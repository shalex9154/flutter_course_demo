import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:tests_example/models/weather.dart';
import 'package:tests_example/services/weather_provider.dart';

class MockClient extends Mock implements http.Client {}

const successJSON = '{"coord":{"lon":36.23,"lat":49.99},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":2,"pressure":1030,"humidity":100,"temp_min":2,"temp_max":2},"visibility":10000,"wind":{"speed":3,"deg":100},"clouds":{"all":90},"dt":1574008274,"sys":{"type":1,"id":8905,"country":"UA","sunrise":1573966220,"sunset":1573998589},"timezone":7200,"id":706483,"name":"Kharkiv","cod":200}';
const url = 'https://api.openweathermap.org/data/2.5/weather?q=Kharkiv&units=metric&APPID=1ea55013049215603ece3fee22806975';

void main() {
  group('fetch weather', () {
    test('returns a Weather model if http call completes successfully', () async {
      final client = MockClient();

      when(client.get(url))
      .thenAnswer((_) async => http.Response(successJSON, 200));

      expect(await WeatherProvider.getCurrentWeather(client), const TypeMatcher<Weather>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      when(client.get(url))
      .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(WeatherProvider.getCurrentWeather(client), throwsException);
    });
  });
}