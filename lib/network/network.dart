import 'dart:convert';

import 'package:http/http.dart';

import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';


class Network {
  Future<WeatherForecastModel> getWeatherForecast({String? cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q="+cityName!+"&appid="+Util.appId+"&units=metric";

    final response = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.parse(finalUrl)}");

    if (response.statusCode == 200) {
      print("Weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else {
      throw Exception("Error getting weather");
    }
  }
}