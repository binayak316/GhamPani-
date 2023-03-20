import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';

class Worker {
  //declaring variables
  String? location;
  String? temp;
  String? humidity;
  String? air_speed;
  String? pressure;
  String? sea_level;

  String? situation;
  String? description;
  String? icon;

  // creating constructor

  Worker({this.location});

  // method that extracts data
  //getting data from api
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=98a5fbfba83a4d015e293dc36d211549"));
      Map data = jsonDecode(response.body);

      // getting temp, humidity, pressure, sea_level
      Map tem_data = data['main'];
      double get_temp = tem_data['temp'] - 273.15;
      String get_humidity = tem_data['humidity'].toString();
      String get_sea_level = tem_data['sea_level'].toString();

      String get_pressure = tem_data['pressure'].toString();

      //getting air speed
      Map wind_data = data['wind'];
      double get_airSpeed = wind_data['speed'] / 0.27777777777778;

      //getting weather data like main , decription and icon
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String get_situation = weather_main_data['main'];
      String get_description = weather_main_data['description'];

      //assigining the values to the declated variables
      temp = get_temp.toString();
      humidity = get_humidity.toString();
      sea_level = get_sea_level.toString();
      pressure = get_pressure.toString();
      air_speed = get_airSpeed.toString();
      situation = get_situation.toString();
      description = get_description;
      icon = weather_main_data['icon'].toString();
    } catch (e) {
      //yedi error ayo vane assign gareko value ma default text pathaidine
      //if user hits jpt location this exception will run
      temp = "N/A";
      humidity = "N/A";
      sea_level = "N/A";
      pressure = "N/A";
      air_speed = "N/A";
      situation = "N/A";
      description = "N/A";
      icon = "09d";
      ;
    }
  }
}
