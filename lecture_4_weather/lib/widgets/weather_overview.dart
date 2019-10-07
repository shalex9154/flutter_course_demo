import 'package:flutter/material.dart';
import 'package:lecture_4_weather/models/weather.dart';
import 'package:lecture_4_weather/services/weather_provider.dart';
import 'package:lecture_4_weather/widgets/weather_container.dart';

class WeatherOverview extends StatelessWidget {
  final _weatherProvider = WeatherProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Overview"),
      ),
      body: Center(
        child: FutureBuilder<Weather>(
          future: _weatherProvider.getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return WeatherContainer(weather: snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
