import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/model/weather_forecast_model.dart';
import 'package:weatherapp/util/convert_icon.dart';

import 'forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data?.list;
  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  var formattedDate =
      new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);

  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$city, $country",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87),
          ),
          Text(
            "${Util.getFormattedDate(formattedDate)}",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: forecastList[0].weather![0].main,
                color: Colors.blue, size: 198),
          ),
          //Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.blue,),
          //Icon(Icons.wb_sunny, size: 195,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${forecastList[0].main!.temp}°C",
                  style: TextStyle(fontSize: 32
                  ),),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("${forecastList[0].weather![0].description!.toUpperCase()}"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecastList[0].wind!.speed!.toStringAsFixed(1)}Km/h"),
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                      //Icon(FontAwesomeIcons.temperatureHigh, size: 20,)
                      //Icon(Icons.wind_power, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text("${forecastList[0].main!.humidity!.toStringAsFixed(0)}%"),
                          Icon(FontAwesomeIcons.solidFaceGrinBeamSweat, size: 20, color: Colors.brown,)
                          //Icon(Icons.wind_power, size: 20, color: Colors.brown,)
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${forecastList[0].main!.tempMax!.toStringAsFixed(0)}°F"),
                          Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                          //Icon(Icons.wind_power, size: 20, color: Colors.brown,)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return midView;
}
