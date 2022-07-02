
import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_forecast_model.dart';
//import 'package:weatherapp/ui/bottom_view.dart';
import 'package:weatherapp/util/mid_view.dart';

import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Lucknow";

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);

    // forecastObject.then((weather) {
    //   print(weather.city);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        padding: EdgeInsets.fromLTRB(112, 4, 0, 4),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Text(
          "Made With Love ❤️ Vikramaditya",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              fontStyle: FontStyle.normal),
        ),
      )),
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
                builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){

                if(snapshot.hasData){
                  return Column(
                    children: <Widget>[
                      midView(snapshot),
                      //bottomView(snapshot, context)
                    ],
                  );

                }else {
                  return Container(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }

                }),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      margin: EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8)
          ),
        onSubmitted: (value) {
          setState((){
            _cityName = value;
            forecastObject = getWeather(cityName: _cityName);
          });

        },
        ),
      );

  }

  Future<WeatherForecastModel> getWeather({String? cityName}) =>
      new Network().getWeatherForecast(cityName: _cityName);
}
