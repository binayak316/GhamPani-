import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gham_pani/GetApiData/worker.dart';
import 'package:gham_pani/Pages/home.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? location;
  String? temperature;
  String? hum;
  String? air_speed;
  String? pressure;
  String? seaLevel;

  String? currentSituation;
  String? description;
  String? icon;
  String? city;

  // //creating instance object of worker class
  // Worker worker = Worker();
  // worker.air_speed
  void startApp() async {
    Worker worker = Worker(location: "Pokhara");
    await worker.getData();
    // print(worker.air_speed);
    // print(worker.humidity);
    temperature = worker.temp;
    hum = worker.humidity;
    air_speed = worker.air_speed;
    pressure = worker.pressure;
    seaLevel = worker.sea_level;
    currentSituation = worker.situation;
    description = worker.description;
    icon = worker.icon;
    city = worker.city;

    // throw the data to the home route
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temperature,
        "humidity_value": hum,
        "air_speed_value": air_speed,
        "pressure_value": pressure,
        "seaLevel_value": seaLevel,
        "current_situation": currentSituation,
        "description": description,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    print('loading page is initialized');
    startApp();
    super.initState();

    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 4, 109, 196),
              Color.fromARGB(255, 109, 243, 232),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(children: [
                  Container(
                    height: 130,
                    width: 130,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                  )
                ]),
              ),
              GradientText(
                'GhamPani',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                colors: [
                  Color.fromARGB(255, 4, 109, 196),
                  Color.fromARGB(255, 2, 65, 59),
                ],
              ),
              Container(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 109, 243, 232),
                  backgroundColor: Colors.blueAccent,
                ),
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
