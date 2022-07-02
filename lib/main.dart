import 'package:flutter/material.dart';
import 'package:weatherapp/weather_forecast.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WeatherForecast(),
  ));
}
