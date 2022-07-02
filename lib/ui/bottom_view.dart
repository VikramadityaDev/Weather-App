// import 'package:flutter/material.dart';
// import 'package:weatherapp/model/weather_forecast_model.dart';
//
//
// Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
//   var forecastList = snapshot.data!.list;
//
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: <Widget>[
//       Text("5-Day Weather Forecast".toUpperCase(),
//       style: TextStyle(
//         fontSize: 14,
//         color: Colors.black87
//       ),),
//       Container(
//         height: 170,
//         padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
//         child: ListView.separated(
//             itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount),
//       )
//     ],
//   );
//
// }