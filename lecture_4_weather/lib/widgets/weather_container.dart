import 'package:flutter/material.dart';
import 'package:lecture_4_weather/models/weather.dart';

class WeatherContainer extends StatelessWidget {
  final Weather weather;

  WeatherContainer({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final separator = orientation == Orientation.portrait ? ' - ' : '\n';
        final widgets = <Widget>[
          Text(
            '${weather.locationName}$separator${weather.temperature} °C',
            style: Theme.of(context).textTheme.display1,
            textAlign: TextAlign.center,
          ),
          Image.network(weather.iconUrl),
        ];
        if (orientation == Orientation.portrait) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets,
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets,
          );
        }
      },
    );
  }
}
