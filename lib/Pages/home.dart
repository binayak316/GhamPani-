import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:gham_pani/GetApiData/worker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();

    print('home is initialized');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('widget destroyed');
  }

  @override
  Widget build(BuildContext context) {
    Map? info =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    String temp = ((info!['temp_value']).toString()).substring(0, 2);
    String hum = info['humidity_value'].toString();
    String airSpeed = ((info['air_speed_value']).toString()).substring(0, 3);
    String pressure = info['pressure_value'];
    String sea_level = info['seaLevel_value'];
    String currentSituation = info['current_situation'];
    String description = info['description'];
    String icon = info['icon_value'];
    String? city = info['city_value'];
    return Scaffold(
      body: SafeArea(
        child: Container(
          //white ko linear background rakhne
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/background_image.jpg"),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 1)],
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search with City ',
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ), //container for search bar
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 1)],
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '$temp\u00B0 C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Container(
                                child: Image.network(
                                  'https://openweathermap.org/img/wn/$icon@2x.png',
                                  height: 150,
                                  width: 180,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                ),
                              )
                              // Icon(
                              //   Icons.cloud,
                              //   color: Colors.white,
                              //   size: 120,
                              // )
                            ],
                          ),
                        ),
                      ),

                      //upper part black
                      Container(
                        height: 230,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '$city'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Icon(Icons.wind_power)],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Text('$airSpeed km /hr')],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Icon(Icons.h_plus_mobiledata)
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Text('$hum%')],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          // Icon(Icons.sunny),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.grey,
                                              child: Image.network(
                                                'https://openweathermap.org/img/wn/$icon@2x.png',
                                                height: 25,
                                                width: 25,
                                                fit: BoxFit.cover,
                                                filterQuality:
                                                    FilterQuality.high,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Text('$currentSituation')],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Icon(Icons.thermostat)],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Text('$temp\u00B0 C')],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Icon(Icons.pallet)],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Text('$pressure  Pa')],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Icon(Icons.water)],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [Text('$sea_level  Feet')],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ), //lower part white
                    ],
                  ),
                ),
              ), // container for body
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 1)],
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blue),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color.fromARGB(255, 177, 250, 243),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/logo.png'),
                            radius: 28,
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$description'.toUpperCase(),
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.cloudy_snowing,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.sunny, color: Colors.yellow)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ), //container for bottom bar
            ],
          ),
        ),
      ),
    );
  }
}
